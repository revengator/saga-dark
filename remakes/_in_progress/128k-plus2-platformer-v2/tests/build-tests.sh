#!/usr/bin/env bash
# Run engine tests: assemble dark1/dark2 with the refactored engine modules
# and verify byte-perfect output vs the original snapshots.
#
# Four tests:
#   dark1     — v1: engine 7 motor modules + original dark1/main.asm (3a)
#   dark2     — v1: engine 7 motor modules + original dark2/main.asm (3b,
#               proves engine is layout-parametrizable)
#   dark1-v2  — v2: engine motor + game-loop/bichos/sound-fade-carga
#               + levels/phase1/{data,e123,handlers,data-tail}.asm. As of the
#               unified-engine refactor (E2c→), BICHOS is table-driven, so this
#               is no longer byte-perfect — it is a SMOKE test (assembles +
#               correct size). See UNIFIED-ENGINE.md.
#   dark2-v2  — v2: engine motor + levels/phase2/ (still monolithic + still
#               byte-perfect until Phase 2 is brought onto the unified engine).
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"

mkdir -p "$BUILD_DIR"
cd "$SCRIPT_DIR"

# Args: <label> <snapshot-name> <asm-file>
run_test() {
    local label=$1
    local sna_name=$2
    local asm=$3
    local sna="$REPO_ROOT/original-48k/snapshots/${sna_name}/${sna_name}.sna"
    local bin="$BUILD_DIR/${label}.bin"

    echo "[${label}] Assembling ${asm}..."
    sjasmplus --raw="$bin" "$asm" > "$BUILD_DIR/${label}.log"

    local orig_bin
    orig_bin=$(mktemp)
    dd if="$sna" bs=1 skip=10934 count=31739 of="$orig_bin" 2>/dev/null

    if cmp -s "$bin" "$orig_bin"; then
        echo "[${label}] ✅ byte-perfect ($(wc -c < "$bin") B)"
        rm -f "$orig_bin"
    else
        echo "[${label}] ❌ mismatch with ${sna_name}.sna"
        cmp "$bin" "$orig_bin" | head -1
        rm -f "$orig_bin"
        return 1
    fi
}

# Smoke test for the unified-engine builds: assemble cleanly + correct size.
# Not byte-perfect by design (the engine diverges from the shipped .sna).
# Args: <label> <asm-file> <expected-size>
run_smoke() {
    local label=$1
    local asm=$2
    local expect=$3
    local bin="$BUILD_DIR/${label}.bin"

    echo "[${label}] Assembling ${asm} (unified-engine smoke test)..."
    sjasmplus --raw="$bin" "$asm" > "$BUILD_DIR/${label}.log" 2>&1

    local size
    size=$(wc -c < "$bin" | tr -d ' ')
    if [ "$size" -eq "$expect" ]; then
        echo "[${label}] ✅ assembles, ${size} B (not byte-perfect by design — unified engine)"
    else
        echo "[${label}] ❌ size ${size} B (expected ${expect})"
        return 1
    fi
}

# Snapshot smoke test for the unified-engine standalone build: assemble with a
# -D define, produce a runnable .sna of the expected 128K size. Not byte-perfect
# (full refactor); correctness is validated visually in the emulator.
# Args: <label> <asm-file> <define> <expected-sna-size>
run_sna_smoke() {
    local label=$1
    local asm=$2
    local def=$3
    local expect=$4
    local sna="$BUILD_DIR/saga-${label}.sna"

    echo "[${label}] Assembling ${asm} -D${def} (unified-engine snapshot smoke test)..."
    sjasmplus -D"$def" "$asm" > "$BUILD_DIR/${label}.log" 2>&1

    if [ ! -f "$sna" ]; then
        echo "[${label}] ❌ no snapshot produced (see ${label}.log)"
        return 1
    fi
    local size
    size=$(wc -c < "$sna" | tr -d ' ')
    if [ "$size" -eq "$expect" ]; then
        echo "[${label}] ✅ assembles, ${size} B +2 128K snapshot (not byte-perfect by design)"
    else
        echo "[${label}] ❌ snapshot size ${size} B (expected ${expect})"
        return 1
    fi
}

run_test     dark1     dark1  dark1-engine.asm
run_test     dark2     dark2  dark2-engine.asm
run_smoke    dark1-v2         dark1-engine-v2.asm 31739
run_test     dark2-v2  dark2  dark2-engine-v2.asm
run_sna_smoke dark2-engine-v3 dark2-engine-v3.asm UNIFIED_HOOKS=1 131103
run_sna_smoke dark1-engine-v3 dark1-engine-v3.asm UNIFIED_HOOKS=1 131103
echo "[OK] all tests passed"
