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
  v4 (2026-06-15) — final touch (user "ultimo toque"): an expressive pass on the
                     LEAD only — notes, rhythm, bass and percussion are unchanged.
                     (1) DELAYED VIBRATO: the lead sample now sustains clean for
                     ~16 frames then loops a +/-2-period, ~6 Hz tone-offset wobble,
                     so the C1/C2 eighth-note runs stay in tune but held notes
                     bloom into a singing vibrato (same tone-offset technique as
                     the bushido shakuhachi). (2) DYNAMICS: a per-section lead+arp
                     volume arc replaces the flat 15 — gentle intro (11), a
                     crescendo into the C2 climax (15/15), and an intimate dip in
                     the lyrical D1 (lead 13 over a receded arp 11 so the melody
                     sings on top), then a rebuild back to the loop.
  v5 (2026-06-15) — traditional Japanese / samurai SEASONING (user request),
                     added without converting the scale (the melody stays in A
                     natural minor; the heroic Follin identity is untouched):
                     (1) TAIKO: a new deep drum sample (high-byte0 noise rumble,
                     same technique as the bushido taiko) replaces the kick on
                     the downbeats + a four-hit taiko roll builds into the C2
                     climax. (2) SHAKUHACHI SIGH: an upper-appoggiatura ornament
                     (+1 semitone falling to the note) on held lead notes that
                     land on E (-> F-E) or A (-> Bb-A) — the two miyako-bushi
                     half-steps voiced as a fleeting grace (a1, b2, d1), so the
                     Japanese colour reads without Bb/F sitting in the harmony.
                     (3) KOTO: the lyrical D1 bridge's shimmer switches from a
                     triad to open fifths/octaves (koto voicing) — the Follin
                     per-frame trick is kept, only the voicing opens; the heroic
                     sections keep their triad shimmer.
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
def _sample_raw(ticks: list, loop: int | None = None) -> bytes:
    """Each tick is either an int (byte1 = mix+amp; byte0 and tone offset 0) or a
    tuple ``(byte1, byte0=0, tone_offset=0)``. The tone offset (bytes 2/3,
    little-endian SIGNED) is a FIXED per-tick addition to the channel period —
    oscillating it in a looped tail gives a pitch vibrato (not a glissando),
    exactly the encoding used by the bushido shakuhachi sample."""
    n = len(ticks)
    loop = n - 1 if loop is None else loop
    out = bytearray()
    out.append(loop)
    out.append(n - 1)
    for t in ticks:
        if isinstance(t, tuple):
            b1 = t[0]
            b0 = t[1] if len(t) > 1 else 0
            off = t[2] if len(t) > 2 else 0
        else:
            b1, b0, off = t, 0, 0
        out.append(b0 & 0xFF)               # byte0: no amp-slide / env / noise-slide
        out.append(b1 & 0xFF)               # byte1: mix bits + amplitude
        out.extend((off & 0xFFFF).to_bytes(2, 'little'))   # tone offset (signed LE)
    return bytes(out)


def build_sample_lead() -> bytes:
    """Singing lead with a DELAYED expressive vibrato.

    Ticks 0-15: bright attack settling to a steady sustain, tone offset 0 — the
    note speaks perfectly in tune. Ticks 16-23 (the loop region): a +/-2-period
    tone-offset wobble (triangle, ~6 Hz) so HELD notes bloom into a singing
    vibrato while FAST notes (< ~16 frames: the C1/C2 eighth-note runs) finish
    inside the clean attack region and never wobble. Same tone-offset technique
    as the bushido shakuhachi; the gradient (quarters wobble a touch, halves
    sing) is what gives the lead its Follin-style expressivity."""
    attack = [0x80 | a for a in
              (15, 15, 15, 14, 14, 14, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13)]
    vib = [(0x80 | 13, 0, off) for off in (0, 1, 2, 1, 0, -1, -2, -1)]
    return _sample_raw(attack + vib, loop=16)


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


def build_sample_taiko() -> bytes:
    """Taiko: a deep, resonant DRUM boom for the samurai flavour. The first three
    ticks are noise+tone with a HIGH AY noise period (byte0 = 22/25 -> slow,
    low-frequency rumble = the skin's body) carrying the bass root in their tone;
    then the tone rings down to a quiet sustain so the hit still anchors the
    low end without the four-on-the-floor development turning to mud. Same
    deep-noise (high byte0) technique as the bushido taiko."""
    boom = [(0x00 | 0xF, 22), (0x00 | 0xE, 25), (0x00 | 0xD, 22)]   # deep noise+tone
    body = [0x80 | a for a in (0xD, 0xB, 0x9, 0x8, 0x7, 0x6, 0x5, 0x5)]  # ring down
    return _sample_raw(boom + body, loop=10)            # quiet pitched low-end tail


def build_ornament_empty() -> bytes:
    return bytes([0x00, 0x00, 0x00])


def build_ornament_minor() -> bytes:
    """Per-frame minor-triad arpeggio: root, +3, +7 (semitones) cycling."""
    return bytes([0x00, 0x02, 0, 3, 7])


def build_ornament_major() -> bytes:
    """Per-frame major-triad arpeggio: root, +4, +7 cycling."""
    return bytes([0x00, 0x02, 0, 4, 7])


def build_ornament_sigh() -> bytes:
    """Shakuhachi 'sigh': a quick upper appoggiatura that falls into the note —
    +1 semitone for 3 frames (~60 ms) then settles on the note (loop holds 0).
    On a note that lands on E it voices F->E; on A it voices Bb->A — the two
    half-steps of the Japanese 'in'/miyako-bushi mode, here as a fleeting grace
    so the colour reads as Japanese without sitting in (and fighting) the
    A-minor harmony. Applied only to held E/A lead notes."""
    return bytes([0x03, 0x03, 1, 1, 1, 0])      # loop=3, 4 offsets: 1,1,1,0


def build_ornament_koto() -> bytes:
    """Koto/open shimmer: arpeggiate root, +7 (fifth), +12 (octave) per frame —
    open fifths/octaves instead of a triad, the hollow quartal/quintal colour of
    a koto. Used only on the lyrical D1 bridge so the heroic sections keep their
    Follin major/minor triad shimmer; the Follin per-frame trick itself is
    preserved, only the voicing opens up."""
    return bytes([0x00, 0x02, 0, 7, 12])        # loop=0, cycles 0,7,12


# -----------------------------------------------------------------------------
# Sample / ornament / volume assignments.
# -----------------------------------------------------------------------------
S_LEAD, S_ARP, S_KICK, S_SNARE, S_TAIKO = 1, 2, 3, 4, 5
ORN_EMPTY, ORN_MIN, ORN_MAJ, ORN_SIGH, ORN_KOTO = 0, 1, 2, 3, 4
V_LEAD, V_ARP, V_BASS = 15, 14, 15
SNARE_NOTE = 'A-2'             # dummy pitch for the snare (noise only; tone off)


def arp_channel(chords: list, vol: int = V_ARP,
                orn_override: int | None = None) -> bytes:
    """chords = [(root, 'm'|'M'), ...] one per bar. Hold the root for the whole
    bar with the matching triad ornament -> the Follin per-frame shimmer.
    `vol` lets a section recede/swell so the shimmer follows the dynamic arc
    (e.g. it pulls back under the lyrical lead, swells into the climax).
    `orn_override` forces one ornament for every bar regardless of chord quality
    (e.g. ORN_KOTO -> open-fifth koto shimmer for the lyrical bridge)."""
    rows: list = []
    for root, qual in chords:
        orn = orn_override if orn_override is not None else \
            (ORN_MIN if qual == 'm' else ORN_MAJ)
        rows.append((root, {'ornament': orn}))
        rows += [REST] * (BAR - 1)
    assert len(rows) == ROWS_PER_PATTERN
    return encode_channel(rows, S_ARP, vol, ornament=ORN_EMPTY)


def build_bass(roots: list, style: str = 'q', fill: str | None = None) -> list:
    """Bass+drums on one channel (preserves the arp shimmer). One root per bar.
    style 'q' = backbeat: deep TAIKO boom on beats 1 & 3, noise snare on 2 & 4.
    style 'e' = driving: TAIKO on the downbeat, lighter pitched kicks on 2/3/4
    (root/fifth) so the fast development keeps its drive without low-end mud.
    fill 'roll' = a four-hit taiko roll on the LAST beat of the final bar — a
    drum build-up into the next pattern's downbeat (used for the C1->C2 climax)."""
    rows: list = []
    for root in roots:
        fifth = transpose(root, 7)
        bar = [REST] * BAR
        if style == 'e':
            bar[0] = (root, {'sample': S_TAIKO})        # taiko anchors the beat
            bar[4] = (fifth, {'sample': S_KICK})
            bar[8] = (root, {'sample': S_KICK})
            bar[12] = (fifth, {'sample': S_KICK})
        else:
            bar[0] = (root, {'sample': S_TAIKO})        # taiko replaces the kick
            bar[4] = (SNARE_NOTE, {'sample': S_SNARE})
            bar[8] = (root, {'sample': S_TAIKO})
            bar[12] = (SNARE_NOTE, {'sample': S_SNARE})
        rows += bar
    if fill == 'roll':
        root = roots[-1]
        for r in (60, 61, 62, 63):                      # taiko 16ths into the climax
            rows[r] = (root, {'sample': S_TAIKO})
    return rows


def make_pattern(chords: list, bass_roots: list, lead_events: list,
                 bass_style: str = 'q', lead_vol: int = V_LEAD,
                 arp_vol: int = V_ARP, arp_orn: int | None = None,
                 bass_fill: str | None = None) -> tuple:
    """`lead_vol`/`arp_vol` set this section's dynamic level (the per-pattern
    base volume); the bass/drum channel keeps a constant level. `arp_orn` forces
    the arp ornament (ORN_KOTO for the koto bridge); `bass_fill` adds a drum
    fill ('roll' = taiko build-up into the next pattern)."""
    lead = encode_channel(line(lead_events, ROWS_PER_PATTERN), S_LEAD, lead_vol)
    arp = arp_channel(chords, arp_vol, orn_override=arp_orn)
    bass = encode_channel(build_bass(bass_roots, bass_style, fill=bass_fill),
                          S_TAIKO, V_BASS)
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
        [('---', 60), ('E-4', 4)],
        lead_vol=11, arp_vol=12)                  # gentle establish


def p_a1() -> tuple:
    """Am F C G — heroic statement (loop target)."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('C-4', 'M'), ('G-3', 'M')],
        ['A-2', 'F-2', 'C-3', 'G-2'],
        [('E-4', 4), ('A-4', 4), ('C-5', 4), ('B-4', 4),
         ('A-4', 2), ('B-4', 2), ('C-5', 4), (('A-4', {'ornament': ORN_SIGH}), 8),
         (('G-4', {'ornament': ORN_EMPTY}), 4), ('E-4', 4), ('G-4', 4), ('C-5', 4),
         ('B-4', 4), ('D-5', 4), ('B-4', 8)],
        lead_vol=13, arp_vol=13)                  # statement (loop target), mezzo


def p_a2() -> tuple:
    """Am F C E — climb higher, end on the dominant."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('C-4', 'M'), ('E-3', 'M')],
        ['A-2', 'F-2', 'C-3', 'E-2'],
        [('C-5', 4), ('E-5', 4), ('D-5', 4), ('C-5', 4),
         ('A-4', 4), ('C-5', 4), ('A-4', 8),
         ('G-4', 4), ('C-5', 4), ('E-5', 4), ('D-5', 4),
         ('C-5', 4), ('B-4', 4), ('G#4', 8)],
        lead_vol=14, arp_vol=13)                  # grow, climb to the dominant


def p_b1() -> tuple:
    """C G Am F — relative-major lift."""
    return make_pattern(
        [('C-4', 'M'), ('G-3', 'M'), ('A-3', 'm'), ('F-3', 'M')],
        ['C-3', 'G-2', 'A-2', 'F-2'],
        [('E-5', 4), ('G-5', 4), ('E-5', 4), ('C-5', 4),
         ('D-5', 4), ('B-4', 4), ('G-4', 8),
         ('A-4', 4), ('C-5', 4), ('E-5', 4), ('C-5', 4),
         ('A-4', 4), ('F-4', 4), ('A-4', 8)],
        lead_vol=14, arp_vol=13)                  # relative-major lift


def p_b2() -> tuple:
    """Dm E Am E — cadential close."""
    return make_pattern(
        [('D-3', 'm'), ('E-3', 'M'), ('A-3', 'm'), ('E-3', 'M')],
        ['D-3', 'E-2', 'A-2', 'E-2'],
        [('D-5', 4), ('F-5', 4), ('E-5', 4), ('D-5', 4),
         ('C-5', 4), ('B-4', 4), ('G#4', 4), ('B-4', 4),
         (('A-4', {'ornament': ORN_SIGH}), 8), (('E-4', {'ornament': ORN_EMPTY}), 4), ('A-4', 4),
         ('B-4', 4), ('G#4', 4), ('E-4', 8)],
        lead_vol=13, arp_vol=13)                  # cadential settle


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
        bass_style='e', lead_vol=13, arp_vol=13,
        bass_fill='roll')                         # dev starts (building) + taiko roll into C2


def p_c2() -> tuple:
    """Development cont.: Dm E Am Am — runs climb to the high peak, then land."""
    return make_pattern(
        [('D-3', 'm'), ('E-3', 'M'), ('A-3', 'm'), ('A-3', 'm')],
        ['D-3', 'E-2', 'A-2', 'A-2'],
        [('D-5', 2), ('F-5', 2), ('A-5', 2), ('F-5', 2), ('D-5', 2), ('A-4', 2), ('D-5', 2), ('F-5', 2),  # Dm
         ('E-5', 2), ('G#5', 2), ('B-5', 2), ('G#5', 2), ('E-5', 2), ('B-4', 2), ('E-5', 2), ('G#5', 2),  # E peak
         ('A-5', 4), ('E-5', 4), ('C-5', 4), ('A-4', 4),                                                  # Am land
         ('B-4', 4), ('C-5', 4), ('D-5', 4), ('E-5', 4)],                                                 # climb up
        bass_style='e', lead_vol=15, arp_vol=15)  # CLIMAX peak — full swell


def p_d1() -> tuple:
    """Lyrical contrast: C Em F G — sustained singing lead, gentle quarter bass."""
    return make_pattern(
        [('C-4', 'M'), ('E-3', 'm'), ('F-3', 'M'), ('G-3', 'M')],
        ['C-3', 'E-2', 'F-2', 'G-2'],
        [(('E-5', {'ornament': ORN_SIGH}), 8), (('G-5', {'ornament': ORN_EMPTY}), 8),
         ('G-5', 4), ('E-5', 4), ('B-4', 8),
         ('A-4', 4), ('C-5', 4), ('F-5', 8),
         ('E-5', 4), ('D-5', 4), ('B-4', 8)],
        lead_vol=13, arp_vol=11,                  # lyrical: arp recedes, lead sings
        arp_orn=ORN_KOTO)                         # koto open-5th shimmer + shakuhachi sigh


def p_d2() -> tuple:
    """Am F Dm E — turn back to the dominant; ends on E-4 -> loops to A1."""
    return make_pattern(
        [('A-3', 'm'), ('F-3', 'M'), ('D-3', 'm'), ('E-3', 'M')],
        ['A-2', 'F-2', 'D-3', 'E-2'],
        [('C-5', 4), ('E-5', 4), ('A-5', 4), ('E-5', 4),
         ('C-5', 4), ('A-4', 4), ('F-4', 8),
         ('D-5', 4), ('F-5', 4), ('E-5', 4), ('D-5', 4),
         ('B-4', 4), ('G#4', 4), ('B-4', 4), ('E-4', 4)],
        lead_vol=14, arp_vol=13)                  # rebuild toward the loop (A1)


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
               3: build_sample_kick(), 4: build_sample_snare(),
               5: build_sample_taiko()}
    ornaments = [build_ornament_empty(), build_ornament_minor(), build_ornament_major(),
                 build_ornament_sigh(), build_ornament_koto()]

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
