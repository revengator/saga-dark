# ZX Spectrum +2 128K — memory model (banks & slots)

Concept reference for everyone working on builds under `remakes/128k-plus2-*/`.
Confusing **bank** with **slot** is the typical cause of crashes when paging
— including a film B+ incident (2026-05-07) where code placed in a slot-3
bank tried to OUT a different bank into slot 3 and yanked itself out from
under its own execution.

## The Z80 sees 4 slots

The Z80 addresses 64 KB. Those 64 KB are divided into **4 slots** of 16 KB:

```
0x0000 ─┬───────────┐
        │  SLOT 0   │  16 KB
0x4000 ─┼───────────┤
        │  SLOT 1   │  16 KB
0x8000 ─┼───────────┤
        │  SLOT 2   │  16 KB
0xC000 ─┼───────────┤
        │  SLOT 3   │  16 KB
0xFFFF ─┴───────────┘
```

Slots are **fixed windows** of the Z80 address space. What changes is which
physical memory is connected to each slot.

## The +2 128K has 8 RAM banks

128 KB of RAM split into 8 banks of 16 KB: `bank 0`, `bank 1`, …, `bank 7`.
Each bank has its own independent storage. Plus 2 ROMs of 16 KB (128-BASIC
and 48-BASIC), selectable by bit 4 of the paging port.

## Slot ↔ bank mapping

| Slot | Z80 range     | Connected to                              | Pageable? |
|------|---------------|-------------------------------------------|-----------|
| 0    | `0x0000-3FFF` | ROM (128-BASIC or 48-BASIC, bit 4)        | bit 4 toggles ROM |
| 1    | `0x4000-7FFF` | **bank 5 ALWAYS** — wired in hardware     | no |
| 2    | `0x8000-BFFF` | **bank 2 ALWAYS** — wired in hardware     | no |
| 3    | `0xC000-FFFF` | bank N (bits 0-2 of port 0x7FFD)          | yes |

Banks 5 and 2 are wired to slots 1 and 2 in the +2 128K hardware — they
cannot be remapped. Only slot 3 is reprogrammable.

## What lives in slot 1: screen + RAM tail

Slot 1 contains bank 5 (16 KB), but only the first **6912 B** are the active
screen:

```
0x4000-0x57FF   Screen pixels  (6144 B, 256×192 mono)
0x5800-0x5AFF   Screen attrs   ( 768 B, 32×24 cells)
0x5B00-0x7FFF   Free RAM tail  (9.5 KB) — usable for code/data
```

The 9.5 KB tail is **regular RAM** — every byte here is part of bank 5 and
behaves like any other RAM. The film build uses this tail aggressively:

- `0x5B00-0x5BFF` printer buffer (256 B) → bootstrap + helpers (lang_final,
  wipe_menu, LANG_BLANK).
- `0x5C00-0x5DBF` BASIC system vars area (~448 B) — leave alone, the 48K
  ROM uses this when paged in slot 0 (CHANS at 0x5C4F, FLAGS at 0x5C3B,
  CHARS at 0x5C36).
- `0x5DBF` stack base (Z80 SP at boot).
- `0x5DC0-0x7FFF` film entry point + game.asm + libreria.asm + charset.asm
  + pijama.asm (eventually crosses into slot 2 / bank 2).

Bank 7 can act as a **shadow screen** when bit 3 of 0x7FFD = 1 — useful for
double-buffering. The +2 128K Film build doesn't use it; bank 7 holds ZX0
blobs PPANT4/5/9 instead.

## Paging port: 0x7FFD

```asm
LD BC, 0x7FFD
LD A, 0x16            ; 0001 0110 binary
OUT (C), A            ; bits:
                      ;   0-2 = 110 = bank 6 → into slot 3
                      ;   3   = 0   → screen normal (bank 5 visible)
                      ;   4   = 1   → 48-BASIC ROM in slot 0
                      ;   5   = 0   → unlocked (further OUTs allowed)
```

| Bit  | Meaning                                                   |
|-----:|-----------------------------------------------------------|
| 0-2  | Bank 0..7 to put in slot 3                                |
| 3    | 0 = bank 5 used for screen, 1 = bank 7 used for screen    |
| 4    | 0 = 128-BASIC ROM, 1 = 48-BASIC ROM in slot 0             |
| 5    | 0 = unlocked, 1 = lock (further OUTs to 0x7FFD ignored until reset — irreversible) |

**Hardware quirk on +2A / +3 (not on plain +2):** the port decoder requires
`A1=0 + A14=1 + A15=0` simultaneously. The canonical form
`LD BC, 0x7FFD ; OUT (C), A` has the right bits in BC. A shorter
`OUT (n), A` with `n=0xFD` would fail on +2A/+3 because the address bus
gets `n` echoed on A8-A15 from A — landing on the wrong port. Always use
the BC form.

## Critical rule: never page from inside slot 3

A routine that executes the OUT to swap slot 3 must **NOT** live in
slot 3. If it does, the moment the OUT lands, the bank under it changes,
the Z80's instruction fetch reads garbage from the new bank, and the
program crashes (typically a reset).

The usual safe homes for paging routines:
- bank 5 (slot 1) — wired fixed.
- bank 2 (slot 2) — wired fixed.

Examples in the +2 128K Film build:
- `boot_start` at `0x5B00` (bank 5, slot 1) — first OUT pages bank 6 into
  slot 3 to access decompress_all.
- `show_pantalla` at `0xBE00` (bank 2, slot 2) — pages bank 6 or bank 7
  into slot 3 per call to reach the right ZX0 blob; ALSO does the OUT
  back to bank 0 when done.

## Bank usage in the +2 128K Film build (post B+ pass)

| Bank | Slot use during film | Contents |
|------|---------------------|----------|
| 0    | slot 3 default      | IM2 vector area (`0xFDFD`), `TEXTOFIN` (`0xFFB5`-ish) |
| 1    | slot 3 temporary    | EN-strings stash + `LANG_OVERLAY` (paged only during EN menu choice) |
| 2    | slot 2 always       | film code (pelicula/final), narrative cartelas (`PANT1..PANT10`), `SCREEN_BUF`, `show_pantalla`, `dzx0_standard` |
| 3    | unused              | 16 KB free |
| 4    | unused              | 16 KB free |
| 5    | slot 1 always       | screen (6.75 KB) + bootstrap + libreria/charset/pijama (~8 KB) |
| 6    | slot 3 temporary    | ZX0 blobs: PPANT1..3, 6..8, IMGSOL, IMGJACA, fonts, ES cartelas. Boot decompresses fonts+cartelas to slot 1/2 fixed; the rest stay compressed and decompress on-demand via `show_pantalla` |
| 7    | slot 3 temporary    | ZX0 blobs: PPANT4, PPANT5, PPANT9 (the largest three) |

## How to choose where to put new code/data

- **Always-accessible code that does NOT page slot 3** → bank 5 or bank 2 (fixed slots).
- **Code that does an OUT to page slot 3** → must be in bank 5 or bank 2 (otherwise it self-yanks).
- **Read-only data that can be paged on demand** → bank 3, 4, 6, or 7 (or even bank 1 if it doesn't conflict with the language overlay).
- **Code in a paged bank that needs to call code in another paged bank** → page first, CALL, return, page back. Or move the caller to a fixed slot.

## sjasmplus addresses (`DEVICE ZXSPECTRUM128`)

The `.sym` file emits 32-bit linear addresses. The low 16 bits are the
Z80 address that label has when its `SLOT`/`PAGE` was active during
assembly. A label at `0x00007972` means "0x7972, in whatever bank was
in slot 1 at the time of declaration".

If two labels in the **same bank** end up at overlapping addresses, sjasmplus
generally **does not warn** — it silently overwrites. The only reliable
way to spot overlaps before runtime is the address-ordered map:

```bash
tools/film-memory-map.py --update
```

Regenerates the auto-section of `remakes/128k-plus2-film/MEMORY-MAP.md`
from the latest `film.sym`. Run it after every structural change (new
ORG, new INCBIN, moved buffer, etc.) before considering the change done.

## See also

- [`remakes/128k-plus2-film/MEMORY-MAP.md`](../remakes/128k-plus2-film/MEMORY-MAP.md) — current address-ordered map of the film build.
- [`remakes/128k-plus2-film/ZX0-REPORT.md`](../remakes/128k-plus2-film/ZX0-REPORT.md) — compression report incl. bank distribution rationale.
- [Spectrum +2 / +2A technical reference](https://worldofspectrum.org/faq/reference/128kreference.htm) — World of Spectrum FAQ.
