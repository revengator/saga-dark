#!/usr/bin/env bash
# Build script for the +2 128K Film — divergent fork of the original 48K Film.
# Compiles directly from src/ in this folder (no longer depends on
# original-48k/src/film/). Output: build/saga-film-128k.sna
#
# Subversions live as commits on top of the base 128K Film:
#   - bilingual ES/EN menu (done)
#   - ZX0 compression of static screens + narrative text (done — v-final)
#   - SCREEN_BUF B+ pass: on-demand per-pantalla decompression (done — 2026-05-07)
#   - NIRVANA+ multicolour, AY music (planned)
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
ZX0_DIR="$SCRIPT_DIR/build/zx0"
RAW_DIR="$SCRIPT_DIR/build/blocks_raw"
ZX0_TOOL="$SCRIPT_DIR/../../tools/zx0/zx0"

mkdir -p "$BUILD_DIR" "$ZX0_DIR"

# --- Regenerate ZX0 blobs if raw .bin extracts are present and newer than
#     their compressed counterparts. All blobs are FORWARD post-B+ pass;
#     in-place backwards layout was retired (see ZX0-REPORT.md).
# Cross-platform `stat`: macOS = `stat -f%z`, GNU = `stat -c%s`. Pick one.
if stat -f%z "$0" >/dev/null 2>&1; then STAT_SIZE='stat -f%z'; else STAT_SIZE='stat -c%s'; fi

if [ -d "$RAW_DIR" ]; then
    for blob in PPANT1 PPANT2 PPANT3 PPANT4 PPANT5 PPANT6 PPANT7 PPANT8 PPANT9 \
                IMGSOL IMGJACA \
                CHARSET CHARX2 CHARESP \
                PANT1to10_ES PANT1to10_EN T1to5_EN; do
        raw="$RAW_DIR/$blob.bin"
        zx0="$ZX0_DIR/$blob.zx0"
        if [ -f "$raw" ] && { [ ! -f "$zx0" ] || [ "$raw" -nt "$zx0" ]; }; then
            "$ZX0_TOOL" -f "$raw" "$zx0" >/dev/null
            echo "  zx0:    $blob ($($STAT_SIZE "$raw") → $($STAT_SIZE "$zx0") B)"
        fi
    done
fi

cd "$SCRIPT_DIR"
sjasmplus main.asm
mv -f saga-film-128k.sna "$BUILD_DIR/"

echo
echo "Output:"
ls -la "$BUILD_DIR/saga-film-128k.sna"
