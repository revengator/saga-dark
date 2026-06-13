# Dark 2 — Phase 2 (The Castle in Ruins)

Reconstructed source code — **compiles byte-perfect against
`snapshots/dark2/dark2.sna`** (31739/31739 bytes match).

## Architecture: Dark 2 reuses Dark 1's engine

Confirmed by the author: the engine is the **same** for all phases of the main game (Dark 1, Dark 2, Dark 3 normal part, and future phases). Only the data changes (graphics, maps, phase-specific enemies).

Each phase has its own **local copy** of the engine modules (no shared INCLUDE) in `original-48k/src/dark2/`, with internal variables renamed to match the phase's memory map.

| Engine module in dark2 | Function |
|---|---|
| `mapper.asm` (CPANT) | Screen control and tile drawing |
| `colas.asm` (COLAS) | T0 sprite queue (MUP/MDOWN/SPRI1) |
| `abuelo.asm` (ABUELO) | Abuelo NPC |
| `hres-printing.asm` (IMPRESION) | High-resolution sprite blitter |
| `player.asm` (PERSO) | Player control |
| `powers.asm` (PODERES) | Player powers |
| `collisions.asm` (CHOQUES) | Collision detection |

Differences dark1↔dark2: 77 bytes in variable operands (see `tools/validation/translate_dark1_to_dark2.py`).

## Phase 2-specific modules

The only really new things in Phase 2 are the enemies and traps (all byte-perfect):

| INCLUDE | File | Notes |
|---|---|---|
| `ARMADURA` | `armadura.asm` | Armoured knight (9-hit threshold) |
| `TRIMONSTER` | `trimonster.asm` | Three-headed monster |
| `FUEGO` | `fuego.asm` | Decorative fire (torches/braziers) |
| `SIERRA` | `sierra.asm` | Double circular saw (horizontal+vertical movement) |
| `DEMONIO` | `diablo.asm` | DEMON, flying devil with chase AI |
| `PINCHO` | `pincho.asm` | Vertical spike trap that rises |
| `SALTARON` | `saltaron.asm` | Hopping enemy |
| `LLAMARON` | `llamaron.asm` | Flame-thrower |
| `GLOBO` | `globman.asm` | Swamp boss (huge 56×56 sprite, "La Viscosa") |

## The Phase 2 "main"

`main.asm` provides the phase-specific parts:

- **Memory map** different from Phase 1.
- **`BICHOS` table** with 15-entry dispatcher (PA00..PA13) determining which enemies appear in each Phase 2 sublevel.
- **Final loader** (`CARGA`/`CARGA1`/`CARGA2`/`CARGA3`) that loads the next phase from tape into `58167` with CALL ROM 1366.
- **Graphics initialisation** (`INICIO`, `BUINI0/1/2`) — `GRAFIN` table with the word "DARK" in the charset.
- **`SCROLL`** of its own.
- **`MORTE`/`CASIRA`/`MUERTE`/`NUEVO`** — death and respawn handling.

## Phase 2 memory map

| Address | Contents | Size |
|---:|---|---:|
| 23850 | CHARACTER GRAPHICS | 3423 |
| 27275 | PROGRAM (entry 43976) | — |
| 44000 | SCREEN GRAPHICS DATA | 255 |
| 44999 | STACK | — |
| 45000 | SCREEN GRAPHICS | 9016 |
| 54016 | GLOBMAN MOV DATA (TEF2) | 554 |
| 54790 | DPERSO (player face) | — |
| 54811 | DMALO (enemy face) | — |
| 54869 | MUERE (clears player face) | — |
| 54930 | VIVE (clears enemy face) | — |
| 55000 | DECOR SCREEN DATA (HAY) | 1304 |
| 56310 | ENEMI1 (GLOBMAN graphics) | 1816 |
| 58892 | PLAYER FACE | 72 |
| 58964 | GLOBMAN FACE | 72 |
| 59037 | "FIN" GRAPHIC | 96 |
| 59134 | SCREEN N.2 (DIFE=42750) | 4096 |
| 62230 | BUFFER | 2048 |
| 65279 | MIRROR TABLE + PHASE 2 LOADER | 256 |

## Build

```bash
./build.sh                          # normal binary
./build.sh cheat                    # INFINITE_ENERGY (RET in MUERTE 0xA8AD)
```

Produces `original-48k/build/dark2.bin` + `dark2.sna`. Automatic byte-perfect verification against `snapshots/dark2/dark2.sna`.
