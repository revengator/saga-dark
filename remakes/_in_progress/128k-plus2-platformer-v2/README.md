# Saga Dark — +2 128K — Platformer

The single, continuous +2 128K reconstruction of Saga Dark's side-scrolling
action: the four 1989-1990 levels (Dark 1 + Dark 2) refactored into a
**unified engine** with per-level descriptors. **v1 ships these two phases as
one continuous game**; the missing end-game content the cassette release never
shipped (Level 5 Kamuir's Fortress, final boss, Book pickup, ending) is the
planned **v2**. Technique catalogue and phased plan in [`IDEAS.md`](IDEAS.md).

## Status

🚧 **v2 IN PROGRESS (started 2026-06-05)** — this is the work-in-progress copy
that extends the released **v1** (frozen at
[`../../128k-plus2-platformer/`](../../128k-plus2-platformer/)) with the endgame
content the cassette never shipped. v2 begins as an exact copy of v1: Dark 1 +
Dark 2 as one continuous game (player turn/flip, per-tick energy + damage flash,
tuned bosses, per-level AY music — Heroic Theme + Mars).

**Active target:** Level 5 / Kamuir's Fortress + final boss + Book pickup +
victory cutscene (the unified engine + free banks 6/7 host it). When v2 is done it
graduates back out of `_in_progress/`.

> ⚠️ **v1 is frozen.** This is a physical copy, so fixes made here do NOT
> propagate to the published v1 (and vice versa) — reconcile by hand if a
> shared-engine fix is ever needed.

The detailed refactor history below records how the unified engine was built.

**Already in place (byte-perfect groundwork):**

- ✅ **Engine refactor** (4.1B 3a-3d). 7 motor modules + game-loop +
  bichos + sound-fade-carga + HUD + cara-perso under `engine/`,
  layout-parametrizable, validated byte-perfect against `dark1.sna` and
  `dark2.sna` via `tests/build-tests.sh`.
- ✅ **Modular wrapper** (4.0). `main.asm` builds Phase 1 from the
  refactored `engine/` + `levels/phase1/` instead of from a `dark1.sna`
  blob.
- ✅ **Phase 2 stash + LDIR transition** (4.1, 4.2a-c). Dark 2 RAM image
  in pageable banks 1/3/4; transition at `0x5B00` fires on NINJA-killed
  → in-memory bank swap, no tape reload. Verified visually. *This is the
  step that the unified-engine refactor is replacing.*
- ✅ **Phase 1 divergence**. All Phase 1 sources under `levels/phase1/`;
  no `original-48k/src/dark1/` references in the build.

**Unified engine — DONE (2026-05-20 → 22):** _(E1/E2a/E2b groundwork — Phase 2
source divergence, game-loop DEFB→asm, per-phase literals EQU-ified — folded in;
see `git log`.)_

- ✅ **Table-driven `BICHOS`** — `engine/bichos.asm` is a jump-table dispatcher
  (per-level handler table) replacing the `CP n / JP z,PAnn` chain. The 87-B
  pad is dropped in unified builds (`IF UNIFIED_HOOKS`). Emulator-validated.
- ✅ **Canonical hook-mode game-loop** — `engine/game-loop.asm` carries a single
  shared loop (built `-DUNIFIED_HOOKS=1`) parametrized by per-level **hooks**
  (`INIT_LEVEL`/`FRAME_CHECK`/`MORTE_RESET`/`NUEVO_RESET`). Both phases' OCR
  listings share this loop; only shipped `dark1` drifted. The legacy Phase 1
  loop stays as the `UNIFIED_HOOKS=0` branch so `dark1-v2` keeps building.
- ✅ **Phase 2 split** — `phase2/main.asm` monolith → `data`/`game-loop`/`e123`/
  `bichos`/`handlers`/`sound`/`data-tail` modules (byte-perfect reorg).
- ✅ **Both phases converged onto the canonical loop + canonical var addresses**
  (2026-05-22, emulator-validated). Shared state lives in the high zone
  (`engine/state.inc`: `VAR0=0xA6C8`, `T0=0xA6E7`, …). Per-phase glue:
  `levels/phase{1,2}/hooks.asm` + `bichos-table.asm`.
  - `tests/dark2-engine-v3.asm` — Phase 2 standalone under the canonical loop.
  - `tests/dark1-engine-v3.asm` — Phase 1 standalone, vars moved up to the
    canonical block (`data.asm` pointers → `DEFW sym+offset`; ~25 enemy refs
    `+0x95`; PANTAL's preload `VAR0` refs patched in the wrapper).
  - Both assemble to runnable +2 128K snapshots (`build-tests.sh` smoke targets,
    `-DUNIFIED_HOOKS=1`); border-colour tracing available via `-DTRACE_BORDER`.

**Single motor — Level A wired (2026-05-25, awaiting emulator).** Design +
rationale in [`UNIFIED-ENGINE.md`](UNIFIED-ENGINE.md) §"Single motor".

- ✅ **Coherent platformer (no `dark2.sna` dependency).** `main.asm` mirrors
  the dark1-engine-v3 layout (canonical loop in the 0xA60C hole + converged
  vars at 0xA6A1 + PANTAL preload patch) in banks 5/2/0; Phase 2 stash is
  **`build/phase2-converged{,-cheat}.bin`** — built from `tests/dark2-engine-
  v3.asm` and dd-extracted into the platformer's `build/` by `build.sh` —
  laid out in stash banks 1/3/4. Boot patches `PICHO2`(=CARGA stub) → `JP
  transition_routine`; transition LDIRs banks 1→5 (skipping 0x5B00-0x5BFF)
  + 3→2, pages 4→slot3, `JP 0xA7AA` (Phase 2 canonical STAR). Each phase
  keeps its own loop location (a single fixed loop addr overflows P1 by
  64 B → that's Level B). Both normal + cheat assemble to 131103 B; all 6
  build-tests pass.
- 🔜 **Level B (later)** — true single motor (drop the per-phase loop copy) +
  slot-3 paging of per-level faces/sprites. NB: only slot 3 is pageable, so a
  pure "no-LDIR" design isn't reachable; the hybrid LDIR-swaps the enemies.
- 🔜 **Inter-level cutscene** + **Level 5 — Kamuir's Fortress** + final boss +
  Book pickup + ending.

## Why one folder for both phases

Dark 1 and Dark 2 share the same engine in the originals — only **77 bytes
of variable operands differ** (mapped in
`tools/validation/translate_dark1_to_dark2.py`). On the original cassette
this manifested as two near-identical 31 739 B blocks; on +2 128K we
collapse them to **one engine resident in fixed memory + two sets of
level data in pageable banks**. Phase 1 → Phase 2 transition becomes
invisible (no tape reload, no copying RAM between banks).

## Scope

- ✅ Dark 1 + Dark 2 as one continuous game — no LDIR "phase swap", levels
  flow into each other (optional inter-level cutscene screen).
- ⏳ **(v2)** Level 5 — Kamuir's Fortress (new content, completes the 1990
  cassette story).
- ⏳ **(v2)** Final boss: Kamuir; Book pickup; victory cutscene.
- ✅ Bank-switched per-level assets, ZX0-compressed.
- ✅ AY music selectively (boss, ending, intro); polyphonic beeper
  (Octode/Phaser) for in-game gameplay — preserves the 48K soul.
- ✅ Bifröst*2 selectively in the HUD; NIRVANA+ on static boss screens
  (per [`IDEAS.md §10`](IDEAS.md)).
- ❌ Not byte-equivalent against any 48K `.sna` — by design, the unified
  engine diverges from the 1990 cassette layout.
- ❌ No Dragon Phase here — that's
  [`../../128k-plus2-dragon/`](../../128k-plus2-dragon/)
  (different engine, different load).
- ❌ No intro Film here — that's [`../../128k-plus2-film/`](../../128k-plus2-film/)
  (different code base, different load).

## Layout

```
128k-plus2-platformer/
├── main.asm                       ← +2 128K wrapper (banks, bootstrap, transition)
├── engine/                        ← shared motor (Dark 1+Dark 2 layout-parametrizable)
│   ├── defines.inc
│   ├── data/
│   │   ├── abuelo_sprite.bin      ← shared between phases (byte-identical)
│   │   └── cara-perso.bin         ← shared between phases
│   ├── mapper.asm / colas.asm / abuelo.asm / hres-printing.asm
│   ├── player.asm  / powers.asm  / collisions.asm
│   ├── game-loop.asm              ← canonical hook-mode loop (IF UNIFIED_HOOKS) + legacy ELSE
│   ├── bichos.asm / sound-fade-carga.asm
│   ├── state.inc                  ← canonical shared state-var map (high zone)
│   ├── hud.asm     / cara-perso.asm
│   └── …
├── levels/
│   ├── phase1/                    ← Dark 1 — fully local, vars converged to canonical
│   │   ├── defines.inc / data.asm / e123.asm / handlers.asm / data-tail.asm
│   │   ├── hooks.asm              ← INIT_LEVEL/FRAME_CHECK/MORTE_RESET/NUEVO_RESET + MUERTE…
│   │   ├── faces-data.asm / faces-tail.asm
│   │   ├── enemies/               ← 9 enemy modules (piranha…final-boss)
│   │   └── data/                  ← screen.bin / preload.bin / tail.bin / *_sprite.bin
│   └── phase2/                    ← Dark 2 — local, split + at the canonical (high) addrs
│       ├── defines.inc / data.asm / e123.asm / handlers.asm / sound.asm / data-tail.asm
│       ├── hooks.asm / bichos-table.asm / game-loop.asm (legacy, kept for v2)
│       └── enemies/               ← 9 enemy modules (armadura…globman)
├── tests/                         ← build-tests.sh: dark1/dark2 (byte-perfect v1),
│   │                                dark1-v2/dark2-v2, dark{1,2}-engine-v3 (unified +2 snaps)
│   ├── dark1-engine-v3.asm        ← Phase 1 standalone, canonical loop + converged vars
│   └── dark2-engine-v3.asm        ← Phase 2 standalone, canonical loop
└── build/                         ← saga-platformer-128k.sna [-cheat.sna]
```

Bank layout at `SAVESNA` time:

| Bank | Contents |
|---|---|
| 5  | Screen (fixed at `0x4000`) + bootstrap + pre-loaded data + engine motor + start of Phase 1 enemies |
| 2  | Rest of Phase 1 enemies + per-phase data + game-loop fragments |
| 0  | Per-phase data tail + faces + extra data (default in slot 3) |
| 1  | Phase 2 stash — Dark 2's bank-5 image |
| 3  | Phase 2 stash — Dark 2's bank-2 image |
| 4  | Phase 2 stash — Dark 2's bank-0 image |
| 6, 7 | Free (reserved for Phase 5, Super Film extensions) |

## Verification target

Behaviour-equivalent against `original-48k/snapshots/dark1/dark1.sna` and
`dark2/dark2.sna` for level content (visual + audio); the Phase 1 → 2
transition is new content, verified visually. The engine is also
validated byte-perfect against both 48K snapshots via
`tests/build-tests.sh`.

## Build

```bash
./build.sh             # produces build/saga-platformer-128k.sna
./build.sh cheat       # INFINITE_ENERGY build → build/saga-platformer-128k-cheat.sna
./build.sh all         # both
```

## Run

Both snapshots are committed under `build/` and run on a +2 128K (ZEsarUX is the
reliable choice on macOS — see the wrapper):

```bash
# Normal build (no cheats):
../../../tools/run-emulator.sh build/saga-platformer-128k.sna
# Cheat build (infinite energy):
../../../tools/run-emulator.sh build/saga-platformer-128k-cheat.sna
```

## Regenerating Phase 1 binary blobs

If the 48K reference `.sna` ever changes, regenerate the local `.bin`
copies in `levels/phase1/data/`:

```bash
SNA=../../../original-48k/snapshots/dark1/dark1.sna
dd if=$SNA of=levels/phase1/data/screen.bin   bs=1 skip=27         count=6912 2>/dev/null
dd if=$SNA of=levels/phase1/data/preload.bin  bs=1 skip=$((27+0x1C00)) count=3739 2>/dev/null
dd if=$SNA of=levels/phase1/data/tail.bin     bs=1 skip=$((27+0xA696)) count=6506 2>/dev/null
```
