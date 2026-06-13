#!/usr/bin/env python3
"""Compose an ORIGINAL heroic theme in Tim Follin's STYLE as a PT3 module for
the AY-3-8910 on the ZX Spectrum +2 128K — the platformer's Phase 1 in-game
track.

HONESTY NOTE: this is NOT "Black Lamp" (or any other Follin tune). It is an
original composition written from scratch that merely BORROWS Follin's
techniques and aesthetic — there is no note-for-note Follin melody here. (The
real Black Lamp tune exists only as a `.ay` capture, not a PT3 we could drop in.)

LICENCE / SCOPE: the COMPOSITION is original (ours). The STYLE is a homage and
is not itself copyrightable, so this track has no third-party permission problem
the way a transcription would. It still ships as Phase 1's track; Phase 2 uses
the public-domain Holst "Mars" arrangement. See [[project_pt3_license]].

It captures Follin's signature SOUND — a lyrical heroic lead in A minor over a
shimmering arpeggiated chord with the raised-7th dominant (E major) for drama.

The Follin "arpeggio chord" trick is done with the PT3 ORNAMENT system: channel
B holds the chord ROOT while an ornament cycles the triad offsets [0,3,7] (minor)
or [0,4,7] (major) EVERY FRAME (50 Hz) — independent of the row speed — so the
chord shimmers as a fast arpeggio. That is exactly Follin's technique.

Format machinery (note encoding, channel packer, sample builders, PT3 header
assembly) is identical to tools/pt3-compose-barbarian.py / mars.py so the output
loads in Sergey Bulba's PT3 player bundled in bank 7.

Arrangement — A minor, 3 channels, 4/4, speed 5 (quarter ~= 150 BPM):
  - Channel A (lead):  lyrical heroic melody (octaves 4-5); fast eighth-note
                       runs in the development section (the Follin run).
  - Channel B (arp):   chord root held per bar + minor/major triad ornament ->
                       the per-frame Follin shimmer (octaves 3-4).
  - Channel C (bass):  root-fifth walk; quarter pulse in the lyrical sections,
                       eighth pulse in the driving development (octaves 2-3).

Grid: 1 row = 1 sixteenth; 4 rows = 1 quarter; 16 rows = 1 bar; 64 rows =
4 bars per pattern.

Form (9 patterns, ~36 bars then a 32-bar loop that SKIPS the intro):
  0 INTRO   Am  Am  F   E    arp+bass establish, lead silent + pickup
  1 A1      Am  F   C   G    heroic statement      <- loop target
  2 A2      Am  F   C   E    answer, to dominant
  3 B1      C   G   Am  F    relative-major lift
  4 B2      Dm  E   Am  E    cadence
  5 C1      Am  G   F   E    DEVELOPMENT: fast eighth-note runs, Andalusian
  6 C2      Dm  E   Am  Am   runs climb to the high peak, then land
  7 D1      C   Em  F   G    lyrical contrast: sustained singing lead
  8 D2      Am  F   Dm  E    turn back to the dominant -> loop to A1

Iteration log:
  v1 (2026-06-04) — initial original Follin-style heroic arrangement (4 patterns).
  v2 (2026-06-04) — user liked it; "work it more / make it longer": added INTRO,
                     development section with fast Follin runs (C1/C2), lyrical
                     bridge (D1/D2), eighth-note driving bass, and a loop point
                     that plays the intro once then loops the 32-bar body.
  v3 (2026-06-04) — user: "a bit slower + try percussion". speed 5->6 (~125 BPM);
                     the bass channel is now BASS+DRUMS (kick on beats 1&3 keeps
                     the pitched root, noise snare on 2&4 backbeat; four-on-the-
                     floor kick in the C1/C2 development) — the arp shimmer (ch B)
                     and lead (ch A) are untouched.
"""

from __future__ import annotations
from pathlib import Path

OUT_PATH = Path(__file__).resolve().parent.parent / \
    "remakes/128k-plus2-platformer/src/music/heroic-theme.pt3"

# -----------------------------------------------------------------------------
# Note encoding: PT3 maps semitones to bytes 0x50 (C-1) .. 0xAF (B-8).
# -----------------------------------------------------------------------------
NOTE_NAMES = ['C-', 'C#', 'D-', 'D#', 'E-', 'F-', 'F#', 'G-', 'G#', 'A-', 'A#', 'B-']
NOTE_TO_BYTE: dict[str, int] = {}
for octave in range(1, 9):
    for i, name in enumerate(NOTE_NAMES):
        NOTE_TO_BYTE[f"{name}{octave}"] = 0x50 + (octave - 1) * 12 + i
BYTE_TO_NOTE = {v: k for k, v in NOTE_TO_BYTE.items()}

REST = '---'
OFF = 'OFF'

ROWS_PER_PATTERN = 64
BAR = 16                       # rows per 4/4 bar (sixteenth grid, 4 rows/beat)


def transpose(note: str, semis: int) -> str:
    """Transpose a note name by `semis` semitones (used for bass fifths)."""
    return BYTE_TO_NOTE[NOTE_TO_BYTE[note] + semis]


# -----------------------------------------------------------------------------
# Channel packer — same semantics as the barbarian / mars tools.
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
    """Expand [(note, dur_rows), ...] into a row list (note may be REST),
    asserting durations sum to `total`."""
    out: list = []
    for note, dur in events:
        out.append(note)
        out.extend([REST] * (dur - 1))
    assert len(out) == total, f"line is {len(out)} rows, expected {total}: {events}"
    return out


# -----------------------------------------------------------------------------
# Samples (all pure tone). byte1 mix bits: bit7=1 noise OFF. 0x80|amp = tone.
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


def build_sample_lead() -> bytes:
    """Singing lead: bright attack, sustains high so the melody carries."""
    amps = [15, 15, 15, 14, 14, 14, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13]
    return _sample_raw([0x80 | a for a in amps])


def build_sample_arp() -> bytes:
    """Arpeggio chord: lower steady sustain so the per-frame triad shimmer sits
    UNDER the lead, ringing for the whole held bar."""
    amps = [13, 13, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11]
    return _sample_raw([0x80 | a for a in amps])


def build_sample_kick() -> bytes:
    """Bass+kick: a NOISE+tone percussive attack (2 ticks) then a pitched tone
    that sustains -> a tuned kick that still carries the bass note. Mix bits:
    0x00|amp = noise+tone, 0x80|amp = tone only."""
    ticks = [0x00 | 0xF, 0x00 | 0xE,                       # noise+tone thump
             0x80 | 0xD, 0x80 | 0xC, 0x80 | 0xB,            # tone decay
             0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA,
             0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA,
             0x80 | 0xA, 0x80 | 0xA, 0x80 | 0xA]            # sustain (loop)
    return _sample_raw(ticks, loop=5)


def build_sample_snare() -> bytes:
    """Backbeat snare: pure-NOISE burst, fast decay to silence (loops silent).
    Mix bit 0x10|amp = noise only (tone off)."""
    ticks = [0x10 | 0xF, 0x10 | 0xC, 0x10 | 0x8, 0x10 | 0x5,
             0x10 | 0x2, 0x10 | 0x0, 0x10 | 0x0, 0x10 | 0x0]
    return _sample_raw(ticks, loop=7)


def build_ornament_empty() -> bytes:
    return bytes([0x00, 0x00, 0x00])


def build_ornament_minor() -> bytes:
    """Per-frame minor-triad arpeggio: root, +3, +7 (semitones) cycling."""
    return bytes([0x00, 0x02, 0, 3, 7])


def build_ornament_major() -> bytes:
    """Per-frame major-triad arpeggio: root, +4, +7 cycling."""
    return bytes([0x00, 0x02, 0, 4, 7])


# -----------------------------------------------------------------------------
# Sample / ornament / volume assignments.
# -----------------------------------------------------------------------------
S_LEAD, S_ARP, S_KICK, S_SNARE = 1, 2, 3, 4
ORN_EMPTY, ORN_MIN, ORN_MAJ = 0, 1, 2
V_LEAD, V_ARP, V_BASS = 15, 14, 15
SNARE_NOTE = 'A-2'             # dummy pitch for the snare (noise only; tone off)


def arp_channel(chords: list) -> bytes:
    """chords = [(root, 'm'|'M'), ...] one per bar. Hold the root for the whole
    bar with the matching triad ornament -> the Follin per-frame shimmer."""
    rows: list = []
    for root, qual in chords:
        orn = ORN_MIN if qual == 'm' else ORN_MAJ
        rows.append((root, {'ornament': orn}))
        rows += [REST] * (BAR - 1)
    assert len(rows) == ROWS_PER_PATTERN
    return encode_channel(rows, S_ARP, V_ARP, ornament=ORN_EMPTY)


def build_bass(roots: list, style: str = 'q') -> list:
    """Bass+drums on one channel (preserves the arp shimmer). One root per bar.
    style 'q' = backbeat: pitched kick on beats 1 & 3, noise snare on 2 & 4.
    style 'e' = driving four-on-the-floor: pitched kick on every beat
    (root/fifth alternation), no snare — for the fast development sections."""
    rows: list = []
    for root in roots:
        fifth = transpose(root, 7)
        bar = [REST] * BAR
        if style == 'e':
            bar[0] = (root, {'sample': S_KICK})
            bar[4] = (fifth, {'sample': S_KICK})
            bar[8] = (root, {'sample': S_KICK})
            bar[12] = (fifth, {'sample': S_KICK})
        else:
            bar[0] = (root, {'sample': S_KICK})
            bar[4] = (SNARE_NOTE, {'sample': S_SNARE})
            bar[8] = (root, {'sample': S_KICK})
            bar[12] = (SNARE_NOTE, {'sample': S_SNARE})
        rows += bar
    return rows


def make_pattern(chords: list, bass_roots: list, lead_events: list,
                 bass_style: str = 'q') -> tuple:
    lead = encode_channel(line(lead_events, ROWS_PER_PATTERN), S_LEAD, V_LEAD)
    arp = arp_channel(chords)
    bass = encode_channel(build_bass(bass_roots, bass_style), S_KICK, V_BASS)
    return (lead, arp, bass)


# -----------------------------------------------------------------------------
# Patterns. Lead octaves 4-5, arp roots 3-4, bass roots 2-3.
# -----------------------------------------------------------------------------
def p_intro() -> tuple:
    """Arp shimmer + bass establish the groove; lead silent until a pickup that
    leads into A1's opening E-4."""
    return make_pattern(
        [('A-3', 'm'), ('A-3', 'm'), ('F-3', 'M'), ('E-3', 'M')],
        ['A-2', 'A-2', 'F-2', 'E-2'],
        [('---', 60), ('E-4', 4)])


def p_a1() -> tuple:
    """Am F C G — heroic statement (loop target)."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('C-4', 'M'), ('G-3', 'M')],
        ['A-2', 'F-2', 'C-3', 'G-2'],
        [('E-4', 4), ('A-4', 4), ('C-5', 4), ('B-4', 4),
         ('A-4', 2), ('B-4', 2), ('C-5', 4), ('A-4', 8),
         ('G-4', 4), ('E-4', 4), ('G-4', 4), ('C-5', 4),
         ('B-4', 4), ('D-5', 4), ('B-4', 8)])


def p_a2() -> tuple:
    """Am F C E — climb higher, end on the dominant."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('C-4', 'M'), ('E-3', 'M')],
        ['A-2', 'F-2', 'C-3', 'E-2'],
        [('C-5', 4), ('E-5', 4), ('D-5', 4), ('C-5', 4),
         ('A-4', 4), ('C-5', 4), ('A-4', 8),
         ('G-4', 4), ('C-5', 4), ('E-5', 4), ('D-5', 4),
         ('C-5', 4), ('B-4', 4), ('G#4', 8)])


def p_b1() -> tuple:
    """C G Am F — relative-major lift."""
    return make_pattern(
        [('C-4', 'M'), ('G-3', 'M'), ('A-3', 'm'), ('F-3', 'M')],
        ['C-3', 'G-2', 'A-2', 'F-2'],
        [('E-5', 4), ('G-5', 4), ('E-5', 4), ('C-5', 4),
         ('D-5', 4), ('B-4', 4), ('G-4', 8),
         ('A-4', 4), ('C-5', 4), ('E-5', 4), ('C-5', 4),
         ('A-4', 4), ('F-4', 4), ('A-4', 8)])


def p_b2() -> tuple:
    """Dm E Am E — cadential close."""
    return make_pattern(
        [('D-3', 'm'), ('E-3', 'M'), ('A-3', 'm'), ('E-3', 'M')],
        ['D-3', 'E-2', 'A-2', 'E-2'],
        [('D-5', 4), ('F-5', 4), ('E-5', 4), ('D-5', 4),
         ('C-5', 4), ('B-4', 4), ('G#4', 4), ('B-4', 4),
         ('A-4', 8), ('E-4', 4), ('A-4', 4),
         ('B-4', 4), ('G#4', 4), ('E-4', 8)])


def p_c1() -> tuple:
    """Development: Am G F E (Andalusian descent), fast eighth-note Follin runs
    over a driving eighth bass."""
    return make_pattern(
        [('A-3', 'm'), ('G-3', 'M'), ('F-3', 'M'), ('E-3', 'M')],
        ['A-2', 'G-2', 'F-2', 'E-2'],
        [('A-4', 2), ('C-5', 2), ('E-5', 2), ('A-5', 2), ('E-5', 2), ('C-5', 2), ('A-4', 2), ('B-4', 2),  # Am
         ('B-4', 2), ('D-5', 2), ('G-5', 2), ('D-5', 2), ('B-4', 2), ('G-4', 2), ('A-4', 2), ('B-4', 2),  # G
         ('C-5', 2), ('A-4', 2), ('F-4', 2), ('A-4', 2), ('C-5', 2), ('F-5', 2), ('C-5', 2), ('A-4', 2),  # F
         ('G#4', 2), ('B-4', 2), ('E-5', 2), ('B-4', 2), ('G#4', 2), ('E-4', 2), ('B-4', 2), ('E-5', 2)],  # E
        bass_style='e')


def p_c2() -> tuple:
    """Development cont.: Dm E Am Am — runs climb to the high peak, then land."""
    return make_pattern(
        [('D-3', 'm'), ('E-3', 'M'), ('A-3', 'm'), ('A-3', 'm')],
        ['D-3', 'E-2', 'A-2', 'A-2'],
        [('D-5', 2), ('F-5', 2), ('A-5', 2), ('F-5', 2), ('D-5', 2), ('A-4', 2), ('D-5', 2), ('F-5', 2),  # Dm
         ('E-5', 2), ('G#5', 2), ('B-5', 2), ('G#5', 2), ('E-5', 2), ('B-4', 2), ('E-5', 2), ('G#5', 2),  # E peak
         ('A-5', 4), ('E-5', 4), ('C-5', 4), ('A-4', 4),                                                  # Am land
         ('B-4', 4), ('C-5', 4), ('D-5', 4), ('E-5', 4)],                                                 # climb up
        bass_style='e')


def p_d1() -> tuple:
    """Lyrical contrast: C Em F G — sustained singing lead, gentle quarter bass."""
    return make_pattern(
        [('C-4', 'M'), ('E-3', 'm'), ('F-3', 'M'), ('G-3', 'M')],
        ['C-3', 'E-2', 'F-2', 'G-2'],
        [('E-5', 8), ('G-5', 8),
         ('G-5', 4), ('E-5', 4), ('B-4', 8),
         ('A-4', 4), ('C-5', 4), ('F-5', 8),
         ('E-5', 4), ('D-5', 4), ('B-4', 8)])


def p_d2() -> tuple:
    """Am F Dm E — turn back to the dominant; ends on E-4 -> loops to A1."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('D-3', 'm'), ('E-3', 'M')],
        ['A-2', 'F-2', 'D-3', 'E-2'],
        [('C-5', 4), ('E-5', 4), ('A-5', 4), ('E-5', 4),
         ('C-5', 4), ('A-4', 4), ('F-4', 8),
         ('D-5', 4), ('F-5', 4), ('E-5', 4), ('D-5', 4),
         ('B-4', 4), ('G#4', 4), ('B-4', 4), ('E-4', 4)])


# Pattern order + loop target (position index that the song loops to after the
# 0xFF terminator). Intro is position 0; loop to position 1 (A1) so the intro
# plays only once.
PATTERN_BUILDERS = [p_intro, p_a1, p_a2, p_b1, p_b2, p_c1, p_c2, p_d1, p_d2]
LOOP_POSITION = 1


# -----------------------------------------------------------------------------
# Header + file assembly (same layout as the barbarian / mars tools).
# -----------------------------------------------------------------------------
def build_pt3() -> bytes:
    patterns_data = [b() for b in PATTERN_BUILDERS]
    samples = {1: build_sample_lead(), 2: build_sample_arp(),
               3: build_sample_kick(), 4: build_sample_snare()}
    ornaments = [build_ornament_empty(), build_ornament_minor(), build_ornament_major()]

    position_list = bytes([i * 3 for i in range(len(patterns_data))] + [0xFF])

    header_size = 0xC9
    name = b'HEROIC THEME (FOLLIN STYLE)'.ljust(32)[:32]
    author = b'SAGA DARK (ORIGINAL)'.ljust(32)[:32]

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
    h[0x64] = 6                       # speed (frames/row) — 6 = quarter ~125 BPM (slower)
    h[0x65] = len(patterns_data) + 1
    h[0x66] = LOOP_POSITION           # loop position index (intro plays once)
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
