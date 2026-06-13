#!/usr/bin/env python3
"""Compose 'In the Hall of the Mountain King' (Grieg, public domain) as a
PT3 module for the AY-3-8910 chip on the ZX Spectrum +2 128K.

This is a from-scratch generator: it emits a byte-for-byte valid PT3 file
suitable for Vortex Tracker II / Pro Tracker v3.5+, loadable by Sergey
Bulba's PT3 player (the one we bundle in the dragon build).

Arrangement: A minor, 3 channels.
  - Channel A (bass):     descending chromatic line A2 → E2 (the iconic Grieg
                          bassline) under each motif statement.
  - Channel B (lead):     the 8-note motif (A-B-C-B-A-C-A-rest), repeated
                          ascending step-wise — chromatic transposition per
                          statement, just like the original.
  - Channel C (harmony):  m-third pedal an octave above lead, doubled for
                          weight; rests where the motif syncopates.

Reference: spec at deater.net/weave/vmwprod/pt3_player/README_pt3.txt.
Output: src/music/mountain-king.pt3 (target file).

Iteration log:
  v1 (2026-05-13) — first audible draft. Single 32-row pattern, looped.
                     Speed=6 (medium-slow, ~70 BPM). 1 sample (sustained
                     square wave with brief amplitude fade). No ornaments.
                     Intent: prove the toolchain end-to-end; musicality
                     comes in v2+ after user feedback.
"""

from __future__ import annotations
from pathlib import Path

OUT_PATH = Path(__file__).resolve().parent.parent / \
    "remakes/128k-plus2-dragon/src/music/mountain-king.pt3"

# -----------------------------------------------------------------------------
# Note encoding: PT3 maps semitones to bytes 0x50 (C-1) through 0xAF (B-8).
# Each octave is 12 semitones (12 bytes). Octave 1 starts at C-1 = 0x50.
# -----------------------------------------------------------------------------
NOTE_NAMES = ['C-', 'C#', 'D-', 'D#', 'E-', 'F-', 'F#', 'G-', 'G#', 'A-', 'A#', 'B-']
NOTE_TO_BYTE: dict[str, int] = {}
for octave in range(1, 9):  # octaves 1..8
    for i, name in enumerate(NOTE_NAMES):
        NOTE_TO_BYTE[f"{name}{octave}"] = 0x50 + (octave - 1) * 12 + i

# Sentinels in our pattern-event mini-language:
REST = '---'   # rest (no note this row — note continues / silence)
OFF = 'OFF'    # explicit note-off (PT3 0xC0)


# -----------------------------------------------------------------------------
# Pattern data encoder.
#
# PT3 packs each channel as a nul-terminated stream of bytes. Each row in the
# tracker corresponds to a sequence of bytes that ends with one of:
#   - a note byte (0x50..0xAF) → terminates the row,
#   - 0xC0 (note off) → terminates the row,
#   - 0xD0 (end-of-note marker, "keep playing previous note") → terminates,
#   - 0xB1 + skip_count → terminates the row AND skips rows (RLE for rests).
#
# Effects/setup bytes appear BEFORE the terminator: 0x40..0x4F (ornament),
# 0xC1..0xCF (volume), 0xD1..0xEF (sample), 0xF0..0xFF (init both), etc.
# -----------------------------------------------------------------------------

def encode_channel(rows: list[str | tuple], default_sample: int = 1,
                   default_volume: int = 15) -> bytes:
    """Encode a list of per-row events for one channel into PT3 byte stream.

    PT3 quirk (traced in the player): channel state has NNtSkp ("New Note Skip"),
    which after each pattern read is copied into NtSkCn. NtSkCn is decremented
    on each row-advance; the channel only reads new pattern bytes when NtSkCn
    hits 0. Default NNtSkp at INIT is 0 — which would underflow to 255 and lock
    the channel. So every channel MUST emit a `B1 N` (set NNtSkp) before its
    first note. NNtSkp persists across rows until changed.

    To play a note for N rows: emit `B1 N` once, then a note byte for each
    new row N rows apart. Trailing rests are implicit (no D0 between notes).

    Wire format per channel:
        [setup bytes...] B1 N [F0 sample_x2 | note]   ← first row
        ...
        [B1 M if N changes] [note]                     ← subsequent rows
        0x00                                            ← end of channel
    """
    out = bytearray()
    cur_sample = default_sample
    cur_volume = default_volume
    cur_ornament = 0
    cur_skip = 0     # 0 means "not yet emitted any B1" — must do so before any note
    first_note_emitted = False
    initial_volume_emitted = False

    # Skip leading rests — there's no preceding note to extend through them.
    # A channel that wants silence at the start should start with an OFF marker.
    i = 0
    while i < len(rows) and rows[i] == REST:
        i += 1

    while i < len(rows):
        row = rows[i]
        note = row
        opts = {}
        if isinstance(row, tuple):
            note, opts = row[0], row[1] if len(row) > 1 else {}

        # Count trailing REST rows (note will hold through them).
        rest_after = 0
        j = i + 1
        while j < len(rows) and rows[j] == REST:
            rest_after += 1
            j += 1
        # Desired NNtSkp for this note: 1 (note's own row) + rest_after.
        desired_skip = 1 + rest_after

        # --- Setup bytes (before the terminator) ----------------------------
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

        # First note ever: set initial volume if not set yet.
        if not initial_volume_emitted:
            out.append(0xC0 | (default_volume & 0x0F))
            initial_volume_emitted = True

        # Emit B1 N when skip count needs to be (re)set.
        if desired_skip != cur_skip:
            cur_skip = desired_skip
            out.append(0xB1)
            out.append(desired_skip)

        # --- Terminator: note or note-off -----------------------------------
        if note == OFF:
            out.append(0xC0)
        else:
            if not first_note_emitted:
                # First note ever needs F0+orn / sample*2 init.
                out.append(0xF0 | (cur_ornament & 0x0F))
                out.append((cur_sample & 0x1F) * 2)
                first_note_emitted = True
            out.append(NOTE_TO_BYTE[note])

        i = j

    out.append(0x00)
    return bytes(out)


# -----------------------------------------------------------------------------
# Sample format: each "tick value" is 4 bytes. Bytes 0/1 are control flags;
# bytes 2/3 are the base tone offset (little-endian, signed).
#
# The mixer bit cascade (traced in pt3_play.asm, label CH_MIX):
#   A = byte1
#   RRA + AND #48   → keeps bits 7 and 4 of byte1 (in positions 6 and 3 of A)
#   OR with current mixer; RRCA; store
#   Repeated for channels A/B/C. After the 3-channel cascade, byte1 bits 7+4
#   end up in AY R7 (mixer) at positions 5/4/3 (noise disable) or 2/1/0 (tone
#   disable) depending on channel.
#
# Empirical: byte1 = 0x80 | amp → mixer 0x38 = noise OFF + tone ON (what we want).
# Originally tried 0x10 | amp → mixer 0x07 = tones OFF + noise ON (white noise!).
# AY R7: bits 5/4/3 = noise A/B/C disable; bits 2/1/0 = tone A/B/C disable.
# -----------------------------------------------------------------------------

def build_sample_default() -> bytes:
    """A simple sustained-amplitude sample.

    16 ticks, looping. Each tick: tone enabled (bit 7 of byte1 set → noise
    disabled by the player's mixer cascade), no noise, amplitude at 0xF.
    The PT3 player applies per-channel volume on top.
    """
    LENGTH = 16
    out = bytearray()
    out.append(LENGTH - 1)   # loop value: when reaching end, jump back to this index
    out.append(LENGTH - 1)   # length (0-indexed: N means N+1 ticks)
    # Per-tick 4-byte entries.
    for i in range(LENGTH):
        amp = 0xF                        # full amplitude per tick
        byte0 = 0x00                     # no slide
        byte1 = 0x80 | (amp & 0x0F)      # bit 7 set → noise disabled; tone on
        out.append(byte0)
        out.append(byte1)
        out.append(0x00)                 # tone offset lo
        out.append(0x00)                 # tone offset hi
    return bytes(out)


def build_ornament_empty() -> bytes:
    """A 1-tick ornament with offset 0 — effectively no arpeggio."""
    return bytes([0x00, 0x00, 0x00])


def build_ornament_minor_arp() -> bytes:
    """Minor-triad arpeggio: cycle through root, minor-third, fifth.
    Per-frame offsets in semitones. With speed=4 (4 frames/row), this
    cycles ~3 times per row at 50 Hz — fast enough to perceive as a chord."""
    # loop=0 (cycle back to start), length=2 (3 values: indices 0..2),
    # values: 0 (root), 3 (minor third), 7 (perfect fifth).
    return bytes([0x00, 0x02, 0, 3, 7])


def build_ornament_octave_jump() -> bytes:
    """Octave jump: root, root+12. For bass for a bigger sound."""
    return bytes([0x00, 0x01, 0, 12])


# -----------------------------------------------------------------------------
# Mountain King melody data (v2)
#
# Structure (4 patterns, each 32 rows, speed=4 → ~88 BPM moderato):
#   Pattern 0 — A minor, sparse: bass + lead only, builds tension.
#   Pattern 1 — A minor, full:   adds harmony in thirds/sixths.
#   Pattern 2 — D minor, sparse: motif transposed up a fourth.
#   Pattern 3 — D minor, full:   climax with harmony + slight transposition up.
#
# Bass: descending chromatic line under each motif statement (Grieg's signature
# trick — the bass walks DOWN while the motif marches forward, creating
# delicious harmonic tension). 8 notes per pattern, 4 rows each.
#
# Lead: the 8-note Mountain King motif: A C B A G# A C E  (A minor).
# 8 notes per pattern, 4 rows each — but lead notes can also occupy 2 rows
# for the faster second half of the motif (the rhythm tightens).
# -----------------------------------------------------------------------------
ROWS_PER_PATTERN = 32

def _bass_descending(root: str, length: int = 8) -> list:
    """Build a chromatic-descending bass line starting at `root`.
    Each note lasts 4 rows."""
    # Order semitones down: 0, 1, 2, 3, 4, ...
    note_to_pc = {n: i for i, n in enumerate(NOTE_NAMES)}
    octave = int(root[-1])
    pc = note_to_pc[root[:2]]
    out = []
    for k in range(length):
        cur_pc = (pc - k) % 12
        cur_oct = octave - ((pc - k < 0) and 1 or 0)
        if pc - k < 0:
            cur_oct -= ((-pc + k - 1) // 12)
        name = f"{NOTE_NAMES[cur_pc]}{cur_oct}"
        out.append(name)
        out.extend([REST] * 3)   # 4 rows per note
    return out


def _motif(notes: list[str], rows_per_note: int) -> list:
    """Build a lead/harmony line from a note list, each note `rows_per_note` rows."""
    out = []
    for n in notes:
        out.append(n)
        out.extend([REST] * (rows_per_note - 1))
    return out


# Real Mountain King motif (Grieg, Peer Gynt Op. 23): an arpeggio of the
# tonic minor triad (1-b3-5) climbed and resolved back: A C E A | C E A E.
# Each "statement" of the motif is 8 notes. Original modulates UP per
# repetition (chromatic ascent) and accelerates. We replicate via:
#   - 4 patterns at successively higher pitch ranges
#   - F4 dynamic tempo handles the acceleration in-game


def make_pattern_a_sparse() -> tuple[bytes, bytes, bytes]:
    """Pattern 0 — A minor, bass + lead only. Mid-range, sparse intro."""
    bass = _bass_descending('A-3', 8)
    # The canonical Mountain King arpeggio motif, A minor: A C E A C E A E.
    motif = ['A-4', 'C-5', 'E-5', 'A-4', 'C-5', 'E-5', 'A-4', 'E-5']
    lead = _motif(motif, 4)
    harmony = [REST] * 32
    return (encode_channel(bass, default_volume=12),
            encode_channel(lead, default_volume=15),
            encode_channel(harmony, default_volume=10))


def make_pattern_a_full() -> tuple[bytes, bytes, bytes]:
    """Pattern 1 — A minor, full: bass + lead + arpeggio fake-chord harmony."""
    bass = _bass_descending('A-3', 8)
    motif = ['A-4', 'C-5', 'E-5', 'A-4', 'C-5', 'E-5', 'A-4', 'E-5']
    lead = _motif(motif, 4)
    # Harmony sustains the chord root; ornament fills in third + fifth.
    harmony_roots = ['A-4', 'A-4', 'A-4', 'A-4', 'A-4', 'A-4', 'A-4', 'A-4']
    harmony = _motif(harmony_roots, 4)
    harmony[0] = ('A-4', {'ornament': 1})
    return (encode_channel(bass, default_volume=12),
            encode_channel(lead, default_volume=15),
            encode_channel(harmony, default_volume=10))


def make_pattern_d_sparse() -> tuple[bytes, bytes, bytes]:
    """Pattern 2 — Bb minor (transposed up a half-step, the Grieg chromatic
    modulation), bass + lead. Mid range."""
    bass = _bass_descending('A#3', 8)
    motif = ['A#4', 'C#5', 'F-5', 'A#4', 'C#5', 'F-5', 'A#4', 'F-5']
    lead = _motif(motif, 4)
    harmony = [REST] * 32
    return (encode_channel(bass, default_volume=12),
            encode_channel(lead, default_volume=15),
            encode_channel(harmony, default_volume=10))


def make_pattern_d_climax() -> tuple[bytes, bytes, bytes]:
    """Pattern 3 — Bb minor, full: motif twice (tempo feel ×2), arp harmony."""
    bass = _bass_descending('A#3', 8)
    motif = ['A#4', 'C#5', 'F-5', 'A#4', 'C#5', 'F-5', 'A#4', 'F-5']
    lead = []
    for _ in range(2):
        lead.extend(_motif(motif, 2))
    harmony_roots = ['A#4'] * 16
    harmony = _motif(harmony_roots, 2)
    harmony[0] = ('A#4', {'ornament': 1})
    return (encode_channel(bass, default_volume=12),
            encode_channel(lead, default_volume=15),
            encode_channel(harmony, default_volume=11))


def make_pattern_a_high() -> tuple[bytes, bytes, bytes]:
    """Pattern 4 — B minor (up another semitone), accelerating feel."""
    bass = _bass_descending('B-3', 8)
    motif = ['B-4', 'D-5', 'F#5', 'B-4', 'D-5', 'F#5', 'B-4', 'F#5']
    lead = []
    for _ in range(2):
        lead.extend(_motif(motif, 2))
    harmony_roots = ['B-4'] * 16
    harmony = _motif(harmony_roots, 2)
    harmony[0] = ('B-4', {'ornament': 1})
    return (encode_channel(bass, default_volume=13),
            encode_channel(lead, default_volume=15),
            encode_channel(harmony, default_volume=11))


def make_pattern_final_climax() -> tuple[bytes, bytes, bytes]:
    """Pattern 5 — C minor at high range, final climax."""
    bass = _bass_descending('C-4', 8)
    motif = ['C-5', 'D#5', 'G-5', 'C-5', 'D#5', 'G-5', 'C-5', 'G-5']
    lead = []
    for _ in range(2):
        lead.extend(_motif(motif, 2))
    harmony_roots = ['C-5'] * 16
    harmony = _motif(harmony_roots, 2)
    harmony[0] = ('C-5', {'ornament': 1})
    return (encode_channel(bass, default_volume=14),
            encode_channel(lead, default_volume=15),
            encode_channel(harmony, default_volume=12))


# -----------------------------------------------------------------------------
# Header + file assembly.
# -----------------------------------------------------------------------------
def build_pt3() -> bytes:
    # 1. Build all data sections first so we know their sizes for the header.
    patterns_data = [
        make_pattern_a_sparse(),     # 0: A minor, sparse intro
        make_pattern_a_full(),       # 1: A minor + arp harmony
        make_pattern_d_sparse(),     # 2: D minor, sparse
        make_pattern_d_climax(),     # 3: D minor + arp, climax
        make_pattern_a_high(),       # 4: A minor up an octave, building tension
        make_pattern_final_climax(), # 5: D minor at peak, final climax
    ]
    sample_data = build_sample_default()
    ornaments = [
        build_ornament_empty(),       # 0: no arpeggio
        build_ornament_minor_arp(),   # 1: minor triad fake-chord
    ]

    # 2. Position list: full Mountain King build → climax → loop.
    position_list = bytes([
        0 * 3,   # A sparse (intro)
        1 * 3,   # A full
        2 * 3,   # D sparse
        3 * 3,   # D climax
        4 * 3,   # A high
        5 * 3,   # D final climax
        0xFF,
    ])

    # 3. Layout:
    #    [Header 0xC9 B] [Position list] [Pattern Pointer Table] [Patterns A/B/C bodies] [Samples] [Ornaments]
    header_size = 0xC9
    name = b'MOUNTAIN KING (GRIEG, v1)       '[:32]
    author = b'SAGA DARK / GRIEG (PD)          '[:32]

    pos_list_offset = header_size
    pos_list_end = pos_list_offset + len(position_list)

    # Pattern pointer table: 6 bytes per pattern (A,B,C × 2-byte LE addr).
    pat_ptr_table_offset = pos_list_end
    pat_ptr_table_size = 6 * len(patterns_data)
    pat_bodies_offset = pat_ptr_table_offset + pat_ptr_table_size

    # Lay out pattern A/B/C bodies for each pattern.
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

    # Sample pointer table — 32 entries, only #1 used.
    sample_addr = cursor
    cursor += len(sample_data)

    # Ornament pointer table — 16 entries, each ornament laid out sequentially.
    ornament_addrs = []
    for orn in ornaments:
        ornament_addrs.append(cursor)
        cursor += len(orn)

    # 4. Build header.
    h = bytearray(header_size)
    h[0x00:0x0D] = b'ProTracker 3.'
    h[0x0D] = ord('5')               # version
    h[0x0E:0x1E] = b' compilation of '
    h[0x1E:0x3E] = name.ljust(32)
    h[0x3E:0x42] = b' by '
    h[0x42:0x62] = author.ljust(32)
    h[0x62] = 0x20                   # trailing space
    h[0x63] = 1                      # frequency table 1 (ST)
    h[0x64] = 4                      # speed (frames per row) — 4 ≈ 88 BPM moderato
    h[0x65] = len(patterns_data) + 1 # number of patterns + 1
    h[0x66] = 0                      # loop pointer = start
    h[0x67:0x69] = pat_ptr_table_offset.to_bytes(2, 'little')
    # Sample pointers (32 × 2 bytes). All zero except index 1.
    for i in range(32):
        addr = sample_addr if i == 1 else 0
        h[0x69 + i * 2: 0x6B + i * 2] = addr.to_bytes(2, 'little')
    # Ornament pointers (16 × 2 bytes).
    for i in range(16):
        addr = ornament_addrs[i] if i < len(ornament_addrs) else 0
        h[0xA9 + i * 2: 0xAB + i * 2] = addr.to_bytes(2, 'little')

    # 5. Build pattern pointer table.
    ppt = bytearray()
    for (a_addr, b_addr, c_addr) in pat_addrs:
        ppt += a_addr.to_bytes(2, 'little')
        ppt += b_addr.to_bytes(2, 'little')
        ppt += c_addr.to_bytes(2, 'little')

    # 6. Concatenate.
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
