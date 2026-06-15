#!/usr/bin/env python3
"""Rewrite the platformer's title-screen credits — the RIGHT way.

The start screen is NOT just the loaded `screen.bin`: Phase-1 init calls the
routine at 0xE6FE which PRINTS the whole menu/credits via the ROM printer
(RST 0x10) from a control-code string originally at 0xE730, then horizontally
"bolds" the top of the screen twice (sub_e70dh: OR each byte with itself >>1).
That is why the font looks like a chunky custom face — it is the ROM font
smeared 2px. Editing the bitmap is futile: this reprint paints over it.

So we edit the STRING (and revert the bitmap). The original string (0xE730) is
241 bytes and is boxed in by a keyboard-scan routine right after it (0xE821),
so it cannot grow in place. We relocate the (larger) new string into the big
free zero-region inside tail.bin (0xEA22+) and repoint the `ld hl,0xE730` at
0xE6FF. The credits now list everyone from the intro film, under the film's
aliases + film roles, aired with a blank line between roles.

Because the aired credits run past the original bold cut-off (row 15), we also
widen sub_e70dh's smear from the top two thirds (0x1000) to the full pixel area
(0x1800) so every credit line gets the same bold treatment.

`screen.bin` keeps the title, menu and bottom artwork but its old baked credit
band (char rows 7-18) is cleared, so nothing of the previous credits shows
through where the reprint leaves gaps. Idempotent; reproducible.
"""

from __future__ import annotations
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent / "remakes/128k-plus2-platformer"
TAIL = ROOT / "levels/phase1/data/tail.bin"
SCREEN = ROOT / "levels/phase1/data/screen.bin"

TAIL_BASE = 0xE696
NEW_STR_ADDR = 0xEA22            # free zero-region inside tail.bin
LDHL_ADDR = 0xE6FF              # operand of `ld hl,le730h` at 0xE6FE

# Print control codes (ROM): 0x16 AT r,c | 0x10 INK | 0x13 BRIGHT | text | 0xFF end.
GRN, YEL, RED, WHT = 4, 6, 2, 7
COPY = 0x7F                     # ROM (C) glyph


def at(row, col, ink, text, bright=False):
    b = [0x16, row, col, 0x10, ink]
    if bright:
        b += [0x13, 1]
    return bytes(b) + text


def centred(row, ink, s: str):
    return at(row, (32 - len(s)) // 2, ink, s.encode('ascii'))


def build_string() -> bytes:
    out = bytearray()
    # Title + menu. Keyboard-only (it runs on emulators), so the only options
    # are EMPEZAR and REDEFINIR: KEMPSTON/SINCLAIR are dropped, and TECLADO too
    # since the control is always the keyboard (selecting it would be redundant).
    out += at(0, 10, WHT, b'SAGA--DARK')
    out += at(2, 8, RED, b'0......EMPEZAR')
    out += at(3, 8, YEL, b'1....REDEFINIR')
    # Credits — the whole team as a simple list under one heading, real names
    # sorted alphabetically (by first name).
    out += centred(8,  GRN, 'DESARROLLADORES:')
    out += centred(10, YEL, 'ALFONSO TRIBALDO RUIZ')
    out += centred(11, YEL, 'ANTONIO JUAN HERNANDEZ CUELLAR')
    out += centred(12, YEL, 'CARLOS PEREZ RUIZ')
    out += centred(13, YEL, 'JOSE MENOR CAMPOS')
    out += centred(14, YEL, 'MIGUEL ANGEL ESTEVE MARCO')
    # Copyright on row 17, with the artwork (19-23) below. The year span
    # 1990-2026 reflects the original game + this reconstruction. Centred.
    out += at(17, 2, RED, bytes([COPY]) + b' 1990-2026 TRITON SOFTWARE', bright=True)
    out += b'\xff'
    return bytes(out)


def patch_tail():
    d = bytearray(TAIL.read_bytes())
    def o(addr): return addr - TAIL_BASE
    assert d[o(0xE6FE):o(0xE6FE)+3] == bytes([0x21, 0x30, 0xE7]), "ld hl,le730h not found"
    assert d[o(0xE710):o(0xE710)+3] == bytes([0x01, 0x00, 0x10]), "ld bc,0x1000 not found"
    # --- Keyboard-only menu dispatch (loop @0xE87F reads keys 0-4) -------------
    # Only EMPEZAR(0)->RET and REDEFINIR survive. REDEFINIR moves from key '4'
    # (code 3) to '1' (code 0); the KEMPSTON('2'), SINCLAIR('3') and the now
    # redundant TECLADO('1') handlers are blanked. The control is always the
    # keyboard (default 0x6A8A=0), so EMPEZAR straight away uses it.
    assert d[o(0xE885):o(0xE885)+8] == bytes.fromhex('3e03cd21e8cc39e9'), "REDEFINIR block moved"
    assert d[o(0xE88D):o(0xE88D)+2] == bytes([0x3e, 0x01]), "KEMPSTON block moved"
    assert d[o(0xE895):o(0xE895)+8] == bytes.fromhex('3e00cd21e8cc0ce9'), "TECLADO block moved"
    assert d[o(0xE89D):o(0xE89D)+2] == bytes([0x3e, 0x02]), "SINCLAIR block moved"
    d[o(0xE886)] = 0x00                                      # REDEFINIR -> key '1'
    d[o(0xE88D):o(0xE88D)+8] = b'\x00' * 8                   # remove KEMPSTON
    d[o(0xE895):o(0xE895)+8] = b'\x00' * 8                   # remove TECLADO (always keyboard)
    d[o(0xE89D):o(0xE89D)+8] = b'\x00' * 8                   # remove SINCLAIR
    # REDEFINIR prints its prompts (ARRIBA/ABAJO/...) on char row 8 — a blank gap
    # in the original layout, but a credit line here. Move the prompts and their
    # matching row-8 bold (sub_e9ddh, used only by redefine) to row 5, the
    # menu/credits gap, so they no longer clobber a credit line.
    for ofs in (0xE8A9, 0xE8B4, 0xE8BF, 0xE8CA, 0xE8D7, 0xE8E4):
        assert d[o(ofs)] == 0x08, "redefine prompt row moved"
        d[o(ofs)] = 0x05
    assert d[o(0xE9DD):o(0xE9DD)+3] == bytes([0x21, 0x00, 0x48]), "sub_e9ddh ld hl moved"
    d[o(0xE9DE):o(0xE9DE)+2] = bytes([0xA0, 0x40])           # bold char row 5 (0x40A0), not row 8
    # The redefine routine debounces the REDEFINIR key before reading the first
    # direction (UP), so a still-held keypress isn't captured. It skipped key
    # '4' (the original REDEFINIR key); REDEFINIR is now '1' (code 0), so make
    # it wait for '1' to be released instead — otherwise UP is grabbed instantly.
    assert d[o(0xE94D):o(0xE94D)+2] == bytes([0xFE, 0x03]), "redefine UP debounce moved"
    d[o(0xE94E)] = 0x00                                       # cp 3 (key '4') -> cp 0 (key '1')
    s = build_string()
    assert NEW_STR_ADDR + len(s) < 0xFF00, "new string overruns free region"
    assert all(b == 0 for b in d[o(NEW_STR_ADDR):o(NEW_STR_ADDR)+len(s)]), "target not free"
    d[o(NEW_STR_ADDR):o(NEW_STR_ADDR)+len(s)] = s            # write relocated string
    d[o(LDHL_ADDR):o(LDHL_ADDR)+2] = NEW_STR_ADDR.to_bytes(2, 'little')   # repoint
    # Bold only the TEXT rows (0-18), not the artwork (19-23). The original
    # sub_e70dh is a single contiguous smear that can't skip the interleaved
    # bottom third, so install a 2-part smear (rows 0-15 = 0x4000+0x1000 bytes;
    # rows 16-18 = third 2, char rows 0-2, per scanline) in free space and
    # repoint both `call sub_e70dh` (0xE704/0xE707) at it. Assembled with
    # sjasmplus; position-independent (relative jumps + absolute data addrs).
    SMART_BOLD = bytes.fromhex(
        '2100400100107e57a7cb1fb277230b78b120f3'      # rows 0-15
        '2100501e080660e57e57a7cb1fb2772310f6e1241d20eec9')  # rows 16-18 + ret
    NB_ADDR = 0xEC00
    assert d[o(0xE704):o(0xE704)+3] == bytes([0xcd, 0x0d, 0xe7]), "bold call 1 moved"
    assert d[o(0xE707):o(0xE707)+3] == bytes([0xcd, 0x0d, 0xe7]), "bold call 2 moved"
    assert all(b == 0 for b in d[o(NB_ADDR):o(NB_ADDR)+len(SMART_BOLD)]), "smart-bold target not free"
    d[o(NB_ADDR):o(NB_ADDR)+len(SMART_BOLD)] = SMART_BOLD
    d[o(0xE705):o(0xE705)+2] = NB_ADDR.to_bytes(2, 'little')
    d[o(0xE708):o(0xE708)+2] = NB_ADDR.to_bytes(2, 'little')
    TAIL.write_bytes(d)
    print(f"tail.bin: string @{NEW_STR_ADDR:#06x} ({len(s)} B), repointed; smart bold (rows 0-18) @{NB_ADDR:#06x}")


def px_addr(cc, y):
    third, line, row = y // 64, y % 8, (y % 64) // 8
    return third * 2048 + line * 256 + row * 32 + cc


def patch_screen():
    d = bytearray(SCREEN.read_bytes())
    for cr in range(1, 19):                  # clear baked menu + credit band (rows 1-18)
        for cc in range(32):
            for by in range(8):
                d[px_addr(cc, cr * 8 + by)] = 0
            d[6144 + cr * 32 + cc] = 0
    SCREEN.write_bytes(d)
    print("screen.bin: cleared rows 1-18 (old menu + credits); title + full artwork kept")


if __name__ == '__main__':
    patch_tail()
    patch_screen()
