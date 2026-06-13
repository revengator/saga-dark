#!/usr/bin/env bash
# Build the standalone PT3 sanity .sna (NOT the film).
# Output: build/saga-film-test-music.sna
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/build"
mkdir -p "$BUILD_DIR"
cd "$SCRIPT_DIR"
sjasmplus test-music.asm
mv -f saga-film-test-music.sna "$BUILD_DIR/"
echo
echo "Output:"
ls -la "$BUILD_DIR/saga-film-test-music.sna"
