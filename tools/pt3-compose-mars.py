#!/usr/bin/env python3
"""Compose an AY-3-8910 PT3 arrangement of Gustav Holst's "Mars, the Bringer of
War" (from *The Planets*, 1914-1916) for the ZX Spectrum +2 128K platformer.

LICENCE: Holst died in 1934; *The Planets* (publ. 1921) is **public domain**
worldwide (life+70 since 2005; pre-1929 in the US). Unlike a living composer's
film score, the COMPOSITION itself is free — so this may be a faithful
transcription. Only a specific recording/arrangement is protected, and this
arrangement is our own. Clean to bundle and distribute. See CONTEXT.md's PT3
licensing doctrine and [[project_pt3_license]].

Format machinery (note encoding, channel packer, sample builders, PT3 header
assembly) is identical to tools/pt3-compose-barbarian.py so the output loads in
Sergey Bulba's PT3 player bundled in bank 7.

Why "Mars" fits: it is literally a war march. Three traits make it unmistakable
even on 3 AY channels:
  1. **5/4 meter** — the lopsided quintuple pulse is the soul of the piece.
  2. **A relentless hammered ostinato** on a single pitch (G) with the signature
     rhythm, played col legno + timpani + harp in the original.
  3. **Grinding tritone/semitone harmonic clashes** (Holst's bitonal dread).

Arrangement — centred on G (G minor / Phrygian colour), 3 channels, **5/4**,
speed 5 (quarter ~= 150 BPM, heavy Allegro):
  - Channel A (bass war-timpani): the 5/4 ostinato on G — the engine of the
                              piece. In the development the root drops a TRITONE
                              to Db (the Holst-Mars clash).
  - Channel B (brass theme):  declamatory low-brass melody, single-voice (weight,
                              not octave shimmer — held brass should not warble),
                              climbing to a high climax in pattern 3.
  - Channel C (war drum):     pure-NOISE snare LOCKED to the ostinato accents, so
                              bass + drum hammer the 5/4 rhythm in unison.

Meter/grid: 1 row = 1 sixteenth; 4 rows = 1 quarter beat; 20 rows = one 5/4 bar;
40 rows = 2 bars per pattern. The ostinato attacks fall on the rhythm
  eighth eighth | quarter | quarter | eighth eighth | quarter
= rows 0,2,4,8,12,14,16 of each 20-row bar (the famous lopsided Mars drive).

Structure (4 patterns, looped):
  P0  G | G    theme phrase A (rising martial brass over the ostinato)
  P1  G | G    theme phrase B (answer, settling back toward G)
  P2  G | Db   development: bass drops a tritone, brass grinds (bitonal dread)
  P3  G | G    climax: high octave brass peak -> loop

Iteration log:
  v1 (2026-06-04) — initial Holst-Mars arrangement (5/4 ostinato, tritone bass
                     shift in P2, brass theme A/B + climax).
"""

from __future__ import annotations
from pathlib import Path

OUT_PATH = Path(__file__).resolve().parent.parent / \
    "remakes/128k-plus2-platformer/src/music/mars.pt3"

# -----------------------------------------------------------------------------
# Note encoding: PT3 maps semitones to bytes 0x50 (C-1) .. 0xAF (B-8).
# -----------------------------------------------------------------------------
NOTE_NAMES = ['C-', 'C#', 'D-', 'D#', 'E-', 'F-', 'F#', 'G-', 'G#', 'A-', 'A#', 'B-']
NOTE_TO_BYTE: dict[str, int] = {}
for octave in range(1, 9):
    for i, name in enumerate(NOTE_NAMES):
        NOTE_TO_BYTE[f"{name}{octave}"] = 0x50 + (octave - 1) * 12 + i

REST = '---'
OFF = 'OFF'

ROWS_PER_PATTERN = 40
BAR = 20                       # rows per 5/4 bar (sixteenth grid, 4 rows/beat)


# -----------------------------------------------------------------------------
# Channel packer — same semantics as the barbarian / mountain-king tools (NNtSkp
# via `B1 N` before the first note, notes/OFF/0xC0 terminate rows, trailing
# rests hold).
# -----------------------------------------------------------------------------
def encode_channel(rows: list, default_sample: int = 1,
                   default_volume: int = 15, ornament: int = 0) -> bytes:
    out = bytearray()
    cur_sample = default_sample
    cur_volume = default_volume
    cur_ornament = ornament
    cur_skip = 0
    first_note_emitted = False
    initial_volume_emitted = False

    i = 0
    while i < len(rows) and rows[i] == REST:
        i += 1

    while i < len(rows):
        row = rows[i]
        note = row
        opts = {}
        if isinstance(row, tuple):
            note, opts = row[0], row[1] if len(row) > 1 else {}

        rest_after = 0
        j = i + 1
        while j < len(rows) and rows[j] == REST:
            rest_after += 1
            j += 1
        desired_skip = 1 + rest_after

        if 'vol' in opts and opts['vol'] != cur_volume:
            cur_volume = opts['vol']
            out.append(0xC0 | (cur_volume & 0x0F))
            initial_volume_emitted = True
        if 'ornament' in opts and opts['ornament'] != cur_ornament:
            cur_ornament = opts['ornament']
            out.append(0x40 | (cur_ornament & 0x0F))
        if 'sample' in opts and opts['sample'] != cur_sample:
            cur_sample = opts['sample']
            out.append(0xD0 | (cur_sample & 0x1F))

        if not initial_volume_emitted:
            out.append(0xC0 | (default_volume & 0x0F))
            initial_volume_emitted = True

        if desired_skip != cur_skip:
            cur_skip = desired_skip
            out.append(0xB1)
            out.append(desired_skip)

        if note == OFF:
            out.append(0xC0)
        else:
            if not first_note_emitted:
                out.append(0xF0 | (cur_ornament & 0x0F))
                out.append((cur_sample & 0x1F) * 2)
                first_note_emitted = True
            out.append(NOTE_TO_BYTE[note])

        i = j

    out.append(0x00)
    return bytes(out)


def line(events: list, total: int = ROWS_PER_PATTERN) -> list:
    """Expand [(note, dur_rows), ...] into a row list, asserting durations sum
    to `total` (all 3 channels of a pattern must end together)."""
    out: list = []
    for note, dur in events:
        out.append(note)
        out.extend([REST] * (dur - 1))
    assert len(out) == total, f"line is {len(out)} rows, expected {total}: {events}"
    return out


# -----------------------------------------------------------------------------
# Samples (reused from the barbarian tool — same AY voices). byte1 mix bits:
# bit7=1 noise OFF, bit4=1 tone OFF. So 0x80|amp = tone only; 0x10|amp = noise
# only; 0x00|amp = both. byte0 = 0x00 (no slide/env).
# -----------------------------------------------------------------------------
def _sample_raw(b1_ticks: list[int], loop: int | None = None) -> bytes:
    n = len(b1_ticks)
    loop = n - 1 if loop is None else loop
    out = bytearray()
    out.append(loop)
    out.append(n - 1)
    for b1 in b1_ticks:
        out.append(0x00)        # byte0: no amp-slide / no env / no noise-slide
        out.append(b1)          # byte1: mix bits + amplitude
        out.append(0x00)        # tone offset lo
        out.append(0x00)        # tone offset hi
    return bytes(out)


def build_sample_brass() -> bytes:
    """Lead brass: tone only, slight attack-decay then sustain for some life."""
    amps = [15, 15, 14, 14, 13, 13, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12]
    return _sample_raw([0x80 | a for a in amps])


def build_sample_timpani() -> bytes:
    """War-timpani 'DHOOM': 2 ticks of NOISE+tone (percussive attack at pitch),
    then pure-tone decay to a low pitched tail (loops on the tail)."""
    ticks = [0x00 | 0xF, 0x00 | 0xD,                       # noise+tone attack
             0x80 | 0xC, 0x80 | 0xA, 0x80 | 0x8, 0x80 | 0x6,  # tone decay
             0x80 | 0x5, 0x80 | 0x4, 0x80 | 0x3,
             0x80 | 0x2, 0x80 | 0x2, 0x80 | 0x2,
             0x80 | 0x2, 0x80 | 0x2, 0x80 | 0x2, 0x80 | 0x2]   # low tail (loop)
    return _sample_raw(ticks, loop=15)


def build_sample_snare() -> bytes:
    """War-drum snare: pure NOISE burst, fast decay to silence (loops silent)."""
    ticks = [0x10 | 0xF, 0x10 | 0xA, 0x10 | 0x6, 0x10 | 0x3,
             0x10 | 0x1, 0x10 | 0x0, 0x10 | 0x0, 0x10 | 0x0]
    return _sample_raw(ticks, loop=7)


def build_ornament_empty() -> bytes:
    return bytes([0x00, 0x00, 0x00])


# -----------------------------------------------------------------------------
# Sample / volume assignments.
# -----------------------------------------------------------------------------
S_BRASS, S_TIMP, S_SNARE = 1, 2, 3
V_BASS, V_LEAD, V_SNARE = 15, 15, 12

# Ostinato attack rows within a 20-row 5/4 bar: the lopsided Mars rhythm
#   eighth eighth | quarter | quarter | eighth eighth | quarter
OSTINATO_DURS = [2, 2, 4, 4, 2, 2, 4]          # sums to BAR (20)
OSTINATO_ROWS = (0, 2, 4, 8, 12, 14, 16)        # derived attack rows


def bass_bar(root: str) -> list:
    """The 5/4 war-timpani ostinato for one bar, hammering `root`."""
    return line([(root, d) for d in OSTINATO_DURS], BAR)


def snare_channel() -> list:
    """Pure-noise snares LOCKED to the ostinato accents (bass + drum in unison
    hammer the 5/4 rhythm). Row 0 is always an accent, so the packer doesn't
    skip a leading rest and slip the channel out of phase."""
    rows = [REST] * ROWS_PER_PATTERN
    for b in range(ROWS_PER_PATTERN // BAR):
        for off in OSTINATO_ROWS:
            rows[b * BAR + off] = 'C-4'      # dummy pitch (snare = noise; tone off)
    return rows


def _pattern(bass_roots: list[str], lead_events: list) -> tuple:
    """bass_roots = one root per bar (2 bars); lead_events = (note, dur) summing
    to ROWS_PER_PATTERN. Brass is single-voice (no octave ornament — held brass
    must not warble)."""
    bass = []
    for r in bass_roots:
        bass += bass_bar(r)
    lead = line(lead_events, ROWS_PER_PATTERN)
    snare = snare_channel()
    return (encode_channel(bass, S_TIMP, V_BASS),
            encode_channel(lead, S_BRASS, V_LEAD),
            encode_channel(snare, S_SNARE, V_SNARE))


def make_p0() -> tuple:
    """Theme phrase A — rising martial brass over the G ostinato."""
    return _pattern(
        ['G-3', 'G-3'],
        [('G-3', 8), ('A#3', 4), ('C-4', 4), ('D-4', 4),    # bar1: climb
         ('D#4', 8), ('D-4', 4), ('C-4', 4), ('A#3', 4)])   # bar2: fall (b6 = Eb dread)


def make_p1() -> tuple:
    """Theme phrase B — answer, intensify, settle back toward G."""
    return _pattern(
        ['G-3', 'G-3'],
        [('D-4', 8), ('F-4', 4), ('D#4', 4), ('D-4', 4),
         ('C-4', 6), ('A#3', 4), ('G-3', 4), ('A#3', 6)])


def make_p2() -> tuple:
    """Development — bass drops a TRITONE to Db on bar 2; brass grinds (the
    bitonal Holst-Mars clash)."""
    return _pattern(
        ['G-3', 'C#3'],                                     # G -> Db (tritone)
        [('G-4', 8), ('F#4', 4), ('G-4', 4), ('A#4', 4),    # bar1 over G
         ('F-4', 8), ('D#4', 4), ('C#4', 4), ('C-4', 4)])   # bar2 over Db: Db echoes in melody


def make_p3() -> tuple:
    """Climax — high brass peak, then descend to loop back to P0."""
    return _pattern(
        ['G-3', 'G-3'],
        [('G-4', 4), ('A#4', 4), ('C-5', 4), ('D-5', 4), ('D#5', 4),  # climb to peak
         ('D-5', 8), ('C-5', 4), ('A#4', 4), ('G-4', 4)])             # descend -> loop


# -----------------------------------------------------------------------------
# Header + file assembly (same layout as the barbarian / mountain-king tools).
# -----------------------------------------------------------------------------
def build_pt3() -> bytes:
    patterns_data = [make_p0(), make_p1(), make_p2(), make_p3()]
    samples = {1: build_sample_brass(), 2: build_sample_timpani(), 3: build_sample_snare()}
    ornaments = [build_ornament_empty()]

    position_list = bytes([0 * 3, 1 * 3, 2 * 3, 3 * 3, 0xFF])

    header_size = 0xC9
    name = b'MARS, THE BRINGER OF WAR        '[:32]
    author = b'HOLST (PD) ARR. SAGA DARK       '[:32]

    pos_list_offset = header_size
    pos_list_end = pos_list_offset + len(position_list)
    pat_ptr_table_offset = pos_list_end
    pat_ptr_table_size = 6 * len(patterns_data)
    pat_bodies_offset = pat_ptr_table_offset + pat_ptr_table_size

    pat_addrs = []
    cursor = pat_bodies_offset
    pat_bodies = bytearray()
    for (a, b, c) in patterns_data:
        a_addr = cursor; pat_bodies.extend(a); cursor += len(a)
        b_addr = cursor; pat_bodies.extend(b); cursor += len(b)
        c_addr = cursor; pat_bodies.extend(c); cursor += len(c)
        pat_addrs.append((a_addr, b_addr, c_addr))

    sample_addr = {}
    sample_blob = bytearray()
    for idx in sorted(samples):
        sample_addr[idx] = cursor
        sample_blob.extend(samples[idx]); cursor += len(samples[idx])

    ornament_addrs = []
    orn_blob = bytearray()
    for orn in ornaments:
        ornament_addrs.append(cursor)
        orn_blob.extend(orn); cursor += len(orn)

    h = bytearray(header_size)
    h[0x00:0x0D] = b'ProTracker 3.'
    h[0x0D] = ord('5')
    h[0x0E:0x1E] = b' compilation of '
    h[0x1E:0x3E] = name.ljust(32)
    h[0x3E:0x42] = b' by '
    h[0x42:0x62] = author.ljust(32)
    h[0x62] = 0x20
    h[0x63] = 1                       # frequency table 1 (ST)
    h[0x64] = 5                       # speed (frames/row) — 5 = quarter ~150 BPM
    h[0x65] = len(patterns_data) + 1
    h[0x66] = 0                       # loop pointer = first position
    h[0x67:0x69] = pat_ptr_table_offset.to_bytes(2, 'little')
    for i in range(32):
        addr = sample_addr.get(i, 0)
        h[0x69 + i * 2: 0x6B + i * 2] = addr.to_bytes(2, 'little')
    for i in range(16):
        addr = ornament_addrs[i] if i < len(ornament_addrs) else 0
        h[0xA9 + i * 2: 0xAB + i * 2] = addr.to_bytes(2, 'little')

    ppt = bytearray()
    for (a_addr, b_addr, c_addr) in pat_addrs:
        ppt += a_addr.to_bytes(2, 'little')
        ppt += b_addr.to_bytes(2, 'little')
        ppt += c_addr.to_bytes(2, 'little')

    return bytes(h) + position_list + bytes(ppt) + bytes(pat_bodies) + \
        bytes(sample_blob) + bytes(orn_blob)


def main():
    pt3 = build_pt3()
    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUT_PATH.write_bytes(pt3)
    print(f"Wrote {OUT_PATH}  ({len(pt3)} bytes)")


if __name__ == '__main__':
    main()
