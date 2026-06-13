#!/usr/bin/env bash
# Compila Saga Film (intro) a .bin y .tap byte-perfect.
# Uso: ./build.sh

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/../../build"
mkdir -p "$BUILD_DIR"

cd "$SCRIPT_DIR"
sjasmplus --raw="$BUILD_DIR/film.bin" game.asm > /dev/null

python3 << 'EOF'
build = open('../../build/film.bin', 'rb').read()
orig_tap = open('game-sagadark.tap', 'rb').read()

# Reuse loader (first 117 bytes), replace data block
data_len = len(build)
blen = 1 + data_len + 1
new_block = bytearray([blen & 0xFF, (blen >> 8) & 0xFF, 0xFF])
new_block.extend(build)
chksum = 0xFF
for b in build: chksum ^= b
new_block.append(chksum)
new_tap = orig_tap[:117] + bytes(new_block)
open('../../build/film.tap', 'wb').write(new_tap)

# Verify
pos = 117
orig_blen = orig_tap[pos] | (orig_tap[pos+1] << 8)
orig_data = orig_tap[pos+3 : pos+2+orig_blen-1]
diffs = sum(1 for i in range(min(len(build), len(orig_data))) if build[i] != orig_data[i])
status = '✓ byte-perfect' if (len(build) == len(orig_data) and diffs == 0) else f'⚠ {diffs} diffs'
print(f'  film.bin:  {len(build)}B  ({len(build)-diffs}/{len(build)} bytes vs game-sagadark.tap) — {status}')
print(f'  film.tap:  {len(new_tap)}B (loader 117B + code block)')
EOF
