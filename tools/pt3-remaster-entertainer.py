#!/usr/bin/env python3
"""Remaster Track A — *The Entertainer* (Joplin, PD) — for the +2 128K film.

The shipping Track A is a `spectrumizer --style chiptune` conversion of the
Mutopia typeset (commit 62a134d). It plays *flat*: the melody is pinned at
volume 15 and the stride bass at 14 for every single note, so the piano never
breathes — it sounds mechanical. This script re-voices it WITHOUT touching a
note: it only rewrites per-note volumes (dynamics) and the module speed
(tempo). Everything else — pitches, samples, ornaments, the drum channel,
the play order — is reproduced byte-for-byte from the source.

The technique is a faithful parse -> re-encode round-trip (validated: 0
RowEvent diffs, the module uses no envelopes and no Vortex-only tokens), with
a volume curve laid over channels A (melody) and B (bass). Channel C (the
ragtime drum kit) already has dynamics and is left untouched.

LICENCE: The Entertainer is public domain (Joplin †1917). Our sequencing and
this re-voicing are ours. Clean to bundle and redistribute. See SOUNDTRACK.md.

Idempotent: always reads the immutable source blob (never its own output), so
it can be re-run / re-tuned freely. Run from anywhere:

    python3 tools/pt3-remaster-entertainer.py

--------------------------------------------------------------------------
Metric grid (read off the drum channel and the stride bass):
  * beat   = 4 rows; 1 row = a sixteenth; a 2/4 bar = 8 rows.
  * rows 0..~24 of each phrase are the octave-UNISON intro (melody doubled an
    octave down) — there the "bass" is really the melody, so it keeps the
    melody's loud curve; the punch of the opening run is preserved.
  * later rows are true stride: low "oom" on the beat, high "pah" chord on the
    offbeat -> the bass sits a plane below the melody, oom louder than pah.
  * speed 10 -> 8 lifts the beat from ~75 BPM to ~94 BPM, the classic tempo.
"""
from __future__ import annotations

import dataclasses
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
OUT_PATH = REPO / "remakes/128k-plus2-film/src/music/entertainer.pt3"
SOURCE_BLOB = "62a134d:remakes/128k-plus2-film/src/music/entertainer.pt3"

try:
    import spectrumizer  # noqa: F401
except ImportError:
    _sib = REPO.parent / "spectrumizer"
    if not (_sib / "spectrumizer").is_dir():
        sys.exit("spectrumizer not found: pip install spectrumizer "
                 f"(or check out {_sib})")
    sys.path.insert(0, str(_sib))

from spectrumizer.pt3.encode import OFF, REST, encode_channel   # noqa: E402
from spectrumizer.pt3.player import parse_module                # noqa: E402
from spectrumizer.pt3.writer import build_pt3                   # noqa: E402

# --- the remaster knobs ---------------------------------------------------
SPEED_NEW = 8   # was 10 (beat = 4 rows -> ~75 BPM); 8 -> ~94 BPM ragtime

# Per-note volume by metric position of the row (beat = 4 rows, 2/4 bar = 8):
#   down = bar downbeat (r % 8 == 0)   beat = beat 2     (r % 4 == 0)
#   off  = weak eighth offbeat (r % 2) sub  = sixteenth passing note
MEL_VOL = {'down': 15, 'beat': 14, 'off': 13, 'sub': 13}   # melody sings on top
BASS_VOL = {'down': 12, 'beat': 11, 'off': 10, 'sub': 10}  # stride under, oom>pah


def metric(r: int) -> str:
    if r % 8 == 0:
        return 'down'
    if r % 4 == 0:
        return 'beat'
    if r % 2 == 0:
        return 'off'
    return 'sub'


def at(e, i):
    return dataclasses.astuple(e)[i]


def read_source() -> bytes:
    return subprocess.run(["git", "show", SOURCE_BLOB], cwd=REPO,
                          capture_output=True, check=True).stdout


def extract_instruments(data: bytes) -> tuple[dict, dict]:
    """Lift the raw sample / ornament blobs straight out of the source so
    build_pt3 re-emits them unchanged (the parser only gives parsed forms)."""
    def u16(o): return data[o] | (data[o + 1] << 8)
    samples = {}
    for i in range(32):
        a = u16(0x69 + i * 2)
        if a:
            samples[i] = data[a:a + 2 + (data[a + 1] + 1) * 4]
    ornaments = {}
    for i in range(16):
        a = u16(0xA9 + i * 2)
        if a:
            ornaments[i] = data[a:a + 2 + (data[a + 1] + 1)]
    return samples, ornaments


def encode_with_vol(rows, vol_fn) -> bytes:
    """Re-encode one channel, replacing each note's volume via vol_fn(r, note,
    old_vol). REST/OFF cells and every other field are preserved exactly."""
    cells = []
    for r, e in enumerate(rows):
        if e is None:
            cells.append(REST)
            continue
        note, samp, orn, vol = at(e, 0), at(e, 1), at(e, 2), at(e, 3)
        if note is None:
            cells.append(OFF)
            continue
        cells.append((note, {'vol': vol_fn(r, note, vol),
                             'sample': samp, 'ornament': orn}))
    return encode_channel(cells)


def mel_vol(r, note, vol):
    return MEL_VOL[metric(r)]


def make_bass_vol(a_rows):
    def f(r, note, vol):
        m = metric(r)
        ae = a_rows[r]
        # octave-unison with the melody (the intro) -> keep the melody's plane
        if ae is not None and at(ae, 0) is not None and (at(ae, 0) - note) % 12 == 0:
            return MEL_VOL[m]
        return BASS_VOL[m]
    return f


def drum_vol(r, note, vol):
    return vol   # channel C already has dynamics: leave it alone


def main() -> int:
    src = read_source()
    m = parse_module(src)
    samples, ornaments = extract_instruments(src)

    patterns = []
    for (a, b, c) in m.patterns:
        patterns.append((encode_with_vol(a, mel_vol),
                         encode_with_vol(b, make_bass_vol(a)),
                         encode_with_vol(c, drum_vol)))

    out = build_pt3(patterns, samples, ornaments,
                    name=m.name, author=m.author, speed=SPEED_NEW,
                    order=m.order, loop_pos=m.loop_pos, tone_table=m.tone_table)
    OUT_PATH.write_bytes(out)
    secs = len(m.order) * 64 * SPEED_NEW / 50.0
    print(f"Wrote {OUT_PATH.relative_to(REPO)}  ({len(out)} bytes, "
          f"speed {m.speed}->{SPEED_NEW}, ~{secs:.0f}s)  [was {len(src)} B]")
    return 0


if __name__ == '__main__':
    sys.exit(main())
