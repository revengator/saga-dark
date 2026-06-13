# MEMORY-MAP.md — +2 128K Platformer (Dark 1 + Dark 2 unified engine)

> Address-ordered map of the unified platformer build. **Refresh this after ANY
> layout change** (new code, moved ORG, new INCBIN, new hole consumed) — stale
> maps cause silent overlap bugs. Regenerate the symbol-derived numbers with:
> `tools/platformer-memory-map.py` (reads a fresh `main.asm` `--sym`).
>
> Last refresh: 2026-06-02 (Phase-2 jump-key bug fixed ZERO-SHIFT: `TRUCO` now
> redirects its store to `TRUCOD` under `UNIFIED_PLATFORMER` instead of clobbering
> the jump key `0x6A85` — same byte count, so no address moved. Music kept alive
> on the inter-level screen by deferring `transition_routine`'s `di`).

## Bank / slot model (ZX +2 128K)

Four fixed 16 KB CPU windows (slots); `OUT (0x7FFD)` only repages **slot 3**:

| Slot | CPU range | Phase 1 bank | Phase 2 bank | Notes |
|---|---|---|---|---|
| 0 | `0x0000-0x3FFF` | ROM | ROM | 48K BASIC ROM (0x7FFD bit4=1) |
| 1 | `0x4000-0x7FFF` | **bank 5** | bank 5 | fixed — screen + boot + preload + engine head |
| 2 | `0x8000-0xBFFF` | **bank 2** | bank 2 | fixed — engine tail + state + data-tail + music + stack |
| 3 | `0xC000-0xFFFF` | **bank 0** | bank 4 | repaged: bank 0 (P1) / bank 4 (P2) / bank 7 (music tick) |

Banks **1/3/4** hold the Phase 2 stash at boot (see below). Banks **6/7**: bank 7
= PT3 player + track; bank 6 reserved for Phase 5 (Kamuir).

---

## Phase 1 active map (address-ordered)

`■` = code/data in use · `□` = FREE hole · `▓` = runtime stack/scratch (looks
free at build time, but written at runtime — **never place code here**).

| Range | Bank | Contents |
|---|---|---|
| `0x4000-0x5AFF` | 5 | ■ Screen pixels + attrs (`data/screen.bin`) |
| `0x5B00-0x5BF6` | 5 | ■ `boot_start`, `transition_routine`, `intermediate_screen`, `print_str` |
| `0x5BF7-0x5BFF` | 5 | □ **boot slack — 9 B** (pin `0x5C00`). Preserved into P2 (LDIR skips `0x5B00-0x5BFF`) |
| `0x5C00-0x6A9A` | 5 | ■ `preload.bin` (3739 B). `0x6A8C`/`0x6A99` = PANTAL VAR0 patch; `0x6A85-0x6A8A` = live controls |
| `0x6A9B-0x6DAB` | 5 | ■ engine `mapper` (PANTAL) |
| `0x6DAC-0x6E3A` | 5 | ■ engine `colas` (MUP/MDOWN) |
| `0x6E3B-0x7262` | 5 | ■ engine `abuelo` (SOUND2) |
| `0x7263-0x76C3` | 5 | ■ engine `hres-printing` (AAAAAA) |
| `0x76C4-0x7B9A` | 5 | ■ engine `player` (COMPR). `DAT2=0x7831` (spear state) |
| `0x7B9B-0x7C30` | 5 | ■ engine `powers` (PODER1) |
| `0x7C31-0x7E24` | 5 | ■ engine `collisions` (SALIR). `PALO_IMPL=0x7D75`, `RCPE=0x7DB5`, `CHOQUE`/`CHO_NC` |
| `0x7E25-0xA60B` | 5→2 | ■ Phase 1 enemies (piranha…final-boss) + sprite INCBINs. ⚠ `BICHOS_TABLE` screen-12 = hardcoded `DEFW 0x970E` → this region MUST NOT shift |
| `0xA60C-0xA65D` | 2 | ■ canonical hook-mode loop (`STAR`) |
| `0xA65E-0xA68D` | 2 | ■ `msg1/msg2/msg3` (inter-level screen strings, read pre-transition) |
| `0xA68E-0xA6A0` | 2 | ■ **hit-sfx**: `hit_beep` + `hit_latch` (19 B) — fills the loop-hole pad exactly |
| `0xA6A1-0xA7A9` | 2 | ■ canonical state block (`data.asm`). `VAR0=0xA6C8`, `T0=0xA6E7` |
| `0xA7AA-0xAA8D` | 2 | ■ hooks / e123 / bichos-table / handlers / sound-fade-carga. `SONI1_LP=0xA9CB`; `PICHO2`(CARGA stub)`=0xAA8B` |
| `0xAA8E-0xAAA0` | 2 | ■ **hit-sfx**: `palo_tramp` (19 B) — in the code-end pad (was 19 B free; now full) |
| `0xAAA1` | 2 | — `PLATFORMER_CODE_END` pin (code must end ≤ here) |
| `0xAAA1-0xACDE` | 2 | ■ `data-tail.asm` head (sprites/screens/maps). ⚠ pinned: VAR0/T0 abs pointers target it |
| `0xACDF-0xAF91` | 2 | original "zero region" — now repurposed at runtime (see below) |
| └ `0xAD00-0xAE00` | 2 | ■ IM 2 vector table (257 × `0xAD`); vector→`0xADAD`=`JP master_im2` |
| └ `0xAE02-0xAE7F` | 2 | ■ `master_im2` + `music_init/tick/pause/resume` + `music_paused`/`current_7ffd`. `.skip_tick` epilogue now sets `IY=0x5C3A` around the ROM-IM1 `call 0x0038` (+9 B; #17 fix) |
| └ `0xAE80-0xAE9E` | 2 | ■ **hit-sfx**: `hit_sfx_core` (#17, 31 B) — distinctive two-tone "dewp". ORG-pinned; **preserved into Phase 2** (LDIR skips `0xAD00-0xAEFF`) so one core serves both phases |
| └ `0xAEA0-0xAECE` | 2 | ■ **dmg-flash**: `dmg_border` (47 B) — per-frame player-damage red border flash. ORG-pinned, shared both phases; reads NU1 (P1 `0xA89A`/P2 `0xA8EC`, picked via `current_7ffd`) |
| └ `0xAECF-0xAEFF` | 2 | □ FREE within the preserved window (49 B) — stack-safe, both phases. Next bank-2 ORG-pinned routine goes here |
| └ `0xAF00-0xAF6B` | 2 | ▓ stack/scratch — keep code out (idle low-water `~0xAF6C`; depth on the movement/IM2 path unmeasured, stay conservative) |
| └ `0xAF6C-0xAF90` | 2 | ▓ Phase 1 stack working area (SP boots `0xAF90`, measured low-water `~0xAF6C`) |
| `0xAF92-0xBFFF` | 2 | ■ `data-tail.asm` tail |
| `0xC000-0xD605` | 0 | ■ `data-tail.asm` (slot-3 part) |
| `0xD606-0xE695` | 0 | ■ HUD + faces-data + cara-perso + faces-tail |
| `0xE696-0xFFFF` | 0 | ■ `tail.bin` (buffers/tables, 6506 B) |

---

## Free holes (stack-safe, slot 1/2, usable for new code)

| Hole | Range | Size | Notes |
|---|---|---:|---|
| bank-2 preserved | `0xAECF-0xAEFF` | **49 B** | bank 2, both phases (preserved by the LDIR's `0xAD00-0xAEFF` skip). Stack-safe. **Best hole for shared cross-phase routines** — ORG-pin them here like `hit_sfx_core`/`dmg_border` and reference by fixed address from Phase 2 |
| loop-hole pad | — | ~**3 B** | was 19 B; used by `hit_beep`+`hit_latch` (bounded by state block `0xA6A1`); a dead `ld b` in hit_beep could reclaim 2 B more |
| code-end pad | — | **0 B** | was `0xAA8E-0xAAA1` (19 B); now fully used by `palo_tramp`. The whole `0xA6A1-0xAAA1` chain is byte-packed — **any addition there overflows** the pinned data-tail |
| boot slack | `0x5BF7-0x5C00` | **9 B** | bank 5; preserved into Phase 2 (transition LDIR skips `0x5B00-0x5BFF`) |

**Do NOT use** `0xAF00-0xAF90` (looks free, is the Phase 1 stack + scratch) or any
build-time-zero run inside the data-tail (likely a runtime buffer). Because the
`0xA6A1-0xAAA1` code chain is full, new in-game code that both phases share is
best placed in the **bank-2 preserved hole** above (49 B) and called by symbol
(Phase 1) / fixed address (Phase 2). Bigger additions need **slot 3** (banks 6/7).

---

## Phase 2 stash + transition

At boot the Phase 2 image (converged `dark2-engine-v3`, linear `0x4000-0xFFFF`)
lives in pageable banks, regenerated by `build.sh` into `build/phase2-converged.bin`:

| Bank | Holds (Phase 2 addresses) |
|---|---|
| 1 | `0x4000-0x7FFF` (screen + boot stub + preload + engine head); `save_controls_helper`@`0xDB0C` |
| 3 | `0x8000-0xBFFF` (engine tail + state + data-tail head + Phase 2 SONI/music slot) |
| 4 | `0xC000-0xFFFF`; `end_of_demo_screen`@`0xE30D`, `transition_finish`@`0xE37B` |

`transition_routine` (boot area) LDIRs **bank 1→5** (skip `0x5B00-0x5BFF`) and
**bank 3→2** (skip `0xAD00-0xAEFF` to preserve the IM 2 table + music helpers),
then pages **bank 4 into slot 3** and `JP transition_finish`→`0xA7AA` (Phase 2 STAR).
Phase 2 runs **SP=0x5BFF** (boot area), so the `0xAE76+` region is free in P2.

Phase 2's own hit-sfx (`palo_tramp`/`hit_beep` at `0xAA24-0xAA47`, in v3's
code-end slack) is copied into bank 2 by the bank-3→2 LDIR.

---

## Hit-confirm beep (#17) — placement rationale

`collisions.asm` (guarded `IFDEF UNIFIED_PLATFORMER`) does `PALO EQU palo_tramp`
+ relabels the body `PALO_IMPL` — **0 bytes added, body unmoved** (so the enemy
region and its hardcoded `0x970E` ref don't shift). The trampoline + latched
beep live in the two stack-safe engine pads (split because no single ≥35 B
stack-safe always-mapped hole exists). Both phases now beep through one shared
**custom** core, `hit_sfx_core` (bank 2 @ `0xAE80`, see map): the engine's SONI
family is hardwired to a single pitch (`0x14`), so reusing it made the hit
confirm blend into every other blip — `hit_sfx_core` sweeps two pitches
(high→low "dewp") for a distinctive zap. `HIT_BEEP_CORE`=`hit_sfx_core` in both
builds (Phase 2 references it by fixed address `0xAE80`, valid because the core's
`0xAD00-0xAEFF` window survives the transition LDIR). Sources:
`engine/hit-sfx-tramp.asm`, `engine/hit-sfx-beep.asm`, `src/music/master_im2.asm`.

**IY gotcha (cost three crash iterations) — fixed GLOBALLY in `master_im2`:**
the engine's `RCPE`/`SWAP` leave `IY` = the enemy sprite box during *every*
collision check (`PALO` and `CHOQUE`), and the unified build keeps IRQs ON for
music. So an IM 2 firing mid-collision used to reach `jp 0x0038` (ROM IM 1, which
addresses sysvars via `(IY+n)`) with IY≠0x5C3A → it wrote sysvars over the sprite
box → RAM corruption → reset. Per-routine `IY` patches (v3 set it inside
`hit_beep`) were insufficient because the exposure is the whole collision path,
not just the beep. **Fix:** `master_im2.skip_tick` now wraps the ROM handler as
`push iy / ld iy,0x5C3A / call 0x0038 / pop iy / ret` — the ROM always sees the
correct sysvar base, and the interrupted code's IY is restored so no collision
check is disturbed. This protects baseline collisions too (the IY/IM2 hazard
predates #17; the original 48K game ran `DI` throughout, so it never had it).
With the global fix, in-game routines no longer need their own `IY` guard.
