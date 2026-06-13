#!/usr/bin/env python3
"""Compose "Bushido (Vispera)" — an ORIGINAL AY-3-8910 PT3 piece: the EVE of
a samurai-era battle. v1 had four movements (antecedentes/preparación,
batalla, victoria, felicidad); the user kept only the first movement and
asked for it to be worked out in full — so the whole piece is now the
build-up: mist, grief, dialogue, and the war machine slowly waking. The
battle never arrives; the loop closes on an unresolved suspension that
breathes straight back into the opening mist.

LICENCE: fully original composition (ours, 2026). The Japanese scales and
instrument gestures are traditional/non-copyrightable idiom. Safe to bundle
and distribute. See CONTEXT.md (F1) and [[project_pt3_license]].

Musical language:
  * miyako-bushi (in) scale on D — D, Eb, G, A, Bb — the dark half-step
    "Japanese minor" of koto/shamisen court music. The whole piece stays in
    it; the Eb5 is the alarm bell, the Bb->A half-step is the recurring
    "omen" gesture.
  * AY instruments: shakuhachi (breath chiff + swell + deep vibrato + a
    scoop-up BEND ornament), koto (hard pluck, ringing tail), taiko
    (noise+tone boom), rim/tsuzumi (noise tick), and a low breathy DRONE
    (the flute sample at D-3 with an open-fifth ornament shimmer).
  * ma — the silence between phrases — is the lead actor of the first half.

Form (64-row patterns, 16 rows/bar, speed 4; 18 patterns since v5, ~92 s loop —
the base skeleton below; v5 weaves in p1b / p2b / recuerdo i-ii / prep0 /
prep iii / res1b, see the iteration log):

  pat  scene                  texture
  p0   niebla (mist)          lone shakuhachi phrase, one koto D, ma
  p1   lamento                the falling-sigh phrase, koto answers low
  p2   diálogo                flute asks rising, koto answers falling, a
                              breathy open-5th drone creeps in underneath
  p3   koto solo              the koto takes the melody over its own
                              accompaniment; the FIRST distant taiko lands
  p4   preparación i          ostinato starts soft, heartbeat taiko (2/bar),
                              flute floats long rising tones D-G-A
  p5   preparación ii         ostinato full, heartbeat + rim, the war-call
                              phrase (the Eb5 alarm sounds for the first time)
  p6   víspera (the eve)      peak: alarm motif high, dense ostinato, the
                              war pattern almost forms, a climbing tail
  p7   resignación i          the machine cuts dead after the peak: the
       (aceptación)           flute echoes D5 and falls through the omen
                              Bb->A onto a long tonic D — fate accepted
  p8   resignación ii         the gentlest pattern — floating flute over
       (quietud)              soft koto quarters, still strictly in the
                              dark miyako-bushi scale; the omen turn
                              closes its last bar
  p9   resignación iii        the koto alone says goodbye — bare falling
       (despedida)            quarters onto D, the omen answered low, one
                              very distant taiko
  p10  suspensión             everything thins to the heartbeat; the flute
                              falls D5 -> Bb4 -> a long A4 that ties straight
                              into p0's opening A4 -> seamless loop

Build machinery: spectrumizer's pt3 package (same approach as
tools/pt3-compose-toccata.py).

Iteration log:
  v1 (2026-06-13) — four-movement war suite (battle/victory/happiness).
  v2 (2026-06-13) — user kept movement I only; expanded it 3 -> 8 patterns
                    (dialogue, koto-solo interlude, three-terrace build,
                    suspension close that loops into the opening).
  v3 (2026-06-13) — user asked for more length + "resignación": added a
                    three-pattern resignation movement after the peak
                    (aceptación / serenidad in the yo scale / despedida),
                    8 -> 11 patterns, ~41 s -> ~56 s.
  v4 (2026-06-13) — the yo-scale brightness "no pega": serenidad rewritten
                    as quietud, strictly miyako-bushi throughout.
  v5 (2026-06-13) — user asked to make Track B longer ("alargando las
                    melodias o anadiendo nuevos trozos"): 11 -> 18 patterns,
                    ~56 s -> ~92 s. Deepened the first half (lamento ii,
                    dialogo ii), added a NEW lyrical RECUERDO theme (i/ii,
                    no drums — what is defended, before the war wakes), eased
                    the build onset (prep 0) + added an extra terrace
                    (prep iii) in the climb, and one more resignation echo
                    (aceptacion ii). Loop still closes p7 -> p0 seamlessly.
"""

from __future__ import annotations

import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
OUT_PATH = REPO / "remakes/128k-plus2-film/src/music/bushido.pt3"

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

S_FLUTE, S_KOTO, S_TAIKO, S_RIM = 1, 2, 3, 4
O_NONE, O_BEND, O_POWER = 0, 1, 2


def build_samples() -> dict[int, bytes]:
    # Shakuhachi: breathy chiff, swell, then a deep slow vibrato.
    flute = _sample_raw(
        [(0x00 | 9, 5), 0x80 | 11, 0x80 | 12, 0x80 | 13] +
        [(0x80 | 13, 0, t) for t in (0, 1, 2, 1, 0, -1, -2, -1)],
        loop=4)
    # Koto: hard pluck, ringing tail.
    koto = _sample_raw([0x80 | a for a in (15, 12, 9, 7, 5, 4, 3, 2)],
                       loop=7)
    # Taiko: two noise+tone boom ticks, then the skin rings down.
    taiko = _sample_raw([(0x00 | 15, 22), (0x00 | 13, 25)] +
                        [0x80 | a for a in (10, 8, 6, 4, 3, 2)],
                        loop=7)
    # Rim / tsuzumi: a pure-noise tick that dies to silence.
    rim = _sample_raw([(0x10 | 13, 8), (0x10 | 9, 8), (0x10 | 4, 8),
                       (0x10 | 0, 8)], loop=3)
    return {S_FLUTE: flute, S_KOTO: koto, S_TAIKO: taiko, S_RIM: rim}


def build_ornaments() -> dict[int, bytes]:
    return {O_NONE: _ornament([0]),
            O_BEND: _ornament([-2, -1, 0], loop=2),   # shakuhachi scoop-up
            O_POWER: _ornament([0, 7, 12])}           # open-5th drone shimmer


def chan(events: dict[int, tuple | str], rows: int = ROWS) -> bytes:
    out: list = [REST] * rows
    for r, cell in events.items():
        out[r] = cell
    if out[0] == REST:
        out[0] = OFF
    return encode_channel(out)


def N(note: str, vol: int, sample: int = S_FLUTE,
      orn: int = O_NONE) -> tuple:
    return (note, {'vol': vol, 'sample': sample, 'ornament': orn})


def flute(note: str, vol: int = 13) -> tuple:
    return N(note, vol, S_FLUTE, O_BEND)


def koto(note: str, vol: int = 10) -> tuple:
    return N(note, vol, S_KOTO, O_NONE)


def taiko(vol: int = 14) -> tuple:
    return N('D-2', vol, S_TAIKO, O_NONE)


def rim(vol: int = 11) -> tuple:
    return N('C-4', vol, S_RIM, O_NONE)          # pitch unused: noise only


def drone(vol: int = 6) -> tuple:
    """Low breathy D with an open-fifth shimmer — the dread underneath."""
    return N('D-3', vol, S_FLUTE, O_POWER)


def ostinato(vol_hi: int, vol_lo: int, bars: range = range(4)) -> dict:
    """The preparation engine: koto 8ths D-A-Bb-A / D-A-G-A."""
    cells = ['D-4', 'A-3', 'A#3', 'A-3', 'D-4', 'A-3', 'G-3', 'A-3']
    out = {}
    for bar in bars:
        for i, n in enumerate(cells):
            out[bar * BAR + i * 2] = koto(n, vol_hi if i % 4 == 0 else vol_lo)
    return out


# --------------------------------------------------------------------------
def p0() -> tuple[bytes, bytes, bytes]:
    """Niebla: the lone shakuhachi out of silence. Ma everywhere."""
    a = {0: flute('A-4'), 10: flute('A#4', 12), 12: flute('A-4'),
         16: flute('G-4'), 28: flute('D#4', 11),
         32: flute('D-4'), 56: OFF}
    c = {0: koto('D-3', 11), 32: taiko(9), 48: koto('D-3', 8)}
    return (chan(a), chan({}), chan(c))


def p1() -> tuple[bytes, bytes, bytes]:
    """Lamento: the falling sigh; the koto answers from below; the omen
    half-step Bb->A closes the pattern."""
    a = {0: flute('D-5'), 8: flute('A#4', 12), 12: flute('A-4', 12),
         16: flute('A#4', 12), 20: flute('A-4', 11), 24: flute('G-4', 12),
         28: flute('A-4', 11),
         32: flute('G-4', 12), 40: flute('D#4', 11), 44: flute('D-4', 12),
         48: flute('D-4', 13), 62: OFF}
    c = {0: koto('D-3', 11), 8: koto('A-3', 9), 16: koto('G-3', 10),
         24: koto('A-3', 9), 32: koto('D#3', 10), 40: koto('D-3', 9),
         48: taiko(10), 56: koto('A#2', 8), 60: koto('A-2', 8)}
    b = {0: koto('D-4', 7), 32: koto('A#3', 7)}
    return (chan(a), chan(b), chan(c))


def p2() -> tuple[bytes, bytes, bytes]:
    """Diálogo: the flute asks rising, the koto answers falling — twice,
    higher and more anxious; a breathy drone creeps in underneath."""
    a = {0: flute('G-4', 12), 4: flute('A-4', 12), 8: flute('A#4', 13),
         20: OFF,
         32: flute('A-4', 12), 36: flute('A#4', 13), 40: flute('D-5', 14),
         54: OFF}
    c = {16: koto('A#3', 11), 18: koto('A-3', 10), 20: koto('G-3', 10),
         22: koto('D#3', 10), 24: koto('D-3', 11),
         48: koto('D#4', 11), 50: koto('D-4', 10), 52: koto('A#3', 10),
         54: koto('A-3', 10), 56: koto('G-3', 9), 58: koto('D-3', 11)}
    b = {}                       # drone dropped (fifth-buzz too prominent)
    return (chan(a), chan(b), chan(c))


def p3() -> tuple[bytes, bytes, bytes]:
    """Interludio: the koto alone takes the melody over its own
    accompaniment — and the FIRST distant taiko lands under it."""
    a = {0: koto('A-4', 13), 4: koto('A#4', 12), 8: koto('A-4', 12),
         12: koto('G-4', 11),
         16: koto('D#4', 12), 20: koto('G-4', 11), 24: koto('D-4', 12),
         32: koto('G-4', 12), 36: koto('A-4', 12), 40: koto('A#4', 13),
         44: koto('A-4', 12),
         48: koto('G-4', 12), 52: koto('D#4', 11), 56: koto('D-4', 12)}
    b = {}
    for bar in range(4):
        for r, n in ((2, 'A-3'), (6, 'D-3'), (10, 'A-3'), (14, 'D-3')):
            b[bar * BAR + r] = koto(n, 7)
    c = {0: koto('D-2', 10), 32: koto('D-2', 9), 48: taiko(8)}
    return (chan(a), chan(b), chan(c))


def p4() -> tuple[bytes, bytes, bytes]:
    """Preparación i: the ostinato starts walking — soft — under a rising
    flute line D-G-A (the resolve hardening), RE-ARTICULATED in shorter pulses
    instead of long held tones; the heartbeat."""
    a = {0: flute('D-4', 11), 8: flute('D-4', 11), 16: OFF,
         32: flute('G-4', 12), 40: flute('G-4', 12),
         48: flute('A-4', 12), 56: flute('A-4', 12), 62: OFF}
    b = ostinato(8, 6)
    c = {}
    for bar in range(4):
        c[bar * BAR + 0] = taiko(10)
        c[bar * BAR + 8] = taiko(8)
    return (chan(a), chan(b), chan(c))


def p5() -> tuple[bytes, bytes, bytes]:
    """Preparación ii: full ostinato, heartbeat + rim — and the war-call:
    the Eb5 alarm sounds for the first time."""
    a = {0: flute('A-4', 13), 4: flute('A#4', 12), 8: flute('A-4', 13),
         16: flute('D-5', 14), 24: flute('A#4', 12), 28: flute('A-4', 12),
         32: flute('D-5', 14), 36: flute('D#5', 15), 40: flute('D-5', 14),
         48: flute('A-4', 12), 52: flute('G-4', 12), 56: flute('A-4', 13),
         62: OFF}
    b = ostinato(10, 8)
    c = {}
    for bar in range(4):
        c[bar * BAR + 0] = taiko(13)
        c[bar * BAR + 8] = taiko(11)
        c[bar * BAR + 12] = rim(10)
    return (chan(a), chan(b), chan(c))


def p6() -> tuple[bytes, bytes, bytes]:
    """Víspera: the peak. The alarm motif rings high, the drums almost form
    the war pattern, and a climbing tail leaves everything hanging."""
    a = {0: flute('D-5', 14), 4: flute('D#5', 15), 8: flute('D-5', 14),
         16: flute('A#4', 13), 20: flute('A-4', 13),
         32: flute('D-5', 15), 36: flute('D#5', 15), 40: flute('D-5', 15),
         44: flute('A#4', 13),
         48: flute('G-4', 12), 52: flute('A-4', 13), 56: flute('A#4', 14),
         60: flute('D-5', 15)}
    b = ostinato(11, 9)
    c = {}
    for bar in range(4):
        c[bar * BAR + 0] = taiko(14)
        c[bar * BAR + 2] = taiko(11)
        c[bar * BAR + 4] = rim(12)
        c[bar * BAR + 8] = taiko(13)
        c[bar * BAR + 10] = rim(10)
        c[bar * BAR + 12] = taiko(11)
        c[bar * BAR + 14] = rim(9)
    return (chan(a), chan(b), chan(c))


def res1() -> tuple[bytes, bytes, bytes]:
    """Resignación i — aceptación. The war machine cuts dead after the
    peak; the flute echoes the D5 and falls through the omen (Bb -> A)
    onto a long tonic D. No drums: fate is accepted, not fought."""
    a = {0: flute('D-5', 13),
         16: flute('A#4', 12), 24: flute('A-4', 12),
         32: flute('G-4', 11), 44: flute('D#4', 10),
         48: flute('D-4', 12), 62: OFF}
    b = {0: drone(6), 32: drone(5)}
    c = {0: koto('D-3', 10), 16: koto('A#2', 9), 24: koto('A-2', 9),
         32: koto('D-3', 8), 48: koto('D-2', 9)}
    return (chan(a), chan(b), chan(c))


def res2() -> tuple[bytes, bytes, bytes]:
    """Resignación ii — quietud. The gentlest pattern of the piece, but
    it never leaves the dark miyako-bushi scale (the first cut brightened
    to the yo scale here and it did not belong). Floating flute over soft
    koto quarters; the omen turn closes the last bar."""
    a = {0: flute('D-4', 11), 8: flute('G-4', 11), 12: flute('A-4', 12),
         16: flute('A#4', 12), 28: flute('A-4', 11),
         32: flute('G-4', 11), 44: flute('D#4', 10),
         48: flute('D-4', 12), 62: OFF}
    b = {}
    for bar in range(4):
        notes = ['A-3', 'D-4', 'A#3', 'A-3'] if bar == 3 else \
                ['A-3', 'D-4', 'G-3', 'A-3']
        for i, n in enumerate(notes):
            b[bar * BAR + 2 + i * 4] = koto(n, 7)
    c = {0: koto('D-3', 9), 16: koto('D-3', 8), 32: koto('G-2', 8),
         48: koto('D-3', 9), 56: taiko(7)}
    return (chan(a), chan(b), chan(c))


def res3() -> tuple[bytes, bytes, bytes]:
    """Resignación iii — despedida. The koto alone says goodbye: bare
    falling quarters settling on D, the omen answered in the lowest
    register, one very distant taiko."""
    a = {0: koto('A-4', 12), 8: koto('G-4', 11),
         16: koto('D#4', 11),
         32: koto('D-4', 12),
         48: koto('A-3', 10)}
    b = {4: koto('D-3', 7), 24: koto('A-2', 7), 40: koto('D-3', 7),
         56: koto('A#2', 7), 60: koto('A-2', 7)}
    c = {0: koto('D-2', 9), 32: taiko(7), 48: koto('D-2', 8)}
    return (chan(a), chan(b), chan(c))


def p7() -> tuple[bytes, bytes, bytes]:
    """Suspensión: the machine stops short of war. Heartbeat fading, the
    flute falls D5 -> Bb4 -> a long A4 — the exact note the opening starts
    on, so the loop closes seamlessly into the mist."""
    a = {0: flute('D-5', 13), 28: OFF,
         32: flute('A#4', 12),
         40: flute('A-4', 12), 62: OFF}
    b = {0: drone(6), 32: drone(5)}
    c = {0: taiko(10), 8: taiko(8), 16: taiko(9), 24: taiko(7),
         48: koto('A#2', 8), 56: koto('A-2', 8)}
    return (chan(a), chan(b), chan(c))


# === v5 extension — make Track B longer without breaking the arc ===========
# Deepen the first half, add a NEW lyrical "recuerdo" theme, ease the build
# onset + add one more terrace in the climb, and echo the resignation once
# more. Woven into ORDER below; the loop still closes p7 -> p0 seamlessly.

def p1b() -> tuple[bytes, bytes, bytes]:
    """Lamento ii: the sigh deepens — the shakuhachi sings lower and longer,
    the koto shadows the fall from below, the breath-drone seeps in; the
    phrase settles onto the omen A-3."""
    a = {0: flute('G-4'), 12: flute('D#4', 11), 16: flute('D-4', 12),
         24: flute('A#3', 11), 28: flute('A-3', 11),
         32: flute('D-4', 12), 40: flute('D#4', 11), 44: flute('D-4', 12),
         48: flute('A#3', 11), 56: flute('A-3', 12), 62: OFF}
    b = {}                       # no drone here: its fifth-buzz piled up
                                 # three times across the mid section
    c = {0: koto('D-3', 10), 8: koto('A-2', 9), 16: koto('G-2', 9),
         24: koto('D-2', 10), 32: koto('D-3', 9), 40: koto('A#2', 9),
         48: koto('D-2', 9), 56: taiko(8)}
    return (chan(a), chan(b), chan(c))


def p2b() -> tuple[bytes, bytes, bytes]:
    """Diálogo ii: the exchange turns urgent — the flute's questions climb
    higher and quicker (the Eb5 alarm already flickers), the koto answers in
    a tighter tumble, the drone swells; it refuses to resolve."""
    a = {0: flute('A-4', 12), 4: flute('A#4', 13), 8: flute('D-5', 14),
         12: OFF,
         16: flute('A#4', 13), 20: flute('D-5', 14), 24: flute('D#5', 15),
         30: OFF,
         32: flute('D-5', 14), 36: flute('D#5', 15), 40: flute('D-5', 14),
         48: flute('A#4', 13), 56: flute('A-4', 12), 62: OFF}
    b = {}                       # drone dropped (fifth-buzz too prominent)
    c = {12: koto('D#4', 11), 14: koto('D-4', 10), 16: koto('A#3', 10),
         18: koto('A-3', 10), 20: koto('G-3', 10),
         44: koto('D#4', 11), 46: koto('D-4', 10), 48: koto('A#3', 10),
         50: koto('A-3', 10), 52: koto('G-3', 9), 54: koto('D-3', 10)}
    return (chan(a), chan(b), chan(c))


def recuerdo1() -> tuple[bytes, bytes, bytes]:
    """Recuerdo i: a NEW lyrical theme — what is being defended, remembered
    in the calm before the war wakes. The flute sings its most singing line
    over soft koto arpeggios; no drums. Still miyako-bushi, but tender."""
    a = {0: flute('D-4', 11), 8: flute('G-4', 12), 16: flute('A-4', 12),
         24: flute('A#4', 12), 32: flute('A-4', 12), 40: flute('G-4', 12),
         48: flute('D-4', 12), 56: flute('D#4', 11), 62: OFF}
    c = {0: koto('D-3', 9), 4: koto('A-3', 8), 8: koto('D-4', 9),
         12: koto('A-3', 8), 16: koto('D-3', 9), 20: koto('A-3', 8),
         24: koto('A#3', 9), 28: koto('A-3', 8), 32: koto('D-3', 9),
         36: koto('A-3', 8), 40: koto('D-4', 9), 44: koto('A-3', 8),
         48: koto('G-2', 9), 52: koto('A-3', 8), 56: koto('D-3', 9),
         60: koto('A-3', 8)}
    return (chan(a), chan({}), chan(c))


def recuerdo2() -> tuple[bytes, bytes, bytes]:
    """Recuerdo ii: the lyrical phrase answers, lifts once to the high D,
    then the shadow returns — the omen turn A#->A closes it and a first far
    taiko warns that the memory is ending."""
    a = {0: flute('A-4', 12), 8: flute('A#4', 13), 16: flute('D-5', 13),
         24: flute('A#4', 12), 28: flute('A-4', 12), 32: flute('G-4', 12),
         40: flute('A-4', 12), 44: flute('A#4', 12), 48: flute('A-4', 12),
         56: flute('A#4', 11), 60: flute('A-4', 12)}
    c = {0: koto('D-3', 9), 4: koto('A-3', 8), 8: koto('D-4', 9),
         12: koto('A-3', 8), 16: koto('G-2', 9), 20: koto('A-3', 8),
         24: koto('D-3', 9), 28: koto('A-3', 8), 32: koto('D-3', 9),
         36: koto('A-3', 8), 40: koto('A#3', 9), 44: koto('A-3', 8),
         48: koto('D-3', 9), 56: taiko(8)}
    return (chan(a), chan({}), chan(c))


def prep0() -> tuple[bytes, bytes, bytes]:
    """Preparación 0: out of the memory the war-engine's ostinato is born and
    firms up; the flute lets the recuerdo go in a few SHORT breathing notes
    (A-G-D-D#, each cut after ~a beat — no long held tone) as the heartbeat
    returns. Bridge from reverie to resolve."""
    a = {0: flute('A-4', 11), 6: OFF, 16: flute('G-4', 11), 22: OFF,
         32: flute('D-4', 11), 38: OFF, 48: flute('D#4', 10), 54: OFF}
    b = ostinato(7, 5)
    c = {0: koto('D-2', 7), 32: koto('D-2', 7), 56: taiko(8)}
    return (chan(a), chan(b), chan(c))


def prep_iii() -> tuple[bytes, bytes, bytes]:
    """Preparación iii: the extra terrace before the peak — full ostinato, a
    steady double heartbeat with rim, the Eb5 alarm insisting, the line
    climbing toward the eve."""
    a = {0: flute('D-5', 14), 8: flute('A#4', 13), 12: flute('D-5', 14),
         16: flute('D#5', 15), 24: flute('D-5', 14), 28: flute('A#4', 13),
         32: flute('D-5', 14), 36: flute('D#5', 15), 40: flute('D-5', 14),
         44: flute('A#4', 13), 48: flute('D#5', 15), 52: flute('D-5', 14),
         56: flute('A#4', 13), 60: flute('D-5', 14)}
    b = ostinato(10, 8)
    c = {}
    for bar in range(4):
        c[bar * BAR + 0] = taiko(13)
        c[bar * BAR + 6] = rim(10)
        c[bar * BAR + 8] = taiko(12)
        c[bar * BAR + 14] = rim(9)
    return (chan(a), chan(b), chan(c))


def res1b() -> tuple[bytes, bytes, bytes]:
    """Resignación i-bis (aceptación ii): the acceptance echoes — the lament
    returns but without struggle, the flute falling slow and bare to the low
    D over a sparse koto, the omen answered and let go."""
    a = {0: flute('D-4', 11), 16: flute('A#3', 10), 24: flute('A-3', 11),
         32: flute('G-3', 10), 48: flute('D-3', 11), 62: OFF}
    b = {0: drone(5), 32: drone(5)}
    c = {0: koto('D-3', 9), 24: koto('A#2', 8), 32: koto('D-2', 9),
         48: koto('D-2', 8)}
    return (chan(a), chan(b), chan(c))


ORDER = list(range(18))
LOOP_POS = 0
SPEED = 4


def main() -> int:
    patterns = [p0(), p1(), p1b(), p2(), p2b(), p3(),
                recuerdo1(), recuerdo2(), prep0(), p4(), p5(), prep_iii(),
                p6(), res1(), res1b(), res2(), res3(), p7()]
    pt3 = build_pt3(patterns, build_samples(), build_ornaments(),
                    name='BUSHIDO (VISPERA)',
                    author='SAGA DARK ORIGINAL 2026',
                    speed=SPEED, order=ORDER, loop_pos=LOOP_POS)
    OUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUT_PATH.write_bytes(pt3)
    secs = len(ORDER) * ROWS * SPEED / 50.0
    print(f"Wrote {OUT_PATH.relative_to(REPO)}  ({len(pt3)} bytes, "
          f"{len(patterns)} patterns, ~{secs:.0f}s loop)")
    return 0


if __name__ == '__main__':
    sys.exit(main())
