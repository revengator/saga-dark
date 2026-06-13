#!/usr/bin/env python3
"""Compose an AY-3-8910 PT3 arrangement of J.S. Bach's Toccata and Fugue in
D minor (BWV 565) for the film remake's Track B candidate pool.

LICENCE: Bach died in 1750 — the composition is public domain everywhere by
any measure. This transcription/arrangement is our own (2026), so the module
is clean to bundle and distribute. See CONTEXT.md (F1) and
[[project_pt3_license]].

Why BWV 565 fits the AY where romantic orchestral music failed: it is ORGAN
music — discrete contrapuntal lines, no orchestration to lose. Three AY
channels map naturally onto two manuals + pedal, and terraced (stepped)
dynamics are exactly what a chip with per-channel volume does best. The
iconic gestures are all monophonic-friendly: the mordent, the runs, the
rolled diminished seventh, the violin-style bariolage fugue subject.

Arrangement — D minor, speed 4 (row = 80 ms; 16ths at 12.5 notes/s), 64-row
patterns (16 rows/bar), 8 patterns played straight through, loop to the top:

  pat  section
  p0   opening statement, high octave: A mordent - rest - G F E D C# run -
       D held. All three channels in parallel octaves (organo pleno).
  p1   the same statement an octave lower (terraced, softer), then the
       third gesture lower still — sinking into the depths.
  p2   the rolled diminished seventh from the bottom (each channel CATCHES
       and HOLDS a chord tone as the roll passes it, like an organ roll
       under the sustain) -> fermata -> the D major resolution chord.
  p3   pedal-point toccata: D pedal hammering 8ths under broken-chord
       16ths through Dm - C - Bb -> A (the dominant), chords shimmering
       on the middle channel via triad ornaments.
  p4   FUGUE exposition: the bariolage subject alone (drone A alternating
       with a falling line), then the tonal answer on the dominant with a
       descending countersubject under it.
  p5   third entry in the BASS (pedal register) under free 16th
       counterpoint + sustained chord tones — the fugue thickens.
  p6   episode: a circle-of-fifths 16th sequence (Dm Gm C F Bb A) over a
       walking pedal — pure Bach engine — landing on the dominant.
  p7   finale: molto adagio plagal cadence, Gm -> A -> D major (Picardy),
       held wide, two silent rows of breath -> loop to p0.

Build machinery: spectrumizer's pt3 package (the user's own published
tool) — same approach as tools/pt3-compose-bushido.py.

Iteration log:
  v1 (2026-06-13) — first arrangement: opening, dim build, pedal toccata,
                    fugue exposition + bass entry + episode, plagal finale.
"""

from __future__ import annotations

import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
OUT_PATH = REPO / "remakes/128k-plus2-film/src/music/toccata.pt3"

try:
    import spectrumizer  # noqa: F401
except ImportError:
    _sibling = REPO.parent / "spectrumizer"
    if not (_sibling / "spectrumizer").is_dir():
        sys.exit("spectrumizer not found: pip install spectrumizer "
                 f"(or check out {_sibling})")
    sys.path.insert(0, str(_sibling))

from spectrumizer.pt3.encode import OFF, REST, encode_channel   # noqa: E402
from spectrumizer.pt3.ornaments import _ornament                # noqa: E402
from spectrumizer.pt3.samples import _sample_raw                # noqa: E402
from spectrumizer.pt3.writer import build_pt3                   # noqa: E402

ROWS = 64
BAR = 16

S_ORGAN, S_PEDAL, S_RUN = 1, 2, 3
O_NONE, O_MIN, O_MAJ, O_DIM = 0, 1, 2, 3


def build_samples() -> dict[int, bytes]:
    # Organ: a noise "chiff" transient, then flat sustain with a slow 1-period
    # detune triangle (ensemble shimmer). Organs do not decay.
    organ = _sample_raw([(0x00 | 11, 8)] +
                        [(0x80 | 15, 0, t) for t in (0, 1, 1, 0, -1, -1)],
                        loop=1)
    # Pedal: darker chiff, flat sustain (the 16' rank weight lives in the
    # octave doubling of the score, not the sample).
    pedal = _sample_raw([(0x00 | 13, 18)] + [0x80 | 14, 0x80 | 14],
                        loop=1)
    # Runs: slight per-note decay so fast 16ths articulate instead of smearing.
    run = _sample_raw([0x80 | a for a in (15, 14, 13, 12)], loop=3)
    return {S_ORGAN: organ, S_PEDAL: pedal, S_RUN: run}


def build_ornaments() -> dict[int, bytes]:
    return {O_NONE: _ornament([0]),
            O_MIN: _ornament([0, 3, 7]),
            O_MAJ: _ornament([0, 4, 7]),
            O_DIM: _ornament([0, 3, 6, 9])}     # diminished-7th shimmer


def chan(events: dict[int, tuple | str], rows: int = ROWS) -> bytes:
    """{row: cell} -> encoded channel. Row 0 is auto-anchored with OFF."""
    out: list = [REST] * rows
    for r, cell in events.items():
        out[r] = cell
    if out[0] == REST:
        out[0] = OFF
    return encode_channel(out)


def silent(rows: int = ROWS) -> bytes:
    return chan({}, rows)


def N(note: str, vol: int, sample: int = S_ORGAN,
      orn: int = O_NONE) -> tuple:
    return (note, {'vol': vol, 'sample': sample, 'ornament': orn})


# --------------------------------------------------------------------------
# p0 / p1 — the opening statements.
def statement(oct_shift: int, vol: int, base: int = 0,
              hold_off: int | None = 46) -> dict:
    """The m.1 gesture: A mordent, breath, G-F-E-D-C# run, D held.
    `oct_shift` transposes by octaves from the octave-5 layer."""
    def s(name: str) -> str:                     # shift 'A-5' by octaves
        return f"{name[:2]}{int(name[2]) + oct_shift}"
    ev = {
        base + 0: N(s('A-5'), vol), base + 1: N(s('G-5'), vol),
        base + 2: N(s('A-5'), vol),              # mordent, then ring
        base + 12: OFF,                          # breath
        base + 16: N(s('G-5'), vol, S_RUN), base + 18: N(s('F-5'), vol, S_RUN),
        base + 20: N(s('E-5'), vol, S_RUN), base + 22: N(s('D-5'), vol, S_RUN),
        base + 24: N(s('C#5'), vol, S_RUN),
        base + 28: N(s('D-5'), vol),             # fermata
    }
    if hold_off is not None:
        ev[base + hold_off] = OFF
    return ev


def p0() -> tuple[bytes, bytes, bytes]:
    """Statement 1, fortissimo, organo pleno: three parallel octaves."""
    return (chan(statement(0, 15)),
            chan(statement(-1, 13)),
            chan(statement(-2, 13)))


def p1() -> tuple[bytes, bytes, bytes]:
    """Statement 2 an octave down (softer manual), statement 3 compressed,
    lower still — the music sinks toward the diminished build."""
    a = {**statement(-1, 12, base=0, hold_off=28)}
    a.update(statement(-2, 13, base=32, hold_off=None))
    b = {**statement(-2, 11, base=0, hold_off=28)}
    b.update(statement(-3, 12, base=32, hold_off=None))
    c = {0: N('D-3', 10), 12: OFF,               # quiet shadow of the held D
         32: N('D-2', 12)}                       # then true pedal depth
    return (chan(a), chan(b), chan(c))


# --------------------------------------------------------------------------
def p2() -> tuple[bytes, bytes, bytes]:
    """The rolled dim7 from the bottom — each channel catches and HOLDS a
    chord tone as the roll passes (organ roll under full sustain) — fermata,
    then the D major resolution."""
    roll = ['C#3', 'E-3', 'G-3', 'A#3', 'C#4', 'E-4', 'G-4', 'A#4', 'C#5',
            'E-5']
    a, b, c = {}, {}, {}
    c[0] = N(roll[0], 11, S_PEDAL, O_DIM)        # the bass holds the root
    b[4] = N(roll[2], 12, S_ORGAN, O_DIM)        # mid catches G3
    for i, note in enumerate(roll[3:], start=3):
        a[i * 2] = N(note, min(15, 11 + i // 2), S_RUN)
    a[20] = N('E-5', 15, S_ORGAN, O_DIM)         # top holds — full dim7 rings
    # fermata ... then the resolution: D major, wide and bright.
    a[36] = N('F#5', 15, S_ORGAN, O_MAJ)
    b[36] = N('A-4', 13, S_ORGAN)
    c[36] = N('D-2', 15, S_PEDAL)
    a[60] = OFF; b[60] = OFF; c[60] = OFF
    return (chan(a), chan(b), chan(c))


# --------------------------------------------------------------------------
def broken(notes: list[str], bar: int, vol_hi: int = 14,
           vol_lo: int = 11) -> dict:
    """One bar of 16 sixteenths, beat heads accented."""
    out = {}
    for i, note in enumerate(notes):
        out[bar * BAR + i] = N(note, vol_hi if i % 4 == 0 else vol_lo, S_RUN)
    return out


FIG_DM = ['A-4', 'D-5', 'F-5', 'D-5', 'A-4', 'D-5', 'F-5', 'D-5',
          'A-4', 'D-5', 'F-5', 'D-5', 'A-4', 'D-5', 'F-5', 'A-5']
FIG_C = ['G-4', 'C-5', 'E-5', 'C-5', 'G-4', 'C-5', 'E-5', 'C-5',
         'G-4', 'C-5', 'E-5', 'C-5', 'G-4', 'C-5', 'E-5', 'G-5']
FIG_BB = ['F-4', 'A#4', 'D-5', 'A#4', 'F-4', 'A#4', 'D-5', 'A#4',
          'F-4', 'A#4', 'D-5', 'A#4', 'F-4', 'A#4', 'D-5', 'F-5']
FIG_A = ['E-4', 'A-4', 'C#5', 'A-4', 'E-4', 'A-4', 'C#5', 'A-4',
         'E-4', 'A-4', 'C#5', 'E-5', 'C#5', 'A-4', 'E-4', 'A-4']


def p3() -> tuple[bytes, bytes, bytes]:
    """Pedal-point toccata: broken chords spin over a hammered D pedal that
    only yields to A (the dominant) in the final bar."""
    a = {}
    for bar, fig in enumerate([FIG_DM, FIG_C, FIG_BB, FIG_A]):
        a.update(broken(fig, bar))
    chords = [('D-4', O_MIN), ('C-4', O_MAJ), ('A#3', O_MAJ), ('A-3', O_MAJ)]
    b = {}
    for bar, (root, orn) in enumerate(chords):
        for r in (0, 8):                          # half-note chord strokes
            b[bar * BAR + r] = N(root, 10, S_ORGAN, orn)
    c = {}
    for bar in range(4):
        root = 'A-2' if bar == 3 else 'D-2'
        for r in range(0, BAR, 2):                # hammered pedal 8ths
            c[bar * BAR + r] = N(root, 13, S_PEDAL)
    return (chan(a), chan(b), chan(c))


# --------------------------------------------------------------------------
# The fugue. Bariolage subject: a drone alternating with a falling line.
def bariolage(drone: str, line: list[str], vol: int) -> list[tuple]:
    """[line0, drone, line1, drone, ...] as 16 sixteenth cells."""
    cells = []
    for n in line:
        cells.append(N(n, vol, S_RUN))
        cells.append(N(drone, vol - 2, S_RUN))
    return cells


SUB_LINE = ['G-4', 'F-4', 'E-4', 'D-4', 'C#4', 'D-4', 'E-4', 'F-4']
ANS_LINE = ['D-5', 'C-5', 'B-4', 'A-4', 'G#4', 'A-4', 'B-4', 'C-5']
SUB_TAIL = ['G-4', 'F-4', 'E-4', 'D-4', 'C#4', 'D-4', 'E-4', 'C#4',
            'D-4', 'E-4', 'F-4', 'G-4', 'A-4', 'F-4', 'D-4', 'A-4']


def p4() -> tuple[bytes, bytes, bytes]:
    """Exposition: subject alone, its scale tail, then the answer on the
    dominant over a descending 8th countersubject."""
    a = {}
    for i, cell in enumerate(bariolage('A-4', SUB_LINE, 13)):
        a[i] = cell
    for i, n in enumerate(SUB_TAIL):
        a[BAR + i] = N(n, 12, S_RUN)
    # countersubject under the answer: descending 8ths
    cs = ['A-4', 'G-4', 'F-4', 'E-4', 'D-4', 'C#4', 'D-4', 'E-4',
          'F-4', 'E-4', 'D-4', 'C#4', 'D-4', 'A-3', 'D-4', OFF]
    for i, n in enumerate(cs):
        r = 2 * BAR + i * 2
        a[r] = OFF if n == OFF else N(n, 11, S_ORGAN)
    b = {}
    for i, cell in enumerate(bariolage('E-5', ANS_LINE, 13)):
        b[2 * BAR + i] = cell
    ans_tail = ['C-5', 'B-4', 'A-4', 'G-4', 'F-4', 'G-4', 'A-4', 'F-4',
                'G-4', 'A-4', 'B-4', 'C-5', 'D-5', 'B-4', 'G#4', 'E-5']
    for i, n in enumerate(ans_tail):
        b[3 * BAR + i] = N(n, 12, S_RUN)
    return (chan(a), chan(b), silent())


def p5() -> tuple[bytes, bytes, bytes]:
    """Third entry in the pedal register; free 16ths + chord shimmer above."""
    c = {}
    for i, cell in enumerate(bariolage('A-3', [n[:2] + str(int(n[2]) - 1)
                                               for n in SUB_LINE], 14)):
        c[i] = cell
    for i, n in enumerate(SUB_TAIL):
        c[BAR + i] = N(n[:2] + str(int(n[2]) - 1), 13, S_RUN)
    for bar, root in ((2, 'D-2'), (3, 'A-2')):
        for r in range(0, BAR, 2):
            c[bar * BAR + r] = N(root, 13, S_PEDAL)
    a = {}
    for bar, fig in enumerate([FIG_DM, FIG_DM, FIG_BB, FIG_A], start=0):
        if bar >= 2:
            a.update(broken(fig, bar, vol_hi=15, vol_lo=12))
    a[0] = N('F-5', 12, S_ORGAN); a[8] = N('E-5', 12, S_ORGAN)
    a[16] = N('D-5', 12, S_ORGAN); a[24] = N('C#5', 12, S_ORGAN)
    b = {}
    chords = [('D-4', O_MIN), ('D-4', O_MIN), ('A#3', O_MAJ), ('A-3', O_MAJ)]
    for bar, (root, orn) in enumerate(chords):
        for r in (0, 8):
            b[bar * BAR + r] = N(root, 9, S_ORGAN, orn)
    return (chan(a), chan(b), chan(c))


def p6() -> tuple[bytes, bytes, bytes]:
    """Episode: circle-of-fifths 16th sequence over a walking pedal,
    tightening onto the dominant."""
    seq = [('D-5', 'A-4', 'F-4'), ('D-5', 'A#4', 'G-4'),   # Dm  Gm
           ('E-5', 'C-5', 'G-4'), ('F-5', 'C-5', 'A-4'),   # C   F
           ('F-5', 'D-5', 'A#4'), ('E-5', 'C#5', 'A-4')]   # Bb  A
    a = {}
    r = 0
    for top, mid, low in seq:
        for n in (top, mid, low, mid, top, mid, low, mid):
            a[r] = N(n, 13 if r % 4 == 0 else 11, S_RUN)
            r += 1
    for i, n in enumerate(['E-5', 'C#5', 'A-4', 'C#5', 'E-5', 'A-5',
                           'G-5', 'F-5', 'E-5', 'D-5', 'C#5', 'D-5',
                           'E-5', 'C#5', 'A-4', 'E-4']):
        a[3 * BAR + i] = N(n, 14, S_RUN)
    roots = ['D-3', 'G-2', 'C-3', 'F-2', 'A#2', 'A-2', 'A-2', 'A-2']
    c = {}
    for h, root in enumerate(roots):
        for r in (0, 4):
            c[h * 8 + r] = N(root, 13, S_PEDAL)
    b = {}
    orns = [O_MIN, O_MIN, O_MAJ, O_MAJ, O_MAJ, O_MAJ, O_MAJ, O_MAJ]
    mids = ['F-4', 'G-4', 'G-4', 'A-4', 'A#4', 'A-4', 'A-4', 'A-4']
    for h, (root, orn) in enumerate(zip(mids, orns)):
        b[h * 8] = N(root, 9, S_ORGAN, orn)
    return (chan(a), chan(b), chan(c))


def p7() -> tuple[bytes, bytes, bytes]:
    """Finale, molto adagio: Gm -> A -> D Picardy, held wide; a breath of
    silence, then the loop returns to the mordent."""
    a = {0: N('D-5', 14, S_ORGAN), 16: N('C#5', 14, S_ORGAN),
         32: N('F#5', 15, S_ORGAN), 56: OFF}
    b = {0: N('G-4', 12, S_ORGAN, O_MIN), 16: N('A-4', 12, S_ORGAN, O_MAJ),
         32: N('D-4', 13, S_ORGAN, O_MAJ), 56: OFF}
    c = {0: N('G-2', 14, S_PEDAL), 16: N('A-2', 14, S_PEDAL),
         32: N('D-2', 15, S_PEDAL), 56: OFF}
    return (chan(a), chan(b), chan(c))


ORDER = [0, 1, 2, 3, 4, 5, 6, 7]
LOOP_POS = 0                       # the mordent IS the hook — loop the top
SPEED = 4


def main() -> int:
    patterns = [p0(), p1(), p2(), p3(), p4(), p5(), p6(), p7()]
    pt3 = build_pt3(patterns, build_samples(), build_ornaments(),
                    name='TOCCATA & FUGUE BWV565',
                    author='BACH (PD) ARR. SAGA DARK',
                    speed=SPEED, order=ORDER, loop_pos=LOOP_POS)
    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUT_PATH.write_bytes(pt3)
    secs = len(ORDER) * ROWS * SPEED / 50.0
    print(f"Wrote {OUT_PATH.relative_to(REPO)}  ({len(pt3)} bytes, "
          f"{len(patterns)} patterns, ~{secs:.0f}s loop)")
    return 0


if __name__ == '__main__':
    sys.exit(main())
