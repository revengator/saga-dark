#!/usr/bin/env bash
# Build script for the +2 128K Dragon Phase standalone minigame.
# Output: build/saga-dragon-128k.sna (loadable in any +2 128K emulator).
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
ORIG_BUILD="$REPO_ROOT/original-48k/build"

mkdir -p "$BUILD_DIR"

cd "$SCRIPT_DIR"
sjasmplus --sym=dragon.sym main.asm
mv -f saga-dragon-128k.sna "$BUILD_DIR/"

echo
echo "Output:"
ls -la "$BUILD_DIR/"
