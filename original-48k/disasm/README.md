# Raw disassemblies — byte-by-byte authoritative

Disassemblies generated with `z80dasm` directly from the original
snapshots. **They are the source of truth for the bytes that the
emulated hardware actually runs.**

## Files

| File | Source | Use |
|---|---|---|
| `dark1_raw.asm` | `snapshots/dark1/dark1.sna` | Verify engine + Phase 1 bytes |
| `dark2_raw.asm` | `snapshots/dark2/dark2.sna` | Verify Phase 2 bytes (same engine, different data) |
| `dark3_raw.asm` | `snapshots/dark3/dark3.sna` | Verify Dragon Phase bytes |
| `film_raw_low.asm` | `game-sagadark.tap` (low part) | Verify Saga Film bytes, first range |
| `film_raw_high.asm` | `game-sagadark.tap` (high part + IM2) | Verify Film bytes, second range (includes IM2 vector) |

## When to consult these files

When something in the clean `.asm` of `original-48k/src/dark{1,2,3}/` or `src/film/` is not clear:

1. **First** consult `original-48k/ocr/dark{1,2,3} ocr/<module>.asm` — it has the **human names** of the author (PANTAL, BUJA, COLAS, MUP, MDOWN, BICHOS, MUERTE…).
2. **Then** this raw disassembly — to verify **what the actual bytes do** byte-by-byte. Labels are auto-generated (`LXXXXH`, `SUB_XXXXH`) — do not use them as names in the clean source.
3. **Finally** `original-48k/scan/dark{1,2,3} scan/*.pdf` — visual reference of the paper listing.

See [`CONTEXT.md`](../../CONTEXT.md) §"Source consultation rules" for the full rule.

## How they are regenerated

```bash
z80dasm -t -a -l snapshots/dark1/dark1.sna > disasm/dark1_raw.asm
```

(Exact options may vary depending on each snapshot's ORG range — `dark1` is 0x6A9B, `dark3` is 0x9C40, etc.)

## Do NOT modify these files

The raw disassemblies are **read-only**: the only legitimate way to change them is by regenerating from a different `.sna`. If labels need to be renamed or comments added, do it in the clean `.asm` of `src/<phase>/`, NOT here.
