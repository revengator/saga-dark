#!/usr/bin/env python3
"""
flip-player-sprite.py — horizontally mirror the 5 player walk frames inside
levels/phase1/data/preload.bin (the 0x5C00-0x6A9A pre-loaded image).

Used to (1) VALIDATE the masked-sprite mirror transform visually by building a
".sna where the player is permanently flipped", and (2) document the exact
transform that the runtime in-place flipper (asm) must reproduce when the
player changes facing.

Player descriptor TABLA1 @0x5D2A holds 5 frame pointers at +10..+18:
  phase 1 -> 0x5D92   phase 2 -> 0x5F17   phase 3 -> 0x609C
  phase 4 -> 0x61A1   phase 5 -> 0x62A6

Frame format (decoded from the hres-printing blitter + CALGRA):
  byte0 = rows        (char-rows, =0x04 for every player frame)
  byte1 = bpr         (mask/gfx PAIRS per scanline; width = bpr*8 px)
  byte2 = rot         (current sub-pixel rotation offset, runtime-mutated)
  byte3,4 = endptr    (points at frame_end-1)
  data  = rows * 8 * bpr * 2 bytes, laid out per scanline as
          [m0,g0, m1,g1, ... m(bpr-1),g(bpr-1)]  (mask/gfx interleaved pairs)

Horizontal mirror of one scanline:
  reverse the order of the (mask,gfx) PAIRS, and bit-reverse each byte
  (keep mask paired with its gfx; mask stays mask, gfx stays gfx).
Header (5 bytes) is preserved untouched — data size is unchanged so endptr
stays valid.
"""
import sys

BASE = 0x5C00
FRAME_ADDRS = [0x5D92, 0x5F17, 0x609C, 0x61A1, 0x62A6]

def bitrev(b):
    return int(f'{b:08b}'[::-1], 2)

def flip_frame(buf, addr):
    off = addr - BASE
    rows = buf[off + 0]
    bpr  = buf[off + 1]
    data = off + 5
    scanlines = rows * 8
    line_bytes = bpr * 2                 # bpr pairs of [mask,gfx]
    for s in range(scanlines):
        ls = data + s * line_bytes
        # split into (mask,gfx) pairs
        pairs = [(buf[ls + 2*i], buf[ls + 2*i + 1]) for i in range(bpr)]
        # reverse pair order, bit-reverse each byte within the pair
        mirrored = []
        for (m, g) in reversed(pairs):
            mirrored.append(bitrev(m))
            mirrored.append(bitrev(g))
        buf[ls:ls + line_bytes] = bytes(mirrored)

def main():
    if len(sys.argv) != 3:
        sys.exit(f"usage: {sys.argv[0]} <in preload.bin> <out preload_flipped.bin>")
    buf = bytearray(open(sys.argv[1], 'rb').read())
    for a in FRAME_ADDRS:
        flip_frame(buf, a)
    open(sys.argv[2], 'wb').write(buf)
    print(f"flipped {len(FRAME_ADDRS)} player frames -> {sys.argv[2]} ({len(buf)} B)")

if __name__ == '__main__':
    main()
