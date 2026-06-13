#!/usr/bin/env python3
"""Compose the dragon-victory music as a PT3 module for the AY-3-8910.

Brief: a triumphant, fast-paced "you won!" piece that echoes the Mountain
King motif (the in-game theme) but transformed into A MAJOR, faster tempo,
ascending bass, and a perfect-cadence finale on a held tonic chord.

Arrangement: A major, 3 channels.
  - Channel A (bass):     ascending tonic→dominant walk (A-E-A) under each
                          statement. The opposite of the descending chromatic
                          bass of Mountain King — psychologically "uplifting"
                          instead of "looming".
  - Channel B (lead):     fanfare opening (A-C#-E-A octave climb) followed by
                          a major-mode rewrite of the Mountain King motif
                          (A-C#-E-A-C#-E-A-E), capped with a tonic resolution.
  - Channel C (harmony):  sustained chord tones + a final long tonic.

Iteration log:
  v1 (2026-05-20) — first draft. 4 patterns @ speed=3 (≈117 BPM, "allegro"):
    - Pattern 0: fanfare opening (A-C#-E-A octave arpeggio, channels build up).
    - Pattern 1: motif in A major + sustained third in harmony.
    - Pattern 2: variation transposed up a step (B major) for lift.
    - Pattern 3: perfect cadence (E7 → A major) + held tonic chord finale.
    Loops back to Pattern 1 (skips the opening fanfare on subsequent loops).
"""

from __future__ import annotations
from pathlib import Path

OUT_PATH = Path(__file__).resolve().parent.parent / \
    "remakes/128k-plus2-dragon/src/music/victory.pt3"

NOTE_NAMES = ['C-', 'C#', 'D-', 'D#', 'E-', 'F-', 'F#', 'G-', 'G#', 'A-', 'A#', 'B-']
NOTE_TO_BYTE: dict[str, int] = {}
for octave in range(1, 9):
    for i, name in enumerate(NOTE_NAMES):
        NOTE_TO_BYTE[f"{name}{octave}"] = 0x50 + (octave - 1) * 12 + i

REST = '---'
OFF = 'OFF'


def encode_channel(rows, default_sample: int = 1, default_volume: int = 15) -> bytes:
    """Encode a channel's row events into PT3 byte stream. Same encoder used
    by the Mountain King generator — see that file for the full PT3 quirks
    write-up (NNtSkp underflow, B1 N skip-count emission rules, etc.)."""
    out = bytearray()
    cur_sample = default_sample
    cur_volume = default_volume
    cur_ornament = 0
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


def build_sample_default() -> bytes:
    LENGTH = 16
    out = bytearray()
    out.append(LENGTH - 1)
    out.append(LENGTH - 1)
    for _ in range(LENGTH):
        amp = 0xF
        byte0 = 0x00
        byte1 = 0x80 | (amp & 0x0F)
        out.append(byte0)
        out.append(byte1)
        out.append(0x00)
        out.append(0x00)
    return bytes(out)


def build_ornament_empty() -> bytes:
    return bytes([0x00, 0x00, 0x00])


def build_ornament_major_arp() -> bytes:
    """Major-triad arpeggio: root, major-third, perfect fifth."""
    return bytes([0x00, 0x02, 0, 4, 7])


def build_ornament_octave() -> bytes:
    """Octave doubling for big-sound moments (root + root+12)."""
    return bytes([0x00, 0x01, 0, 12])


ROWS_PER_PATTERN = 32


def _motif(notes, rows_per_note: int):
    out = []
    for n in notes:
        out.append(n)
        out.extend([REST] * (rows_per_note - 1))
    return out


# -----------------------------------------------------------------------------
# Pattern 0 — Opening fanfare. A major octave-arpeggio climb, channels enter
# one by one: bass first, then lead joins, then harmony. Sets the triumphant
# tone before the motif statements begin.
# -----------------------------------------------------------------------------
def make_pattern_opening() -> tuple[bytes, bytes, bytes]:
    # Bass: tonic pedal A2 throughout (foundation).
    bass = _motif(['A-2', 'A-2', 'A-2', 'A-2', 'A-2', 'A-2', 'A-2', 'A-2'], 4)
    # Lead: octave climb A4-C#5-E5-A5-E5-C#5-A4-A5 — classic fanfare arc.
    lead_notes = ['A-4', 'C#5', 'E-5', 'A-5', 'E-5', 'C#5', 'A-4', 'A-5']
    lead = _motif(lead_notes, 4)
    # Harmony: enters at row 8 (2nd note) with sustained thirds.
    harm = [REST] * 8 + _motif(['C#5', 'E-5', 'C#5', 'E-5', 'C#5', 'A-4'], 4)
    return (encode_channel(bass, default_volume=12),
            encode_channel(lead, default_volume=15),
            encode_channel(harm, default_volume=11))


# -----------------------------------------------------------------------------
# Pattern 1 — A major motif. The Mountain King motif (A-?-?-A-?-?-A-?) but
# rewritten with MAJOR thirds (C#, not C) so it sounds "winning" instead of
# "menacing". Bass walks I-V-I-V to support the major tonality.
# -----------------------------------------------------------------------------
def make_pattern_major_motif() -> tuple[bytes, bytes, bytes]:
    # Bass: I-V-I-V walk (A2-E2-A2-E2-A2-E2-A2-E2), 4 rows each.
    bass = _motif(['A-2', 'E-2', 'A-2', 'E-2', 'A-2', 'E-2', 'A-2', 'E-2'], 4)
    # Lead: the Grieg motif in MAJOR. A-C#-E-A-C#-E-A-E.
    lead = _motif(['A-4', 'C#5', 'E-5', 'A-4', 'C#5', 'E-5', 'A-4', 'E-5'], 4)
    # Harmony: sustained third (C#5) with major arp ornament for chord feel.
    harm = [('C#5', {'ornament': 1})]
    harm.extend([REST] * 31)
    return (encode_channel(bass, default_volume=13),
            encode_channel(lead, default_volume=15),
            encode_channel(harm, default_volume=11))


# -----------------------------------------------------------------------------
# Pattern 2 — Lifted variation. Same motif transposed up to B major (lift up
# a tone). Builds energy before the cadence pattern.
# -----------------------------------------------------------------------------
def make_pattern_lifted() -> tuple[bytes, bytes, bytes]:
    # Bass: B2 pedal alternating with F#2 (V of B major).
    bass = _motif(['B-2', 'F#2', 'B-2', 'F#2', 'B-2', 'F#2', 'B-2', 'F#2'], 4)
    # Lead: motif in B major. B-D#-F#-B-D#-F#-B-F#.
    lead = _motif(['B-4', 'D#5', 'F#5', 'B-4', 'D#5', 'F#5', 'B-4', 'F#5'], 4)
    harm = [('D#5', {'ornament': 1})]
    harm.extend([REST] * 31)
    return (encode_channel(bass, default_volume=13),
            encode_channel(lead, default_volume=15),
            encode_channel(harm, default_volume=12))


# -----------------------------------------------------------------------------
# Pattern 3 — Cadence + finale. E7 dominant (tension) resolves to A major
# tonic (release), sustained for the final 16 rows on all three channels
# with the major-arp ornament for chord feel.
# -----------------------------------------------------------------------------
def make_pattern_cadence() -> tuple[bytes, bytes, bytes]:
    # First 16 rows: E7 dominant chord ascending arpeggio in lead. Bass on E.
    # Last 16 rows: held A major tonic.
    bass = _motif(['E-2', 'E-2', 'E-2', 'E-2', 'A-2', 'A-2', 'A-2', 'A-2'], 4)
    lead = _motif(['E-4', 'G#4', 'B-4', 'D-5',                # E7 ascending
                   'A-4', 'C#5', 'E-5', 'A-5'], 4)            # A major resolution
    # Harmony: E4 (5th of A) during dominant, then sustained A major chord
    # (C#5 with major arp ornament for triad feel) during resolution.
    harm = _motif(['B-4', 'B-4', 'B-4', 'B-4'], 4) + \
           [('C#5', {'ornament': 1})]
    harm.extend([REST] * 15)
    return (encode_channel(bass, default_volume=14),
            encode_channel(lead, default_volume=15),
            encode_channel(harm, default_volume=13))


def build_pt3() -> bytes:
    patterns_data = [
        make_pattern_opening(),       # 0: opening fanfare
        make_pattern_major_motif(),   # 1: motif in A major
        make_pattern_lifted(),        # 2: lifted to B major
        make_pattern_cadence(),       # 3: cadence + tonic hold
    ]
    sample_data = build_sample_default()
    ornaments = [
        build_ornament_empty(),
        build_ornament_major_arp(),
    ]

    # Position list: opening once, then motif → lifted → cadence as a 3-pat
    # loop. After cadence, loop back to motif (skip the opening fanfare on
    # re-entries — only plays once).
    position_list = bytes([
        0 * 3,   # opening fanfare (plays once on entry)
        1 * 3,   # motif A major
        2 * 3,   # lifted B major
        3 * 3,   # cadence + finale
        0xFF,
    ])
    loop_pointer = 1  # loop back to position 1 (skip the opening)

    header_size = 0xC9
    name = b'VICTORY (DRAGON, v1)            '[:32]
    author = b'SAGA DARK / GRIEG TRIB (PD)     '[:32]

    pos_list_offset = header_size
    pos_list_end = pos_list_offset + len(position_list)

    pat_ptr_table_offset = pos_list_end
    pat_ptr_table_size = 6 * len(patterns_data)
    pat_bodies_offset = pat_ptr_table_offset + pat_ptr_table_size

    pat_addrs = []
    cursor = pat_bodies_offset
    pat_bodies = bytearray()
    for (a, b, c) in patterns_data:
        a_addr = cursor
        pat_bodies.extend(a); cursor += len(a)
        b_addr = cursor
        pat_bodies.extend(b); cursor += len(b)
        c_addr = cursor
        pat_bodies.extend(c); cursor += len(c)
        pat_addrs.append((a_addr, b_addr, c_addr))

    sample_addr = cursor
    cursor += len(sample_data)

    ornament_addrs = []
    for orn in ornaments:
        ornament_addrs.append(cursor)
        cursor += len(orn)

    h = bytearray(header_size)
    h[0x00:0x0D] = b'ProTracker 3.'
    h[0x0D] = ord('5')
    h[0x0E:0x1E] = b' compilation of '
    h[0x1E:0x3E] = name.ljust(32)
    h[0x3E:0x42] = b' by '
    h[0x42:0x62] = author.ljust(32)
    h[0x62] = 0x20
    h[0x63] = 1                      # frequency table 1 (ST)
    h[0x64] = 3                      # speed = 3 → ~117 BPM allegro/triumphant
    h[0x65] = len(patterns_data) + 1
    h[0x66] = loop_pointer           # loop back to position 1 (skip opening)
    h[0x67:0x69] = pat_ptr_table_offset.to_bytes(2, 'little')
    for i in range(32):
        addr = sample_addr if i == 1 else 0
        h[0x69 + i * 2: 0x6B + i * 2] = addr.to_bytes(2, 'little')
    for i in range(16):
        addr = ornament_addrs[i] if i < len(ornament_addrs) else 0
        h[0xA9 + i * 2: 0xAB + i * 2] = addr.to_bytes(2, 'little')

    ppt = bytearray()
    for (a_addr, b_addr, c_addr) in pat_addrs:
        ppt += a_addr.to_bytes(2, 'little')
        ppt += b_addr.to_bytes(2, 'little')
        ppt += c_addr.to_bytes(2, 'little')

    out = bytes(h) + position_list + bytes(ppt) + bytes(pat_bodies) + \
          sample_data + b''.join(ornaments)
    return out


def main():
    pt3 = build_pt3()
    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUT_PATH.write_bytes(pt3)
    print(f"Wrote {OUT_PATH}  ({len(pt3)} bytes)")


if __name__ == '__main__':
    main()
