# Architecture: the 3 engines of Saga Dark

> Saga Dark is NOT a single-engine game: it uses **3 distinct engines**,
> each with its own loader, memory map and main loop.

---

## 1. Main game engine — "platformer side-scroller"

**Used by:** Dark 1 (Phase 1), Dark 2 (Phase 2), Dark 3 (normal part,
not the dragon sub-level) and **all future phases**.

**Engine structure (shared modules):**

```
*F CPANT       ← screen control (mapper.asm)
*F COLAS       ← T0 sprite queue (colas.asm)
*F ABUELO      ← Abuelo NPC (abuelo.asm)
*F IMPRESION   ← sprite blitter (hres-printing.asm)
*F PERSO       ← player control (player.asm)
*F PODERES     ← player powers (powers.asm)
*F CHOQUES     ← collision detection (collisions.asm)
```

Each phase has its own **local copy** of the engine modules (no shared INCLUDE) in `original-48k/src/dark{1,2}/`, with
internal variables adapted — see the differences table in [`engine_reference.md`](engine_reference.md).

**Phase-specific files:**

- `main.asm` — memory map + main loop + `BICHOS` table
  that dispatches which enemies appear in each sublevel.
- One file per phase-specific enemy/trap
  (e.g. `armadura.asm`, `llamaron.asm`, etc. in `original-48k/src/dark2/`).
- Data: screens (`PANT1..PANT15`), graphics, palettes, sounds (all editable DEFB after the 2026-04-29 OCR cleanup).

**Tape loading:**
Typical multiload of the era — each phase loads its data into 16384 (screen)
and into a reserved memory area (33088, 45000, etc. depending on phase) and
runs its code from a specific `ORG`.

---

## 2. Dragon engine — "endless runner / fixed-screen"

**Used by:** only the dragon phase (the "bonus" sub-level after
Phase 2; the `sagadark` repo's README describes it as *"the Dragon
phase with the largest sprite ever seen in Spectrum history"*).

**Why it's different:**

- It's not a side-scroller with platforms — it's a
  "dodge the dragon coming horizontally" type of game (closer
  to an endless runner or a shooting gallery).
- The dragon sprite occupies **12 KB** (96 wide × 16 tall in cells) —
  the largest in the whole project.
- LDI transfer blocks come hand-unrolled (32-50
  consecutive LDIs) instead of using LDIR + DJNZ — maximum speed
  to move that huge sprite every frame.
- The main loop `TEB2` doesn't call CPANT/COLAS/etc.; it uses its own
  routines: SCROLL → ABRIRS → FUEGOS → VOLTA → ANDA → SALTOS → SALTMO →
  IMPRES → CAMBIO → IMPRE → MOVI → RELOJ → VDRA → VER → ESPERA → OKS.

**Files:**

- `original-48k/src/dark3/dark3.asm` — main code of the phase.
- `original-48k/src/dark3/dragon.asm` — code + dragon data
  (huge sprite + attributes + mouths).
- Both compile to a byte-perfect `dark3.bin` (25536/25536) against
  `snapshots/dark3/dark3.sna`.
- `docs/dark3-memory-map.md` — detailed memory map of this phase.

---

## 3. Film engine — "presentation/cutscene"

**Used by:** only the intro/film (the "Saga Film", game presentation
with credits, copyright TRITON SOFTWARE 1989-1990, animations).

**Why it's different:**

- It's not a game — they are pre-recorded scenes with directed animation.
- Uses its own charset (`charset.asm`), screen management
  (`pantallas.asm`), "rain"/lines effect, etc.
- Has its own "script" logic (scene → screen → next).

**Files (in `original-48k/src/film/`):**

- `game.asm` — main of the film
- `charset.asm` — custom character set
- `libreria.asm` — auxiliary routines (printing, sound, colour)
- `pelicula.asm` — the "film" (scenes)
- `pantallas.asm` — screen definitions
- `jaca.asm` — the horse-ride scene
- `pijama.asm` — the pyjama scene
- `final.asm` — final film screen
- `game.tap` — original compiled binary
- Reference snapshot: `original-48k/snapshots/film/`

Build: `original-48k/src/film/build.sh` produces `film.bin` + `film.tap`,
byte-perfect (41527/41527) against `game-sagadark.tap`.

---

## Implications for the 128K reconstruction (Phase 4 of the project)

1. **The main game engine** is ported ONCE and reused for
   the 3 existing phases + Level 5 (Kamuir's Fortress, pending).
2. **The Dragon engine** is independent — can be ported later
   without affecting the main engine.
3. **The Film engine** is independent and already has a working
   binary (`original-48k/src/film/game.tap`).

This greatly simplifies planning: incremental porting with
clear boundaries between the 3 engines.
