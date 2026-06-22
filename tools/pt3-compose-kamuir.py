#!/usr/bin/env python3
"""Compose KAMUIR'S FORTRESS — the in-game theme for Level 5 of the ZX
Spectrum +2 128K platformer remake (saga-dark).  PT3 module for the AY-3-8910.

ORIGINAL COMPOSITION — no transcription, no copyrighted source material.
The Phrygian mode has been used since antiquity; it is not copyrightable.

Setting: a volcanic/demonic fortress, fire and stone, the lair of Kamuir —
the tall warrior with a flame headdress who stole the Book.  The music must
feel heavier and darker than Phase 1 (heroic, A minor) and Phase 2 (martial,
Holst-style): this is the final dungeon.

E PHRYGIAN: E  F  G  A  B  C  D
  - b2 = F natural in an E context → immediate sense of dread.
  - Tritone B↔F (the medieval "diabolus in musica") drives ominous tension.
  - Diminished chord on B (B D F) maximises harmonic dread on every cadence.
  - Andalusian descent G→F→E (the Phrygian cadence) is the core motif.

Arrangement — E Phrygian, 3 channels, speed 6 (~125 BPM), 64 rows/pattern:
  Ch A (lead):  angular Phrygian melody.  Sharp attack, NO vibrato — aggressive,
                cutting, not the singing heroic-theme quality.
  Ch B (arp):   ominous chord pad.  Follin per-frame shimmer but with ORN_DIM
                (0 3 6) on B chords = B D F (tritone + minor third = maximum dread).
  Ch C (bass+drums): taiko + snare pulse; Phrygian bass roots.

Form (9 patterns, loop position 1 — intro plays once):
  0 INTRO   Em F  Em  B   bass+arp establish; lead silent → pickup E-5 last beat
  1 A1      Em F   G  F   main Phrygian threat statement  (LOOP TARGET)
  2 A2      Em F  Am  B   develops Am colour and tritone B
  3 B1      Am Em  F  B   harmonic darkening
  4 B2      Dm B  Em  B   closing tension, tritone held
  5 C1      Em F  Am  B   DEVELOPMENT: ascending/descending Phrygian scale runs
  6 C2      Em F  Am  B   CLIMAX: high range, full volume, then land
  7 D1      Em F  Em  B   ominous SLOW section — half and whole notes
  8 D2      Am F  Em  B   Phrygian cadence return → loop to A1

Samples/ornaments share the same byte-packing logic as heroic-theme.py and
barbarian.py; the header+body assembly is identical.
"""

from __future__ import annotations
from pathlib import Path

OUT_PATH = Path(__file__).resolve().parent.parent / \
    "remakes/_in_progress/128k-plus2-platformer-v2/src/music/kamuir.pt3"

# ── Note encoding ─────────────────────────────────────────────────────────────
NOTE_NAMES = ['C-', 'C#', 'D-', 'D#', 'E-', 'F-', 'F#', 'G-', 'G#', 'A-', 'A#', 'B-']
NOTE_TO_BYTE: dict[str, int] = {}
for _oct in range(1, 9):
    for _i, _nm in enumerate(NOTE_NAMES):
        NOTE_TO_BYTE[f"{_nm}{_oct}"] = 0x50 + (_oct - 1) * 12 + _i
BYTE_TO_NOTE = {v: k for k, v in NOTE_TO_BYTE.items()}

REST = '---'
OFF  = 'OFF'
ROWS_PER_PATTERN = 64
BAR  = 16   # rows per 4/4 bar (sixteenth grid, 4 rows per beat)


def transpose(note: str, semis: int) -> str:
    return BYTE_TO_NOTE[NOTE_TO_BYTE[note] + semis]


# ── Channel packer (identical to heroic-theme.py / barbarian.py) ──────────────
def encode_channel(rows: list, default_sample: int = 1,
                   default_volume: int = 15, ornament: int = 0) -> bytes:
    out = bytearray()
    cur_sample   = default_sample
    cur_volume   = default_volume
    cur_ornament = ornament
    cur_skip     = 0
    first_note_emitted     = False
    initial_volume_emitted = False

    i = 0
    while i < len(rows) and rows[i] == REST:
        i += 1

    while i < len(rows):
        row  = rows[i]
        note = row
        opts: dict = {}
        if isinstance(row, tuple):
            note, opts = row[0], (row[1] if len(row) > 1 else {})

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
    """Expand [(note, dur_rows), ...] into a flat row list."""
    out: list = []
    for note, dur in events:
        out.append(note)
        out.extend([REST] * (dur - 1))
    assert len(out) == total, \
        f"line is {len(out)} rows, expected {total}: {events}"
    return out


# ── Samples ────────────────────────────────────────────────────────────────────
def _sample_raw(ticks: list, loop: int | None = None) -> bytes:
    n    = len(ticks)
    loop = n - 1 if loop is None else loop
    out  = bytearray([loop, n - 1])
    for t in ticks:
        if isinstance(t, tuple):
            b1  = t[0]
            b0  = t[1] if len(t) > 1 else 0
            off = t[2] if len(t) > 2 else 0
        else:
            b1, b0, off = t, 0, 0
        out.append(b0 & 0xFF)
        out.append(b1 & 0xFF)
        out.extend((off & 0xFFFF).to_bytes(2, 'little'))
    return bytes(out)


def build_sample_lead() -> bytes:
    """Sharp, aggressive lead — bright attack, quick settle, NO vibrato.
    The Kamuir theme is angular and threatening; we want a cutting tone that
    speaks hard and holds steady without the warm singing quality of the
    heroic theme's vibrato."""
    ticks = [0x80 | a for a in
             (15, 15, 14, 13, 13, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12)]
    return _sample_raw(ticks, loop=12)


def build_sample_arp() -> bytes:
    """Ominous pad — moderate, long steady sustain so the chord shimmers
    under the lead without competing with it."""
    ticks = [0x80 | a for a in
             (11, 11, 10, 10,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9)]
    return _sample_raw(ticks, loop=12)


def build_sample_kick() -> bytes:
    """Tuned kick — noise+tone percussive attack then pitched sustain."""
    ticks = [0x00 | 0xF, 0x00 | 0xE,
             0x80 | 0xD, 0x80 | 0xC, 0x80 | 0xB,
             0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA,
             0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA,
             0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA]
    return _sample_raw(ticks, loop=5)


def build_sample_snare() -> bytes:
    """Pure-noise backbeat snare — fast decay to silence."""
    ticks = [0x10 | 0xF, 0x10 | 0xC, 0x10 | 0x8, 0x10 | 0x5,
             0x10 | 0x2, 0x10 | 0x0, 0x10 | 0x0, 0x10 | 0x0]
    return _sample_raw(ticks, loop=7)


def build_sample_taiko() -> bytes:
    """Deep taiko boom — high-byte noise period (slow, low-frequency rumble)
    with tone for the bass pitch; rings down to a quiet sustain.  Identical
    technique to heroic-theme.py so the drum feel matches Phase 1 / Phase 2
    while the melodic material tells them apart."""
    boom = [(0x00 | 0xF, 22), (0x00 | 0xE, 25), (0x00 | 0xD, 22)]
    body = [0x80 | a for a in (0xD, 0xB, 0x9, 0x8, 0x7, 0x6, 0x5, 0x5)]
    return _sample_raw(boom + body, loop=10)


# ── Ornaments ──────────────────────────────────────────────────────────────────
def build_ornament_empty() -> bytes:
    return bytes([0x00, 0x00, 0x00])


def build_ornament_minor() -> bytes:
    """Per-frame minor-triad arpeggio: root, +3, +7 cycling."""
    return bytes([0x00, 0x02, 0, 3, 7])


def build_ornament_major() -> bytes:
    """Per-frame major-triad arpeggio: root, +4, +7 cycling."""
    return bytes([0x00, 0x02, 0, 4, 7])


def build_ornament_dim() -> bytes:
    """Per-frame DIMINISHED arpeggio: root, +3, +6 cycling.
    On B: cycles B D F — minor third + tritone = the 'diabolus in musica'.
    Used on every B chord to maximise harmonic dread."""
    return bytes([0x00, 0x02, 0, 3, 6])


# ── Sample / ornament indices ──────────────────────────────────────────────────
S_LEAD, S_ARP, S_KICK, S_SNARE, S_TAIKO = 1, 2, 3, 4, 5
ORN_EMPTY, ORN_MIN, ORN_MAJ, ORN_DIM    = 0, 1, 2, 3

V_LEAD = 14
V_ARP  = 12
V_BASS = 15
SNARE_NOTE = 'A-2'   # pitch is irrelevant for noise-only snare


# ── Arp channel builder ────────────────────────────────────────────────────────
_ORN_MAP = {'m': ORN_MIN, 'M': ORN_MAJ, 'dim': ORN_DIM}


def arp_channel(chords: list, vol: int = V_ARP) -> bytes:
    """chords = [(root, 'm'|'M'|'dim'), ...], one entry per bar (16 rows).
    The root is held for one row; the per-frame ornament gives the Follin
    shimmer for the remaining 15 rows of silence."""
    rows: list = []
    for root, qual in chords:
        rows.append((root, {'ornament': _ORN_MAP[qual]}))
        rows += [REST] * (BAR - 1)
    assert len(rows) == ROWS_PER_PATTERN
    return encode_channel(rows, S_ARP, vol, ornament=ORN_EMPTY)


# ── Bass + drums builder ───────────────────────────────────────────────────────
def build_bass(roots: list, style: str = 'q',
               fill: str | None = None) -> list:
    """One root per bar.
    'q'  = quarter groove: taiko beats 1&3, snare beats 2&4.
    'e'  = driving eighths: taiko on 1, lighter kicks on 2/3/4.
    'h'  = half-time: taiko beat 1 only (for the slow ominous D1 section).
    fill='roll' adds a four-hit taiko roll on the last beat of the last bar."""
    rows: list = []
    for root in roots:
        fifth = transpose(root, 7)
        bar   = [REST] * BAR
        if style == 'e':
            bar[0]  = (root,       {'sample': S_TAIKO})
            bar[4]  = (fifth,      {'sample': S_KICK})
            bar[8]  = (root,       {'sample': S_KICK})
            bar[12] = (fifth,      {'sample': S_KICK})
        elif style == 'h':
            bar[0]  = (root,       {'sample': S_TAIKO})   # one deep boom per bar
        else:                                              # 'q'
            bar[0]  = (root,       {'sample': S_TAIKO})
            bar[4]  = (SNARE_NOTE, {'sample': S_SNARE})
            bar[8]  = (root,       {'sample': S_TAIKO})
            bar[12] = (SNARE_NOTE, {'sample': S_SNARE})
        rows += bar
    if fill == 'roll':
        root = roots[-1]
        for r in (60, 61, 62, 63):
            rows[r] = (root, {'sample': S_TAIKO})
    return rows


def make_pattern(chords, bass_roots, lead_events,
                 bass_style='q', lead_vol=V_LEAD, arp_vol=V_ARP,
                 bass_fill=None) -> tuple:
    lead = encode_channel(line(lead_events), S_LEAD, lead_vol)
    arp  = arp_channel(chords, arp_vol)
    bass = encode_channel(build_bass(bass_roots, bass_style, fill=bass_fill),
                          S_TAIKO, V_BASS)
    return (lead, arp, bass)


# ── Pattern builders ───────────────────────────────────────────────────────────
def p_intro() -> tuple:
    """Bass + arp establish ominously; lead silent for 15 bars then a single
    pickup E-5 (4 rows = 1 beat) that drives into A1's downbeat."""
    return make_pattern(
        [('E-3', 'm'), ('F-3', 'M'), ('E-3', 'm'), ('B-3', 'dim')],
        ['E-2',        'F-2',        'E-2',        'B-2'],
        [(REST, 60), ('E-5', 4)],
        lead_vol=11, arp_vol=10)


def p_a1() -> tuple:
    """Em F G F — main Phrygian threat statement (LOOP TARGET)."""
    return make_pattern(
        [('E-3', 'm'), ('F-3', 'M'), ('G-3', 'M'), ('F-3', 'M')],
        ['E-2',        'F-2',        'G-2',        'F-2'],
        # Bar 1 Em:  bold entry on E5, step up to G-A
        [('E-5', 8), ('G-5', 4), ('A-5', 4),
         # Bar 2 F:  Phrygian b2 — descent F5→B4
         ('F-5', 4), ('E-5', 2), ('D-5', 2), ('C-5', 4), ('B-4', 4),
         # Bar 3 G:  relative-major moment, drop to B4
         ('G-5', 8), ('B-4', 4), ('C-5', 4),
         # Bar 4 F→E: cadential return to E
         ('F-5', 4), ('D-5', 4), ('B-4', 4), ('E-5', 4)],
        lead_vol=13, arp_vol=12)


def p_a2() -> tuple:
    """Em F Am B — develops Am colour and the tritone B→F sting."""
    return make_pattern(
        [('E-3', 'm'), ('F-3', 'M'), ('A-3', 'm'), ('B-3', 'dim')],
        ['E-2',        'F-2',        'A-2',        'B-2'],
        # Bar 1 Em:  arpeggio feel
        [('E-5', 4), ('B-4', 4), ('E-5', 4), ('G-5', 4),
         # Bar 2 F:  fall to held E
         ('A-5', 4), ('F-5', 4), ('E-5', 8),
         # Bar 3 Am: C5 held, fall
         ('C-5', 8), ('A-4', 4), ('E-5', 4),
         # Bar 4 B:  tritone B-F sting, resolve to E
         ('B-4', 4), ('F-5', 4), ('E-5', 8)],
        lead_vol=13, arp_vol=12)


def p_b1() -> tuple:
    """Am Em F B — harmonic darkening."""
    return make_pattern(
        [('A-3', 'm'), ('E-3', 'm'), ('F-3', 'M'), ('B-3', 'dim')],
        ['A-2',        'E-2',        'F-2',        'B-2'],
        # Bar 1 Am:  rising arpegg
        [('A-4', 4), ('C-5', 4), ('E-5', 4), ('A-5', 4),
         # Bar 2 Em: descending
         ('G-5', 4), ('E-5', 4), ('B-4', 4), ('G-4', 4),
         # Bar 3 F:  sustained fall
         ('F-5', 8), ('C-5', 4), ('A-4', 4),
         # Bar 4 B:  B-F-D — full diminished chord in the melody
         ('B-4', 4), ('F-5', 4), ('D-5', 4), ('B-4', 4)],
        lead_vol=13, arp_vol=11)


def p_b2() -> tuple:
    """Dm B Em B — closing tension, tritone held."""
    return make_pattern(
        [('D-3', 'm'), ('B-3', 'dim'), ('E-3', 'm'), ('B-3', 'dim')],
        ['D-3',        'B-2',          'E-2',        'B-2'],
        # Bar 1 Dm:  ascending D-F-A
        [('D-5', 4), ('F-5', 4), ('A-5', 4), ('D-5', 4),
         # Bar 2 B:  tritone flash then fall
         ('B-4', 4), ('F-5', 4), ('D-5', 8),
         # Bar 3 Em:
         ('E-5', 4), ('G-5', 4), ('E-5', 8),
         # Bar 4 B:  low drop — E4 pulls gravity downward
         ('B-4', 8), ('E-4', 8)],
        lead_vol=12, arp_vol=11)


def p_c1() -> tuple:
    """DEVELOPMENT — ascending then descending full Phrygian scale runs;
    eighth-note grid (2 rows each) over a driving bass."""
    return make_pattern(
        [('E-3', 'm'), ('F-3', 'M'), ('A-3', 'm'), ('B-3', 'dim')],
        ['E-2',        'F-2',        'A-2',        'B-2'],
        # Bar 1 Em:  E→E ascending (full Phrygian octave)
        [('E-4', 2), ('F-4', 2), ('G-4', 2), ('A-4', 2),
         ('B-4', 2), ('C-5', 2), ('D-5', 2), ('E-5', 2),
         # Bar 2 F:  descending F5→F4
         ('F-5', 2), ('E-5', 2), ('D-5', 2), ('C-5', 2),
         ('B-4', 2), ('A-4', 2), ('G-4', 2), ('F-4', 2),
         # Bar 3 Am: ascending from A
         ('A-4', 2), ('B-4', 2), ('C-5', 2), ('D-5', 2),
         ('E-5', 2), ('F-5', 2), ('G-5', 2), ('A-5', 2),
         # Bar 4 B:  descending G5→G4 (+ taiko roll built in via bass_fill)
         ('G-5', 2), ('F-5', 2), ('E-5', 2), ('D-5', 2),
         ('C-5', 2), ('B-4', 2), ('A-4', 2), ('G-4', 2)],
        bass_style='e', lead_vol=14, arp_vol=13,
        bass_fill='roll')


def p_c2() -> tuple:
    """CLIMAX — high range, full volume, then land."""
    return make_pattern(
        [('E-3', 'm'), ('F-3', 'M'), ('A-3', 'm'), ('B-3', 'dim')],
        ['E-2',        'F-2',        'A-2',        'B-2'],
        # Bar 1 Em:  Em arpeggio from high B5, sweeping down
        [('E-5', 2), ('G-5', 2), ('B-5', 2), ('G-5', 2),
         ('E-5', 2), ('D-5', 2), ('C-5', 2), ('B-4', 2),
         # Bar 2 F:  F major high, quarter pulse
         ('F-5', 4), ('A-5', 4), ('F-5', 4), ('C-5', 4),
         # Bar 3 Am: landing arc
         ('A-5', 4), ('E-5', 4), ('C-5', 4), ('A-4', 4),
         # Bar 4 B:  dramatic B-E pulse into loop
         ('B-4', 4), ('E-5', 4), ('B-4', 4), ('E-5', 4)],
        bass_style='e', lead_vol=15, arp_vol=15)


def p_d1() -> tuple:
    """Ominous SLOW section — half and whole notes.  One deep taiko boom per
    bar (half-time bass), very sparse, letting the long notes breathe."""
    return make_pattern(
        [('E-3', 'm'), ('F-3', 'M'), ('E-3', 'm'), ('B-3', 'dim')],
        ['E-2',        'F-2',        'E-2',        'B-2'],
        # Whole note E5 / half-note F5-E5 / whole G5 / half B4-E5
        [('E-5', 16),
         ('F-5', 8), ('E-5', 8),
         ('G-5', 16),
         ('B-4', 8), ('E-5', 8)],
        bass_style='h', lead_vol=11, arp_vol=9)


def p_d2() -> tuple:
    """Am F Em B — Phrygian cadence return; last bar drives back into A1."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('E-3', 'm'), ('B-3', 'dim')],
        ['A-2',        'F-2',        'E-2',        'B-2'],
        # Bar 1 Am
        [('A-4', 4), ('E-5', 4), ('C-5', 4), ('A-4', 4),
         # Bar 2 F:  Phrygian descent
         ('F-5', 4), ('E-5', 4), ('D-5', 4), ('C-5', 4),
         # Bar 3 Em
         ('E-5', 4), ('D-5', 4), ('B-4', 4), ('G-4', 4),
         # Bar 4 B→E: tritone approach, ends on E pickup into A1
         ('B-4', 4), ('F-5', 4), ('B-4', 4), ('E-5', 4)],
        lead_vol=13, arp_vol=12)


PATTERN_BUILDERS = [p_intro, p_a1, p_a2, p_b1, p_b2, p_c1, p_c2, p_d1, p_d2]
LOOP_POSITION    = 1   # intro plays once, then loops from A1


# ── Header + file assembly ─────────────────────────────────────────────────────
def build_pt3() -> bytes:
    patterns_data = [b() for b in PATTERN_BUILDERS]

    samples = {
        1: build_sample_lead(),
        2: build_sample_arp(),
        3: build_sample_kick(),
        4: build_sample_snare(),
        5: build_sample_taiko(),
    }
    ornaments = [
        build_ornament_empty(),
        build_ornament_minor(),
        build_ornament_major(),
        build_ornament_dim(),
    ]

    position_list = bytes([i * 3 for i in range(len(patterns_data))] + [0xFF])

    header_size          = 0xC9
    pos_list_offset      = header_size
    pos_list_end         = pos_list_offset + len(position_list)
    pat_ptr_table_offset = pos_list_end
    pat_ptr_table_size   = 6 * len(patterns_data)
    pat_bodies_offset    = pat_ptr_table_offset + pat_ptr_table_size

    pat_addrs  = []
    cursor     = pat_bodies_offset
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
    orn_blob       = bytearray()
    for orn in ornaments:
        ornament_addrs.append(cursor)
        orn_blob.extend(orn); cursor += len(orn)

    name   = b"KAMUIR'S FORTRESS".ljust(32)[:32]
    author = b'SAGA DARK (ORIGINAL)'.ljust(32)[:32]

    h = bytearray(header_size)
    h[0x00:0x0D] = b'ProTracker 3.'
    h[0x0D]      = ord('5')
    h[0x0E:0x1E] = b' compilation of '
    h[0x1E:0x3E] = name
    h[0x3E:0x42] = b' by '
    h[0x42:0x62] = author
    h[0x62]      = 0x20
    h[0x63]      = 1          # frequency table 1 (ST)
    h[0x64]      = 6          # speed — 6 frames/row ≈ 125 BPM
    h[0x65]      = len(patterns_data) + 1
    h[0x66]      = LOOP_POSITION
    h[0x67:0x69] = pat_ptr_table_offset.to_bytes(2, 'little')
    for i in range(32):
        addr = sample_addr.get(i, 0)
        h[0x69 + i * 2 : 0x6B + i * 2] = addr.to_bytes(2, 'little')
    for i in range(16):
        addr = ornament_addrs[i] if i < len(ornament_addrs) else 0
        h[0xA9 + i * 2 : 0xAB + i * 2] = addr.to_bytes(2, 'little')

    ppt = bytearray()
    for (a_addr, b_addr, c_addr) in pat_addrs:
        ppt += a_addr.to_bytes(2, 'little')
        ppt += b_addr.to_bytes(2, 'little')
        ppt += c_addr.to_bytes(2, 'little')

    return (bytes(h) + position_list + bytes(ppt) +
            bytes(pat_bodies) + bytes(sample_blob) + bytes(orn_blob))


def main() -> None:
    pt3 = build_pt3()
    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUT_PATH.write_bytes(pt3)
    print(f"Wrote {OUT_PATH}  ({len(pt3)} bytes)")


if __name__ == '__main__':
    main()
