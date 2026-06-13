# Dark 1 OCR — text from the original paper listing

OCR transcriptions of the PDFs in `original-48k/scan/dark1 scan/`.
Contain the **author's human names** (PANTAL, BUJA, MUERTE, BICHOS,
COLAS, MUP, MDOWN, SPRI1, etc.), original Spanish-language comments and
`; [?]` markers indicating doubtful OCR readings.

## How to use these files

When something in the clean `.asm` of `original-48k/src/dark1/` is not clear
(auto-generated labels, context, values), consult **in order**:

1. **`original-48k/ocr/dark1 ocr/<module>.asm`** (this directory) — for
   the author's human names and original comments. Useful for understanding
   the **intent** of the code.
2. **`original-48k/disasm/dark1_raw.asm`** — byte-perfect disassembly.
   Authoritative for the actual bytes (with `LXXXXH`/`SUB_XXXXH` labels).
3. **`original-48k/scan/dark1 scan/<module>.pdf`** — paper listing scan.
   Definitive visual reference.

## Cleanup status

The OCR cleanup is already **applied** in `original-48k/src/dark1/`:

- 19 `.asm` files + 4 sprite `.bin` compile to a byte-perfect `dark1.bin`
  (31739/31739 bytes against `snapshots/dark1/dark1.sna`).
- 528 human labels + 182 auto-labels (sub-labels in DEFB tables).
- Editable DEFB data: variables, TP0, SUEL/PANT, PEDD, PLAY (11K),
  HAY, NINJA sprites, HUD faces, GRAFIC FIN.

These OCR files remain useful as a **consultative reference**
(not used in the build), not as authoritative source.

## Available files

Engine: `mapper.asm`, `colas.asm`, `abuelo.asm`, `hres-printing.asm`,
`player.asm`, `powers.asm`, `collisions.asm`.

Enemies / traps: `viscosa.asm`, `stone-blocks.asm`, `final-boss.asm`.

Rest: `main.asm`, `faces-and-enemy.asm`, `menu.asm`, `loaders.asm`,
`screens.asm`, `tiles.asm`.

The `.asm` files for the remaining enemies (piranha, gaseodoptero, chicle,
speedy, dragons, explosion) are already clean in `src/dark1/` — no separate
OCR copy is kept.
