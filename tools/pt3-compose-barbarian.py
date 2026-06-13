#!/usr/bin/env python3
"""Compose an ORIGINAL sword-and-sorcery / "barbarian" battle theme as a PT3
module for the AY-3-8910 on the ZX Spectrum +2 128K — the platformer's in-game
track.

This is an *homage to the genre's sound* (heroic minor, galloping 6/8 war
ostinato, brass-like horn fanfares, AY noise war-drums), NOT a transcription of
any copyrighted score. Musical STYLE, meter, mode, chord progressions and
instrumentation are not copyrightable; only specific melodies are. Every
melody, bassline and rhythm here is freshly written, so the module is clean to
bundle and distribute. See CONTEXT.md's PT3 licensing doctrine.

Format machinery (note encoding, channel packer, PT3 header assembly) follows
the proven path of tools/pt3-compose-mountain-king.py so the output loads in
Sergey Bulba's PT3 player bundled in bank 7.

Arrangement — D minor (Aeolian / natural minor, modal v), 3 channels, **6/8 compound
meter**, speed 3 (fast galloping march):
  - Channel A (bass timpani): pitched chord roots on a sample whose attack mixes
                              NOISE + tone then decays to pure tone -> a tuned
                              war-timpani "DHOOM". Hits the two dotted-quarter
                              beats + a pickup.
  - Channel B (horn call):    declamatory original fanfare; octave-doubled via
                              ornament on SHORT notes only (held notes stay
                              single-voice — the octave tremolo warbles on a
                              sustained note); fast climactic run in pattern 4.
  - Channel C (war drum):     pure-NOISE snare bursts on the off-eighths -> the
                              relentless gallop "boom-ta-ta-boom-ta-ta".

Meter/grid: 1 row = 1 sixteenth; 12 rows = one 6/8 bar (two beats of 3 eighths);
48 rows = 4 bars per pattern. Eighth pulse on even rows 0,2,4,6,8,10.

Structure (4 patterns, looped):
  P0  Dm | Bb | C  | Dm   main vamp           (i  bVI bVII i)
  P1  Dm | Bb | C  | Am   triumphant, modal v cadence
  P2  F  | C  | Dm | Am   bright bridge, pull back to the modal v
  P3  Dm | C  | Bb | Am   climax: galloping 8th-note lead run -> loop

Iteration log:
  v1 (2026-06-04) — 4/4, tone-only anvil bass + horn + open-fifth harmony.
  v2 (2026-06-04) — reworked to 6/8 gallop; added AY-noise war-drums (timpani
                     kick on ch A via noise+tone attack sample; snare on ch C via
                     pure-noise sample); octave-doubled horn lead; faster.
"""

from __future__ import annotations
from pathlib import Path

OUT_PATH = Path(__file__).resolve().parent.parent / \
    "remakes/128k-plus2-platformer/src/music/barbarian.pt3"

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

ROWS_PER_PATTERN = 48
BAR = 12                       # rows per 6/8 bar (sixteenth grid)


# -----------------------------------------------------------------------------
# Channel packer — same semantics as the mountain-king tool (NNtSkp via `B1 N`
# before the first note, notes/OFF/0xC0 terminate rows, trailing rests hold).
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
# Samples. byte1 mix bits (per player mixer cascade): bit7=1 noise OFF, bit4=1
# tone OFF. So: 0x80|amp = tone only; 0x10|amp = noise only; 0x00|amp = both.
# byte0 = 0x00 (no slide/env -> noise period R6 stays at base 0 = bright).
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


def build_sample_horn() -> bytes:
    """Lead horn: tone only, slight attack-decay then sustain for some life."""
    amps = [15, 15, 14, 14, 13, 13, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12]
    return _sample_raw([0x80 | a for a in amps])


def build_sample_timpani() -> bytes:
    """Tuned war-timpani 'DHOOM': 2 ticks of NOISE+tone (percussive attack at the
    note's pitch), then pure-tone decay to a low pitched tail."""
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


def build_ornament_octave() -> bytes:
    """Octave doubling (root, root+12) — stacked-horn power for the fanfare."""
    return bytes([0x00, 0x01, 0, 12])


# -----------------------------------------------------------------------------
# Sample / ornament / volume assignments.
# -----------------------------------------------------------------------------
S_HORN, S_TIMP, S_SNARE = 1, 2, 3
ORN_OCT = 1
V_BASS, V_LEAD, V_SNARE = 15, 15, 12


def bass_bar(root: str) -> list:
    """Galloping war-timpani per 6/8 bar: beat 1 (dur6), beat 2 (dur4) + a
    pickup sixteenth (dur2) pushing into the next bar."""
    return line([(root, 6), (root, 4), (root, 2)], BAR)


def snare_channel() -> list:
    """Pure-noise snares on the off-eighths (rows 2,4,8,10 of each bar) -> the
    gallop between the timpani kicks. Row 0 anchored with OFF so the packer
    doesn't skip the leading rest and slip the whole channel out of phase."""
    rows = [REST] * ROWS_PER_PATTERN
    for b in range(ROWS_PER_PATTERN // BAR):
        for off in (2, 4, 8, 10):
            rows[b * BAR + off] = 'C-4'      # dummy pitch (snare = noise; tone off)
    if rows[0] == REST:
        rows[0] = OFF
    return rows


def lead_line(events: list, orn: int, long_thresh: int = 4) -> list:
    """Expand (note, dur) lead events. Apply the octave ornament only on SHORT
    notes (dur < long_thresh); keep LONG sustained notes single-voice. The
    octave ornament arpeggiates note<->octave every frame, which reads as bright
    on short notes but as a warbling/piercing tremolo on a held note — most
    exposed on the sustained note that ENDS each phrase. Per-note ornament
    toggles are emitted as opts; the packer persists ornament state between."""
    out: list = []
    cur = None
    total = 0
    for note, dur in events:
        want = orn if (orn and dur < long_thresh) else 0
        if want != cur:
            out.append((note, {'ornament': want}))
            cur = want
        else:
            out.append(note)
        out.extend([REST] * (dur - 1))
        total += dur
    assert total == ROWS_PER_PATTERN, f"lead is {total} rows, expected {ROWS_PER_PATTERN}"
    return out


def _pattern(bass_roots: list[str], lead_events: list, lead_orn: int) -> tuple:
    bass = []
    for r in bass_roots:
        bass += bass_bar(r)
    lead = lead_line(lead_events, lead_orn)
    snare = snare_channel()
    return (encode_channel(bass, S_TIMP, V_BASS),
            encode_channel(lead, S_HORN, V_LEAD, ornament=0),
            encode_channel(snare, S_SNARE, V_SNARE))


def make_p0() -> tuple:
    """Main vamp Dm-Bb-C-Dm: rising heroic horn call (octave-doubled)."""
    return _pattern(
        ['D-3', 'A#2', 'C-3', 'D-3'],
        [('D-4', 6), ('A-4', 6),          # Dm: rising fifth
         ('D-5', 6), ('F-5', 6),          # Bb: leap up, bVI
         ('E-5', 6), ('G-5', 6),          # C: bright peak
         ('F-5', 3), ('E-5', 3), ('D-5', 6)],  # Dm: descend home
        ORN_OCT)


def make_p1() -> tuple:
    """Triumphant variation Dm-Bb-C-A, ends on the dominant."""
    return _pattern(
        ['D-3', 'A#2', 'C-3', 'A-2'],
        [('A-4', 6), ('D-5', 6),
         ('F-5', 6), ('A#5', 6),          # high peak = Bb5 (root octave of the bVI; was A-5 = a clashing maj7 over Bb)
         ('G-5', 6), ('E-5', 3), ('C-5', 3),
         ('C-5', 6), ('E-5', 6)],         # modal v = Am (C natural): darker Aeolian cadence, no leading tone
        ORN_OCT)


def make_p2() -> tuple:
    """Bright bridge F-C-Dm-A (lift to relative major, pull back via V)."""
    return _pattern(
        ['F-2', 'C-3', 'D-3', 'A-2'],
        [('F-4', 6), ('C-5', 6),          # F major: hope
         ('E-5', 6), ('G-5', 6),
         ('F-5', 6), ('D-5', 3), ('A-4', 3),
         ('C-5', 6), ('E-5', 6)],         # modal v = Am (C natural), no leading tone
        ORN_OCT)


def make_p3() -> tuple:
    """Climax Dm-C-Bb-A: galloping eighth-note lead run (no ornament = clean
    fast line), ends on V to loop back to P0."""
    return _pattern(
        ['D-3', 'C-3', 'A#2', 'A-2'],
        [('D-5', 2), ('E-5', 2), ('F-5', 2), ('A-5', 2), ('G-5', 2), ('F-5', 2),  # Dm
         ('E-5', 2), ('G-5', 2), ('C-6', 2), ('G-5', 2), ('E-5', 2), ('C-5', 2),  # C
         ('D-5', 2), ('F-5', 2), ('A#5', 2), ('F-5', 2), ('D-5', 2), ('A#4', 2),  # Bb
         ('A-4', 2), ('C-5', 2), ('E-5', 2), ('A-5', 2), ('E-5', 2), ('C-5', 2)], # Am (modal v, C natural)
        0)


# -----------------------------------------------------------------------------
# Header + file assembly (same layout as the mountain-king tool).
# -----------------------------------------------------------------------------
def build_pt3() -> bytes:
    patterns_data = [make_p0(), make_p1(), make_p2(), make_p3()]
    samples = {1: build_sample_horn(), 2: build_sample_timpani(), 3: build_sample_snare()}
    ornaments = [build_ornament_empty(), build_ornament_octave()]

    position_list = bytes([0 * 3, 1 * 3, 2 * 3, 3 * 3, 0xFF])

    header_size = 0xC9
    name = b'BARBARIAN WAR-MARCH (SAGA DARK)  '[:32]
    author = b'SAGA DARK / ORIGINAL            '[:32]

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
    h[0x64] = 3                       # speed (frames/row) — 3 = fast gallop
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
