#!/usr/bin/env bash
# Build script for the +2 128K platformer (Dark 1 + Dark 2 on a unified engine).
#
# Usage:
#   ./build.sh           — normal build → build/saga-platformer-128k.sna
#   ./build.sh cheat     — INFINITE_ENERGY build → build/saga-platformer-128k-cheat.sna
#   ./build.sh all       — both
#
# Pipeline:
#   1. Assemble tests/dark2-engine-v3.asm (UNIFIED_HOOKS=1 [+ INFINITE_ENERGY=1])
#      → saga-dark2-engine-v3.sna (131103 B, +2 128K snapshot).
#   2. Extract the linear 0x4000-0xFFFF (49152 B) of Phase 2 as
#      build/phase2-converged{,-cheat}.bin (= bank5 + bank2 + bank0 of the .sna).
#   3. Assemble main.asm with -DUNIFIED_HOOKS=1 [-DINFINITE_ENERGY=1]; main.asm
#      INCBINs the converged .bin into stash banks 1/3/4. No dark2.sna needed.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
TESTS_DIR="$SCRIPT_DIR/tests"

mkdir -p "$BUILD_DIR"

# Build Phase 2's converged .bin (drops dark2.sna dependency).
# Args: <mode>  ("normal" or "cheat")
build_phase2_bin() {
    local mode=$1
    local bin
    local extra=""
    if [ "$mode" = "cheat" ]; then
        bin="$BUILD_DIR/phase2-converged-cheat.bin"
        extra="-DINFINITE_ENERGY=1"
    else
        bin="$BUILD_DIR/phase2-converged.bin"
    fi

    echo "[phase2-$mode] Assembling tests/dark2-engine-v3.asm $extra ..."
    cd "$TESTS_DIR"
    # dark2-engine-v3.asm always SAVESNAs to its own build/ — produce it then
    # extract the linear 48 KB image into the platformer's build/.
    # -DUNIFIED_PLATFORMER=1: skip INICIO (the "DARK" title + ENTER prompt
    # + scroll loop — vestigial cassette-load UX). Standalone v3 (built by
    # build-tests.sh without the flag) keeps the title screen.
    sjasmplus -DUNIFIED_HOOKS=1 -DUNIFIED_PLATFORMER=1 $extra dark2-engine-v3.asm \
        > "$BUILD_DIR/phase2-$mode.log" 2>&1
    local v3sna="$TESTS_DIR/build/saga-dark2-engine-v3.sna"
    if [ ! -f "$v3sna" ]; then
        echo "[phase2-$mode] ❌ no v3 snapshot produced (see phase2-$mode.log)"; exit 1
    fi
    # 27-byte 48K SNA header; first 48 KB after = bank5+bank2+bank0 linear.
    dd if="$v3sna" of="$bin" bs=1 skip=27 count=49152 2>/dev/null
    echo "[phase2-$mode] -> $bin ($(wc -c < "$bin") B)"
    cd "$SCRIPT_DIR"
}

build_one() {
    local mode=$1                          # "normal" or "cheat" or "debug-intermediate"
    local out
    local flag=""
    local phase2_mode="normal"
    case "$mode" in
        cheat)
            out="saga-platformer-128k-cheat.sna"
            flag="-DINFINITE_ENERGY=1"
            phase2_mode="cheat"
            ;;
        debug-intermediate)
            # Boot jumps straight to transition_routine — for fast iteration
            # on the inter-level screen without playing through Phase 1.
            out="saga-platformer-128k-debug.sna"
            flag="-DINFINITE_ENERGY=1 -DDEBUG_INTERMEDIATE=1"
            phase2_mode="cheat"
            ;;
        *)
            out="saga-platformer-128k.sna"
            ;;
    esac

    build_phase2_bin "$phase2_mode"

    echo "[$mode] Assembling 128K wrapper..."
    cd "$SCRIPT_DIR"
    sjasmplus -DUNIFIED_HOOKS=1 -DUNIFIED_PLATFORMER=1 $flag main.asm
    mv -f "$out" "$BUILD_DIR/"
    echo "[$mode] -> $BUILD_DIR/$out ($(wc -c < "$BUILD_DIR/$out") B)"
}

case "${1:-normal}" in
    normal)  build_one normal ;;
    cheat)   build_one cheat ;;
    debug-intermediate) build_one debug-intermediate ;;
    all)     build_one normal; build_one cheat ;;
    *) echo "Usage: $0 [normal|cheat|debug-intermediate|all]"; exit 1 ;;
esac

echo
echo "Output:"
ls -la "$BUILD_DIR/"
