# Saga Dark — +2 128K — Platformer

The single, continuous +2 128K reconstruction of Saga Dark's side-scrolling
action: the four 1989-1990 levels (Dark 1 + Dark 2) merged into one **unified
engine** and played as a single continuous game — Phase 1 → inter-level
"level complete" screen → Phase 2 → ending.

## Status

✅ **v1 RELEASED (2026-06-05).** Playable start to finish:

- Dark 1 (Phase 1) → Dark 2 (Phase 2) on one engine, no tape reload.
- Player left/right turn & fire, per-tick energy bar + damage-flash border,
  tuned end-of-phase bosses.
- Per-level AY music: Phase 1 = an original Follin-style *Heroic Theme*,
  Phase 2 = Holst *Mars, the Bringer of War* (public domain).

**Not in v1:** Level 5 / Kamuir's Fortress / final boss / Book pickup / ending.
That endgame content is **v2**, in progress at
[`../_in_progress/128k-plus2-platformer-v2/`](../_in_progress/128k-plus2-platformer-v2/),
where the full development history, tests, tooling and roadmap live. The unified
engine + free bank 6 are ready to host it.

## Why one folder for both phases

Dark 1 and Dark 2 share the same engine in the originals — only ~77 bytes of
variable operands differ. On the cassette this was two near-identical 31 739 B
blocks; on +2 128K they collapse to **one engine resident in fixed memory + two
sets of level data in pageable banks**, so the Phase 1 → Phase 2 transition is
invisible (no tape reload, no copying RAM between banks).

## Layout

```
128k-plus2-platformer/
├── main.asm            ← +2 128K wrapper (banks, bootstrap, Phase 1→2 transition)
├── phase2-build.asm    ← assembles the Phase 2 image; build.sh dd's it into the stash
├── build.sh            ← normal / cheat / all
├── engine/             ← shared motor (mapper, player, powers, collisions,
│                         game-loop, bichos, hud, cara-perso, state.inc, …)
├── levels/
│   ├── phase1/         ← Dark 1 — source + enemies + data + hooks
│   └── phase2/         ← Dark 2 — source + enemies + data + hooks
└── build/              ← saga-platformer-128k.sna [-cheat.sna]
```

Bank layout at `SAVESNA` time:

| Bank | Contents |
|---|---|
| 5  | Screen (`0x4000`) + bootstrap + pre-loaded data + engine motor + start of Phase 1 enemies |
| 2  | Rest of Phase 1 enemies + per-phase data + game-loop fragments |
| 0  | Per-phase data tail + faces (default in slot 3) |
| 1 / 3 / 4 | Phase 2 stash — Dark 2's bank 5 / 2 / 0 images |
| 7  | Shared PT3 player + the two music modules (heroic-theme, mars) |
| 6  | Free (reserved for v2 / Kamuir) |

## Build

```bash
./build.sh             # build/saga-platformer-128k.sna
./build.sh cheat       # INFINITE_ENERGY → build/saga-platformer-128k-cheat.sna
./build.sh all         # both
```

`build.sh` assembles `phase2-build.asm` into a temporary +2 snapshot, extracts
its linear 48 KB as `build/phase2-converged{,-cheat}.bin`, then assembles
`main.asm` (which INCBINs that `.bin` into stash banks 1/3/4). It needs
`../../original-48k/snapshots/dark2/dark2.sna` present for three original data
regions (screen / preload / code tail) that aren't in the local Phase 2 source.

## Run

Both snapshots are committed under `build/` and run on a +2 128K (ZEsarUX is the
reliable choice on macOS):

```bash
../../tools/run-emulator.sh build/saga-platformer-128k.sna        # normal
../../tools/run-emulator.sh build/saga-platformer-128k-cheat.sna  # cheat (infinite energy)
```

## Regenerating Phase 1 binary blobs

If the 48K reference `.sna` changes, regenerate the local `.bin` copies in
`levels/phase1/data/`:

```bash
SNA=../../original-48k/snapshots/dark1/dark1.sna
dd if=$SNA of=levels/phase1/data/screen.bin   bs=1 skip=27             count=6912 2>/dev/null
dd if=$SNA of=levels/phase1/data/preload.bin  bs=1 skip=$((27+0x1C00)) count=3739 2>/dev/null
dd if=$SNA of=levels/phase1/data/tail.bin     bs=1 skip=$((27+0xA696)) count=6506 2>/dev/null
```
