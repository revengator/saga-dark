# Saga Dark — Engine Reference

> Reference for the main game engine (Dark 1 + Dark 2 + normal part of Dark 3).
> For the Dragon engine see [`dark3-memory-map.md`](dark3-memory-map.md).
> For all 3 engines in general see [`engine-architecture.md`](engine-architecture.md).

---

## Authoritative sources

The engine is fully reconstructed and **byte-perfect** against the original snapshots. Sources to consult, in priority order:

1. **`original-48k/src/dark1/*.asm`** — clean source code with the author's human labels (PANTAL, BUJA, MUERTE, BICHOS, COLAS, MUP, MDOWN, etc.). Compiles to a byte-perfect `dark1.bin`.
2. **`original-48k/disasm/dark{1,2,3}_raw.asm`** — byte-perfect disassembly of each `.sna`. Authoritative for the actual bytes but with auto-generated labels (`LXXXXH`/`SUB_XXXXH`). Useful for verifying individual instructions.
3. **`original-48k/ocr/dark{1,2,3} ocr/*.asm`** — OCR text of the original paper listing (with `; [?]` markers for doubtful readings). Useful for understanding the INTENT of the code and the author's names.
4. **`original-48k/scan/dark{1,2,3} scan/*.pdf`** — scans of the paper listing. Definitive visual reference.

---

## Memory map — Dark 1 (main engine, 48K)

| Range | Size | Contents | Source module |
|---|---:|---|---|
| 0x4000–0x57FF | 6 KB | Display file (bitmap) | — (video RAM) |
| 0x5800–0x5AFF | 768 B | Attribute file | — (video RAM) |
| 0x5C00–0x5FFF | 1 KB | ROM system variables | — |
| 0x6A9B–0x7E24 | 5034 B | Player sprites + tiles + header | — (data) |
| 0x7E25–0x86DD | 2233 B | Enemy sprites (piranha) | `piranha.asm` |
| 0x8603–0x8B43 | 1345 B | gaseodoptero (entry + sprite data) | `gaseodoptero.asm` |
| 0x89B2–0x970D | ~3K | viscosa | `viscosa.asm` |
| 0x970E–0x9FD5 | ~2.3K | chicle | `chicle.asm` |
| 0x9FD6–0xA2A8 | 723 B | stone-blocks (PIEDRA) | `stone-blocks.asm` |
| 0xA2A9–0xA357 | 175 B | speedy (SPEDY) | `speedy.asm` |
| 0xA358–0xA424 | 205 B | dragons (DRAGON) | `dragons.asm` |
| 0xA425–0xA4B3 | 143 B | explosion (EXPO) | `explosion.asm` |
| 0xA4B4–0xA60B | ~344 B | final-boss (NINJA) | `final-boss.asm` |
| 0xA60C–0xA7F0 | ~485 B | Game variables + TP0/SUEL/PANT/PEDD tables | `main.asm` |
| 0xA7F1 | 4 B | **MUERTE routine** (INFINITE_ENERGY cheat patches here) | `main.asm` |
| 0xAA7E–0xD605 | ~11 KB | PLAY table (game data) + attributes + face sprites + ENEMI1 | `main.asm` + `faces-and-enemy.asm` |
| 0xD606–0xE695 | ~4 KB | DPERSO/DMALO/MUERE/VIVE + HUD faces + GRAFIC_FIN | `faces-and-enemy.asm` |

**Binary entry point:** ORG 0x6A9B → 0xE695 (31739 bytes).

## Memory map — Dark 2 (same engine, different data)

Key differences dark1 → dark2 (relocated variables):

| Variable | dark1 | dark2 |
|---|---|---|
| VAR0 | 0xA633 | 0xA6C8 |
| VAR7 | 0xA616 | 0xA6AB |
| T0 | 0xA652 | 0xA6E7 |
| MUERTE | 0xA7F1 | 0xA8AD |
| NUEVO | 0xA820 | 0xA8D7 |
| BICHOS | 0xA84E | 0xA8FB |
| E1 / E2 / E3 | 0xA84B-D | 0xA8F7-9 |

Dark 2's 9 enemies (armadura, trimonster, fuego, sierra, diablo, pincho, saltarón, llamarón, globman) occupy 0x7E26–0xA572.

## Engine modules (shared between Dark 1 and Dark 2)

| Module | Function | Key symbols |
|---|---|---|
| `mapper.asm` | Screen control and tile drawing | CPANT, PANTAL |
| `colas.asm` | Sprite queue T0 (up/down movement) | MUP, MDOWN, SPRI1 |
| `abuelo.asm` | "Abuelo" NPC (sprite + simple AI) | ABUELO, BABU1 |
| `hres-printing.asm` | High-resolution sprite blitter | IMPRESION, SPEJO_TBL |
| `player.asm` | Player control (movement + animation) | PERSO |
| `powers.asm` | Player powers (hits, special jump) | PODERES |
| `collisions.asm` | Player↔enemy collision detection | CHOQUES |

## Main game loop

Dispatch loop documented in `main.asm`. Human labels mapped from the scan:

```
TART → STAR → STAR2 → MAIN → BICHOS dispatch (PA00..PA13)
                              ↓
                         MUERE / VIVE / SCROLL / GRAFIN
                              ↓
                         CARGA1/2/3 (if end of phase)
                              ↓
                         PLAY (data tables — what happens in each sublevel)
```

Frame sync: HALT in `MAIN` (50 Hz). Keyboard read in `PERSO` (`IN A,(0xFE)` with the row in B's high byte).

## Known cheats / patches

- **INFINITE_ENERGY** (dark1): 4-byte patch in MUERTE (0xA7F1) replacing the body with `RET; NOP×3`. Activate with `build.sh cheat`. Verified in FuseX.
- **INFINITE_ENERGY** (dark2): same patch in MUERTE (0xA8AD). Verified in FuseX.
- **dark3** doesn't use the traditional lives system — no cheat needed.

## How to add/modify the engine

1. Edit the corresponding `.asm` in `original-48k/src/dark1/` or `dark2/`.
2. `build.sh` recompiles and verifies byte-perfect against the reference snapshot (except when you have intentionally changed bytes).
3. For real changes (not cosmetic), compare `dark1.bin` against `snapshots/dark1/dark1.sna` with `tools/validation/compare.py`.
4. Test in an emulator (see [`emulator.md`](emulator.md)).
