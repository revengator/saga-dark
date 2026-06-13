# Dark 2 OCR — text from the original paper listing

OCR transcriptions of the PDFs in `original-48k/scan/dark2 scan/`.
Contain the **author's human names** (BICHOS, MUERTE, NUEVO,
ARMADURA, TRIVI, DEMON, GLOBO, etc.), original Spanish-language
comments and `; [?]` markers indicating doubtful OCR readings.

## How to use these files

When something in the clean `.asm` of `original-48k/src/dark2/` is not clear,
consult **in order**:

1. **`original-48k/ocr/dark2 ocr/<module>.asm`** (this directory) — for
   the author's human names and original comments.
2. **`original-48k/disasm/dark2_raw.asm`** — byte-perfect disassembly
   (authoritative for the actual bytes).
3. **`original-48k/scan/dark2 scan/<module>.pdf`** — paper scan.

## Cleanup status

The OCR cleanup is already **applied** in `original-48k/src/dark2/`:

- 18 `.asm` files + 1 sprite `.bin` compile to a byte-perfect `dark2.bin`
  (31739/31739 bytes against `snapshots/dark2/dark2.sna`).
- 308 human labels / 827 auto-labels (~27%) — concentrated on entry
  points and key sub-routines of each module.
- Fine-grained game loop cleanup: 43 human labels mapped (TART, STAR,
  MAIN, INICIO, CARGA*, FMA*, SONI*, MORTE, etc.) — main.asm went from
  7% to 22%.
- Data tables → DEFB conversion: 5 blocks in main + faces converted;
  316 spurious auto-labels removed; main.asm 22% → 74% human.

These OCR files remain useful as a **consultative reference**
(not used in the build), not as authoritative source.

## Available files

Enemies: `armadura.asm`, `trimonster.asm`, `fuego.asm`, `sierra.asm`,
`diablo.asm`, `pincho.asm`, `saltaron.asm`, `llamaron.asm`, `globman.asm`.

Main: `main.asm`.

Engine modules (mapper, colas, abuelo, hres-printing, player, powers,
collisions) are not kept separately in OCR: dark2 inherits the OCR
texts from Dark 1 (shared engine — see
[`engine-architecture.md`](../../../docs/engine-architecture.md)).
