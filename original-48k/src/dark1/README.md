# SAGA DARK — Phase 1 (DARK1)

Reconstructed source code of Level 1 — **compiles byte-perfect against
`snapshots/dark1/dark1.sna`** (31739/31739 bytes match).

## Structure

```
original-48k/
├── snapshots/dark1/dark1.sna      ← original snapshot (49179 B, authoritative)
├── disasm/dark1_raw.asm           ← z80dasm disassembly of the RAM
├── ocr/dark1 ocr/                 ← OCR text of the scan (16 .asm with [?] markers)
├── scan/dark1 scan/               ← PDFs of the original listing (20 PDFs)
├── build/                         ← compilation outputs (gitignored)
│   ├── dark1.bin                    (31739 B raw, ORG 0x6A9B)
│   └── dark1.sna                    (49179 B, runs in any emulator)
└── src/dark1/
    ├── dark1.asm                  ← MASTER build file
    ├── defines.inc                ← shared EQUs
    ├── build.sh                   ← script: source → .bin + .sna
    ├── *.asm  (19 files)          ← clean, editable source code
    │   mapper, colas, abuelo, hres-printing, player, powers, collisions,
    │   piranha, gaseodoptero, viscosa, chicle, stone-blocks, speedy,
    │   dragons, explosion, final-boss, main, faces-and-enemy
    └── data/                      ← sprites as .bin (binary images)
        ├── piranha_sprite.bin       (1754 B)
        ├── chicle_sprite.bin        (1953 B)
        ├── gaseodoptero_sprite.bin  (600 B)
        └── abuelo_sprite.bin        (782 B)
```

## Build

```bash
./build.sh                          # normal binary
./build.sh cheat                    # with INFINITE_ENERGY (RET in MUERTE 0xA7F1)
```

Produces:
- `original-48k/build/dark1.bin` — 31739 raw bytes (ORG 0x6A9B → 0xE695)
- `original-48k/build/dark1.sna` — 49179 bytes, runs in Fuse/ZEsarUX/CSpect

## Byte-perfect verification

`build.sh` validates automatically:
```
dark1.bin: 31739B (31739/31739 byte-perfect vs original)
dark1.sna: 49179B (executable)
```

## Run in an emulator

See [`docs/emulator.md`](../../../docs/emulator.md). Shortcut:

```bash
open -a /Applications/FuseX.app original-48k/build/dark1.sna
# Or:
zesarux --machine 48k --snap original-48k/build/dark1.sna
```

## OCR cleanup status

| Category | Modules | Labels |
|---|---|---|
| Engine | mapper, colas, abuelo, hres-printing, player, powers, collisions | 100% human names |
| Enemies | piranha, chicle, gaseodoptero, speedy, dragons, explosion, viscosa, stone-blocks, final-boss | 100% human names |
| Main + faces | main, faces-and-enemy | 528 human + 182 auto-labels (sub-labels in DEFB tables) |

Editable DEFB data: variables, TP0, SUEL/PANT, PEDD, PLAY (11K), HAY,
NINJA sprites, HUD faces, GRAFIC FIN.

## Auxiliary folders (at the `original-48k/` level, not inside `src/dark1/`)

- **`scan/dark1 scan/`** — PDFs of the original paper listing (visual reference).
- **`ocr/dark1 ocr/`** — OCR text extracted from the PDFs, with `; [?]` marking
  doubtful readings. Useful as a reference for understanding original variables/comments.
- **`data/`** (inside `src/dark1/`) — only images (enemy sprites) as `.bin`.
