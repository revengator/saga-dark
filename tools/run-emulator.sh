#!/usr/bin/env bash
# run-emulator.sh — wrapper para arrancar Fuse o ZEsarUX con el snapshot/tap correcto
#
# Uso:
#   tools/run-emulator.sh [--debug] <ruta-a-.sna|.z80|.tap>
#
# Detecta automáticamente la máquina (48K o +2 128K) por la ruta:
#   - ".../128k-plus2-..." o ".../plus2/..." o ".../+2..."  → +2 128K
#   - resto                                                 → 48K
#
# Con --debug usa ZEsarUX explícitamente (debugger avanzado).
#
# macOS specifics:
#   * FuseX vía LaunchServices respeta el sandbox al pasarle un fichero por
#     argv, PERO no acepta el flag `-m plus2`, lo que provoca que un .sna
#     128K se cargue en una máquina 48K sin paging hardware. Resultado: el
#     bank-swap no funciona y el juego se rompe en silencio.
#   * Para +2 128K, lanzamos ZEsarUX desde dentro de `/Applications/zesarux.app`
#     (no la copia de Homebrew) — encuentra sus ROMs en `../Resources/` y no
#     pasa por el sandbox, así que lee `/Volumes/...` y `/tmp/...` sin
#     problema.

set -euo pipefail

DEBUG=0
if [[ "${1:-}" == "--debug" ]]; then
  DEBUG=1
  shift
fi

if [[ $# -lt 1 ]]; then
  cat >&2 <<EOF
Uso: $0 [--debug] <ruta-a-.sna|.z80|.tap>

Ejemplos:
  $0 original-48k/build/dark1.sna
  $0 remakes/128k-plus2-platformer/build/saga-platformer-128k.sna
  $0 --debug original-48k/snapshots/dark1/dark1.sna
EOF
  exit 1
fi

FILE="$1"

if [[ ! -f "$FILE" ]]; then
  echo "Error: no existe '$FILE'" >&2
  exit 1
fi

# Resolve to absolute path (so cd-ing into .app/Contents/MacOS doesn't break it)
case "$FILE" in
  /*) ABS_FILE="$FILE" ;;
  *)  ABS_FILE="$(cd "$(dirname "$FILE")" && pwd)/$(basename "$FILE")" ;;
esac

# Detection
case "$FILE" in
  *128k-plus2*|*plus2*|*+2*)
    IS_PLUS2=1
    MACHINE_FUSE="plus2"
    MACHINE_ZX_BUNDLE="P2"      # Spectrum +2
    MACHINE_ZX_CLI="128k"       # zesarux CLI uses lowercase ids
    ;;
  *)
    IS_PLUS2=0
    MACHINE_FUSE="48"
    MACHINE_ZX_BUNDLE="48k"
    MACHINE_ZX_CLI="48k"
    ;;
esac

case "$FILE" in
  *.tap) FUSE_FLAG="-t"; ZX_FLAG="--tape" ;;
  *)     FUSE_FLAG="-s"; ZX_FLAG="--snap" ;;
esac

# ---------------------------------------------------------------------------
# Try ZEsarUX from inside its macOS .app bundle (preferred for +2 128K and
# also for --debug). The binary lives in Contents/MacOS/ and looks for ROMs
# in ../Resources/, so we MUST cd there before running it.
# ---------------------------------------------------------------------------
launch_zesarux_from_bundle() {
  local bundle="/Applications/zesarux.app"
  if [[ ! -x "$bundle/Contents/MacOS/zesarux" ]]; then
    return 1
  fi
  cd "$bundle/Contents/MacOS"
  # --ao coreaudio explicit: ZEsarUX's default audio driver detection on
  # cocoa can silently land on a null/disabled driver, so no AY chip output
  # is audible (verified 2026-05-26 with the platformer PT3 integration —
  # AY regs were being written but no sound came out until --ao coreaudio).
  exec ./zesarux --machine "$MACHINE_ZX_BUNDLE" --vo cocoa --ao coreaudio "$ZX_FLAG" "$ABS_FILE"
}

launch_zesarux_cli() {
  if ! command -v zesarux >/dev/null 2>&1; then
    return 1
  fi
  exec zesarux --machine "$MACHINE_ZX_CLI" --ao coreaudio "$ZX_FLAG" "$ABS_FILE"
}

# --debug → ZEsarUX (with its built-in debugger UI)
if [[ $DEBUG -eq 1 ]]; then
  launch_zesarux_from_bundle || launch_zesarux_cli || {
    cat >&2 <<EOF
Error: zesarux no está disponible.
  macOS:  brew install --cask zesarux
  o descarga el .dmg desde https://github.com/chernandezba/zesarux/releases
EOF
    exit 1
  }
fi

# +2 128K on macOS → ZEsarUX-from-bundle (FuseX via `open -a` would lose the
# `-m plus2` flag and silently fall back to 48K mode).
if [[ "$(uname)" == "Darwin" && $IS_PLUS2 -eq 1 ]]; then
  launch_zesarux_from_bundle || true   # fall through if not found
fi

# Otherwise: prefer Fuse. Resolve its CLI binary inside FuseX.app (macOS) or PATH.
locate_fuse() {
  if command -v fuse >/dev/null 2>&1; then
    command -v fuse
    return
  fi
  for candidate in \
      "/Applications/FuseX.app/Contents/MacOS/FuseX" \
      "/Applications/FuseX.app/Contents/MacOS/Fuse" \
      "/Applications/Fuse.app/Contents/MacOS/Fuse"; do
    if [[ -x "$candidate" ]]; then
      echo "$candidate"
      return
    fi
  done
  return 1
}

if FUSE_BIN=$(locate_fuse); then
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS sandbox (TCC) blocks FuseX from reading external volumes. Stage
    # the file to /tmp/ and launch via `open -a` so LaunchServices grants
    # FuseX access. This path doesn't pass `-m plus2` — we only get here
    # for 48K snapshots (the +2 128K branch above intercepts).
    if [[ "$ABS_FILE" == /Volumes/* ]]; then
      STAGED="/tmp/$(basename "$ABS_FILE")"
      cp -f "$ABS_FILE" "$STAGED"
      APP_BUNDLE="${FUSE_BIN%/Contents/MacOS/*}"
      APP_NAME="$(basename "$APP_BUNDLE" .app)"
      exec open -a "$APP_NAME" "$STAGED"
    fi
  fi
  exec "$FUSE_BIN" -m "$MACHINE_FUSE" "$FUSE_FLAG" "$ABS_FILE"
fi

# Last resort: ZEsarUX from PATH (CLI install — may lack ROMs on macOS).
launch_zesarux_cli || {
  cat >&2 <<EOF
Error: ni Fuse ni ZEsarUX están disponibles.
  macOS:  brew install --cask fredm-fuse  o  brew install --cask zesarux
  Linux:  sudo apt install fuse-emulator-gtk spectrum-roms
EOF
  exit 1
}
