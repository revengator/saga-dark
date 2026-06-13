# Unified Engine — design & migration plan

> Status: design (2026-05-22). Supersedes the literal E2c step ("relocate Phase 2
> variables to Dark 1 addresses"). Decision recorded in `CONTEXT.md`: the goal is **one
> engine** (motor + game-loop + dispatcher) serving Phase 1, Phase 2 and any future level.
> The unified build is intentionally **NOT byte-perfect** vs the original `.sna` files —
> it is a full refactor. Regression net = the original-source tests (`tests/dark1-engine.asm`,
> `tests/dark2-engine.asm`, which keep building byte-perfect from `original-48k/src/`) plus
> visual validation in the emulator.

## Key discovery: the author already designed a unified loop

Source-consultation rule (see `CONTEXT.md`): the **OCR** is the author's paper listing (intent);
the **disasm** is authoritative for the shipped bytes. They can disagree.

- The shipped **`dark1.sna`** main loop (extracted into `engine/game-loop.asm`, kept byte-perfect
  by `tests/dark1-engine-v2.asm`) is a **messy split**: `STAR` (init) → `MAIN` (runs once:
  input/update/colas/mapper/collisions) → `MORTE` (the real steady-state loop). Its labels are
  **misaligned** vs Dark 2: Dark 1's `MORTE` == the steady loop, Dark 1's `MORTE_K` == the
  death-reset. It calls engine routines by raw entry-point in an idiosyncratic order
  (`6E6E / 7C14 / 6ED1 / 79A2 / 72FB / 7393 / 757A`).
- **Both paper listings** (`original-48k/ocr/dark1 ocr/main.asm` and `dark2 ocr/main.asm`) show the
  **same clean loop**:

  ```
  MAIN  CALL AAAAAA      ; hres-printing
        CALL PODER       ; weapon / power update
        CALL PODERS      ; powers update     (OCR: PODERES)
        CALL ABUELO      ; "grandfather" anim/enemy
        CALL MOVI        ; movement          (clean label: ANTIC2)
        CALL SALIR       ; scroll / exit-screen check (collisions)
        CALL BICHOS      ; per-screen enemy dispatcher
        ... death / transition checks ...
        CALL BBBBBB      ; display
        CALL CCCCCC      ; display           (clean label: ESPEJ)
        CALL DDDDDD      ; display
        JP   MAIN
  ```

- The shipped **`dark2.sna`** loop (`levels/phase2/main.asm`, byte-perfect by
  `tests/dark2-engine-v2.asm`) **matches that clean loop** almost exactly — plus a `TRUCO`
  cheat-code hook. So Dark 2's shipped loop is *both* the author's intended design *and* tested bytes.

**Conclusion:** the shipped `dark1.sna` drifted from its own listing. The clean, unified loop is
real and is the one that actually ships in Dark 2. Unifying the engine **restores** the author's
intended architecture rather than inventing a new one.

## Canonical unified loop = Dark 2's loop

Adopt `levels/phase2/main.asm`'s `STAR2`/`MAIN` as the engine's canonical loop. Phase 1 runs under
it. The shipped Dark 1 messy loop in `engine/game-loop.asm` is **discarded** (it stays only inside
`original-48k/src/dark1/` for the v1 byte-perfect net).

### Loop alignment (by function, not label name)

| # | Canonical (Dark 2 shipped) | Dark 1 OCR (intent) | Dark 1 shipped (discarded) |
|--:|---|---|---|
| 1 | `CALL AAAAAA` | `AAAAAA` | `AAAAAA` (0x7263) |
| 2 | `CALL PODER` | `PODER` | `0x7C14` (powers, single call) |
| 3 | `CALL PODERS` | `PODERS` | — |
| 4 | `CALL ABUELO` | `ABUELO` | `0x6E6E` + `0x6ED1` (abuelo, two calls) |
| 5 | `CALL ANTIC2` (MOVI) | `MOVI` | `0x79A2` (player) |
| 6 | `CALL SALIR` | `SALIR` | `SALIR` (0x7C31) |
| 7 | `CALL BICHOS` | `BICHOS`¹ | `BICHOS` |
| 8 | `TABLA2==0xE0 → MORTE` | `TABLA2==192 → MORTE` | `TABLA2==0xC0 → MORTE_K` |
| 9 | `TABLA2==0xA4 → TRUCO` | — | — |
| 10 | `MUER==1 → MORTE` | `MUER==1 → MORTE` | `CASIRA==1 → MORTE_K` |
| 11 | `DAMA3==0x14 → CARGA` | `DAMA3==20 → CARGA`¹ | `DAMA1==0x14 → CARGA` |
| 12 | `CALL BBBBBB/ESPEJ/DDDDDD` | `BBBBBB` (in STAR) | `0x72FB/0x7393/0x757A` |

¹ Dark 1 OCR runs the `CARGA` check *before* `BICHOS`; Dark 2 runs all checks *after*. Canonical
keeps Dark 2's order.

### What is per-level (must be parametrized out of the loop)

1. **Death / transition constants** — the `TABLA2` compare values (`0xE0`/`0xA4` Dark 2 vs `0xC0`
   Dark 1) and the `CARGA` trigger variable (`DAMA?` — OCR `; [?]` on whether it is `DAMA2`/`DAMA3`;
   confirm in emulator). → descriptor fields.
2. **Init hook** — Dark 2: `TART` (NEGRO / clear-screen / `INICIO` / `PONLIS`) → `STAR`
   (`PONCO`/`DPERSO`/`DMALO`) → `STAR2` (`NEGRO`/`BORRA`/`RESET`/`SPRIPE`/`PANTAL`/`VUELCA`/`BBBBBB`).
   Per-level specifics (which screens/faces/colours) live behind the hook.
3. **BICHOS dispatch table** — the `PA00..PAxx` per-screen handler list (see E3 below).
4. **Enemy set, screen.bin, preload tables, faces, music** — per level (see E4 descriptor).

## Table-driven BICHOS (E3)

Replace the `CP n / JP z,PAnn` chain with a table walk:

```
BICHOS: A = (TABLA1+8)        ; sound trigger, unchanged
        ... CALL SONI if needed ...
        A = (VAR0)            ; current screen index
        HL = (descriptor.bichos_table) + A*2
        JP (HL)               ; -> PAnn handler for this screen
```

The `bichos_table` is `DEFW PA00, PA01, …` per level, pointed to by the descriptor. Handlers
`PAnn` stay per-level (they call that level's enemies). This removes the hard-coded address chain
and lets a new level ship just a table + handlers.

## Per-level descriptor (E4)

```
struct Level {
    word screen_ptr      ; 6912 B screen image (or paged bank id)
    word preload_ptr     ; pre-loaded data tables (TABLA1/2 seed, sprite ptrs)
    byte enemy_bank      ; paged bank holding this level's enemy code (E5)
    word bichos_table    ; DEFW PA00,PA01,… for the dispatcher
    word faces_ptr       ; HUD faces data
    word init_hook       ; per-level init routine (screens/colours/faces)
    byte death_const     ; TABLA2 value that triggers MORTE
    word carga_var       ; address checked for the level-end CARGA trigger
    word music_ptr       ; PT3 module (future)
}
```

Engine reads the active descriptor at level boot. `switch_level(id)` repoints it, repaints the
screen and repages the enemy bank — **no 48 KB LDIR** (E5 retires the current bank-stash transition
in `main.asm`).

## Shared engine-state variables

The unified engine needs **one** set of game-state variables at fixed addresses, referenced by
*both* levels' enemies/handlers (`E1/E2/E3`, `T0`, `VAR0`, `MUER`/`CASIRA`, `NU1/NU2`, `VAR7`, …).
Today Phase 1 puts them at the Dark 1 addresses and Phase 2 at Dark 1+0x95.

**Decision (to confirm before mass-editing):** converge on the **Dark 1 addresses**. Rationale:
the shared motor (`mapper..collisions`) already resolves its symbolic references there for
`dark1-engine-v2`, and Phase 1 is the running baseline. Phase 2's enemies/handlers/data get their
absolute references rewritten from Dark 2 addresses to the Dark 1 symbols. (Because the build is no
longer byte-perfect, a fresh clean layout is also possible — but Dark 1 addresses minimise churn.)

## Rollout & validation (incremental)

1. **Loop + dispatcher.** Replace `engine/game-loop.asm` + `engine/bichos.asm` with the
   canonical (Dark 2-derived) unified loop and the table-driven `BICHOS`, parametrized by the
   descriptor fields above. Keep `engine/sound-fade-carga.asm` shared (SONI/FMA/CARGA).
2. **Phase 1 descriptor.** Build `levels/phase1/` as descriptor #1; Phase 1 runs under the canonical
   loop. Validate: assembles + fits (`MEMORY-MAP.md` refresh) and **user visual test** — Phase 1
   plays correctly under the new loop. (No longer byte-perfect vs `dark1.sna`.)
3. **Phase 2 descriptor.** Rewrite `levels/phase2/` per-level pieces against the shared variable
   addresses; Phase 2 runs under the same loop. Validate: emulator.
4. **Coexistence (E5).** `switch_level` repoints the descriptor instead of LDIR-copying a 48 KB
   image. Validate: emulator (Phase 1 → Phase 2 transition).

**Regression net throughout:** `tests/dark1-engine.asm` and `tests/dark2-engine.asm` (v1, built from
`original-48k/src/`) stay byte-perfect and guard the originals. The `-v2` wrappers become the
unified-engine smoke tests (assemble + fit, not byte-perfect).

## Risks / open items

- **OCR `; [?]` operands** on the death/CARGA checks (`DAMA2` vs `DAMA3`, exact `TABLA2` values per
  level) — verify in emulator; cross-check the shipped `dark2.sna` bytes (authoritative).
- **Phase 1 content under Dark 2's loop:** Phase 1's enemies/handlers must be happy with the
  `PODER/PODERS/ABUELO/MOVI` call set and order. Both listings use it, so this is the intended
  configuration — but it was never the *shipped* Phase 1 loop, so emulator confirmation is required.
- **Shared-variable address choice** affects every per-level module; lock it before mass edits.

---

## Convergence + coexistence (E4/E5) — analysis & decisions (2026-05-22)

Phase B proved the canonical hook-mode loop hosts Phase 2 standalone (emulator-validated).
Next: make Phase 1 + Phase 2 coexist on **one** engine.

### Memory-map reality (ZX +2 128K)

- Only **slot 3** (0xC000-0xFFFF) is pageable via 0x7FFD. Slots 1/2 (banks 5/2) are **fixed**.
- The motor (0x6A9B-0x7E24) and the enemies (0x7E25-0xA6A0) are linked into slots 1/2 → **cannot be paged**.
- Per-level footprint ≈ **36 KB** (screen 6.9 + preload 3.7 + enemies ~10 + data-tail/sprites ~11 +
  faces ~4.2 + handlers/tables) **> one 16 KB pageable bank** → "just repage the level" is impossible.
  The win is a **single shared engine**, not zero-copy paging.

### Shared (fixed, one copy) vs per-level (swapped)

| Shared — slots 1/2, never touched | Per-level — swapped on level switch |
|---|---|
| motor `0x6A9B-0x7E24` (~5 KB) | screen `0x4000-0x5AFF` + preload `0x5C00-0x6A9A` |
| unified game-loop + BICHOS dispatcher + sound | enemies `0x7E26-0xA6A0` (~10 KB) + handlers + bichos-table |
| HUD + **common state block** | data-tail/sprites + faces `…-0xE695` (≈15 KB, slot-3-pageable) |

### Shared state-var inventory (motor-touched → must be common)

~18 vars. Low block (`POD4_VAR`…`PEDD1`) shifts by a uniform **+0x95** D1→D2; `E1/E2/E3` by **+0xAC**.

| var | D1 | D2 | var | D1 | D2 |
|---|---|---|---|---|---|
| POD4_VAR | 0xA60D | 0xA6A2 | VAR25 | 0xA61F | 0xA6B4 |
| ABUELO_OFF | 0xA612 | 0xA6A7 | VAR0 | 0xA633 | 0xA6C8 |
| VAR10 | 0xA613 | 0xA6A8 | T0 | 0xA652 | 0xA6E7 |
| VAR1 | 0xA614 | 0xA6A9 | PEDD1 | 0xA665 | 0xA6FA |
| VAR13 | 0xA615 | 0xA6AA | TP0 | 0xA6E8 | 0xA77D |
| VAR7 | 0xA616 | 0xA6AB | E1 | 0xA84B | 0xA8F7 |
| VARB | 0xA617 | 0xA6AC | E2 | 0xA84C | 0xA8F8 |
| VAR2 | 0xA619 | 0xA6AE | E3 | 0xA84D | 0xA8F9 |
| VAR47 | 0xA61A | 0xA6AF | | | |
| VAR49 | 0xA61E | 0xA6B3 | | | |

Plus loop/hook-owned vars I already control (NU1/NU2/MUER/VARMA/DASO). **Ref analysis:** the vast
majority are **by symbol** (retarget = change one EQU); only **~31 hardcoded-hex literals** total
(Phase 1 ≈ 21, Phase 2 ≈ 10, some of which are address comments in `data.asm`) — all **grep-able
absolute addresses, NOT computed refs**. So convergence is **medium-risk**, not dragon-territory.

**Entanglement to watch:** `VAR0` (screen index, common) is immediately followed by `PAN_PAD`
(per-level screen-pointer table); Phase 2's `T01` holds per-level enemy descriptors. Either keep
those adjacencies or fix the indexing when splitting common from per-level.

### Decisions (user, 2026-05-22)

1. **Converge to a NEW canonical common block** (`engine/state.*`), both phases re-linked — not
   "adopt Dark 1/Dark 2 as-is". Physically anchored at **0xA6A1+** (forced: must sit above the
   largest level's enemies, which end at 0xA6A0). Reuse Phase 2 addresses where moving is risky
   (VAR0/PAN_PAD, T01) to avoid gratuitous churn; give it clean names + one documented map.
2. **Coexistence mechanism = hybrid** (Claude's call): motor + common state fixed in slots 1/2;
   per-level faces/sprites paged in slot 3 (common 0xC000+, no copy); enemies LDIR-swapped.
   Reached **incrementally** (first single motor keeping the current LDIR, then optimise paging).

### Incremental rollout (each step emulator-validated)

1. Define `engine/state.inc` (canonical common block + D1/D2 mapping table).
2. **Converge Phase 2** in the v3 standalone (low churn — already in the high zone). Validate.
3. **Converge Phase 1** (move vars up to the common zone; ~21 hardcoded refs to rewrite). Validate.
4. **Single motor + current LDIR swap** (no duplicated motor copy). Validate Phase1→Phase2.
5. **Optimise:** page slot-3 per-level data (faces/sprites) instead of LDIR-copying it.

Regression net unchanged: `tests/dark1-engine.asm` + `tests/dark2-engine.asm` (v1 originals) stay
byte-perfect; the `-v2`/`-v3` wrappers + emulator guard the unified build.

---

## Single motor (E5 implementation) — design (2026-05-22)

Both phases now converged: `dark1-engine-v3.asm` (Phase 1) and `dark2-engine-v3.asm`
(Phase 2) each run standalone under the canonical hook-mode loop with **canonical
var addresses** (`VAR0=0xA6C8`, `T0=0xA6E7`, …). Motor (`0x6A9B-0x7E24`), var block
(`0xA6A1`) and faces (`0xD606`) sit at the **same** address in both; the loop body is
byte-identical (only its location differs — see below).

### The layout problem

The canonical loop lives at **different addresses** per phase:
- Phase 1: `STAR=0xA60C` — in the *enemy hole* (Phase 1's smaller enemies end at
  0xA60B; loop tucked into the gap so its 64 B of overflow at 0xA7AA disappears).
- Phase 2: `STAR=0xA7AA` — right after the var block (Phase 2's bigger enemies fill
  the hole, so the loop can't go there; and Phase 2's smaller handlers+sound fit).

So a *single fixed loop address* shared by both is **not** free: at 0xA7AA Phase 1
overflows the data-tail pin by ~64 B (handlers 211 B + sound 207 B). Reclaiming that
needs the slot-3 paging step.

### Two-level rollout

**Level A — coherent platformer (no `dark2.sna` dependency), per-phase images.**
Keep each phase as its **own full image** (its own loop location, like the v3s); the
*motor source* is single (`engine/` + canonical loop), and Phase 2 comes from
`levels/phase2/` (converged) instead of `INCBIN dark2.sna`. The transition stays an
LDIR bank-swap; the motor (`0x6A9B-0x7E24`) is byte-identical across images so it
needn't be recopied (minor win). This is the real, near-term goal: one engine source,
both levels from editable converged sources, canonical loop, ready to host Level 5.
  - **(a)** Emit a `phase2-converged.bin` (Phase 2 under the canonical loop, linear
    0x4000-0xFFFF): a `--raw` wrapper (no DEVICE/SAVESNA) of the dark2-v3 includes.
    Likewise a `phase1-converged.bin` if the platformer INCBINs Phase 1 too.
  - **(b)** Refactor `main.asm`: boot `jp STAR` (canonical, 0xA60C); Phase 1 in banks
    5/2/0 (= dark1-v3 layout: loop-in-hole + PANTAL preload patch + converged refs);
    Phase 2 image (`phase2-converged.bin`) in stash banks 1/3/4; transition LDIRs it
    in and `jp 0xA7AA` (Phase 2's STAR). **CARGA→transition:** in unified builds the
    cassette `CARGA` is stubbed (`PICHO2`); the platformer must point CARGA at
    `transition_routine` (patch PICHO2, same as today's PAA1 patch — 3 B, fits).
  - **(c)** Emulator-validate boot → Phase 1 → (kill NINJA / DAMA trigger) → transition
    → Phase 2.

**Level B — true single motor + slot-3 paging (later).** Drop the per-phase loop
duplication: one loop at a fixed address; per-level enemies LDIR-swapped; per-level
faces/sprites paged into slot 3 (common 0xC000+, no copy). Resolves Phase 1's 64 B
overflow by moving sound/faces out of the tight slots-1/2 window. Higher risk
(cross-bank calls for paged sound), so deferred until Level A is stable.

### Risk / open
- `preload.bin` + `tail.bin` hold CODE with var refs (the PANTAL bug). The platformer
  uses Phase 1's preload/tail (already patched in dark1-v3) and Phase 2's
  (Phase 2 = Dark 2 addrs, no patch needed). Verify both on assembly.
- Phase 2's CARGA path (`DAMA3==0x14`) currently re-triggers the transition (infinite
  Phase 2 loop) — fine until Level 5 adds a phase counter (already noted in CONTEXT).
