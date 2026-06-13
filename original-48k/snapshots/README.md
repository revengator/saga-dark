# Original snapshots — source of truth

`.sna` and `.z80` snapshots of the 4 pieces of the original Saga Dark
game (1989-1990) + associated audio. They are the **authoritative
reference** against which any byte-perfect reconstruction is validated.

## Inventory

```
snapshots/
├── dark1/
│   ├── dark1.sna        ← snapshot 49179 B (Phase 1)
│   ├── dark1.z80        ← same, z80 format
│   ├── dark1.wav        ← original beeper audio
│   └── dark1.mp3        ← idem in mp3
├── dark2/
│   ├── dark2.sna        ← Phase 2 snapshot (Castle in Ruins)
│   ├── dark2.z80
│   ├── dark2.wav
│   └── dark2.mp3
├── dark3/
│   ├── dark3.sna        ← Dragon Phase snapshot
│   ├── dark3.z80
│   ├── dark3.wav
│   └── dark3.mp3
└── film/
    └── film.z80         ← Saga Film snapshot (intro)
```

## How to use

### Test the original directly

```bash
tools/run-emulator.sh original-48k/snapshots/dark1/dark1.sna
tools/run-emulator.sh original-48k/snapshots/dark2/dark2.sna
tools/run-emulator.sh original-48k/snapshots/dark3/dark3.sna
tools/run-emulator.sh original-48k/snapshots/film/film.z80
```

### Byte-perfect build validation

Each phase's `build.sh` automatically compares `build/<phase>.bin` against the corresponding `.sna`:

```bash
original-48k/src/dark1/build.sh   # → 31739/31739 byte-perfect vs dark1.sna
original-48k/src/dark2/build.sh   # → 31739/31739 byte-perfect vs dark2.sna
original-48k/src/dark3/build.sh   # → 25536/25536 byte-perfect vs dark3.sna
```

For manual validation: `tools/validation/compare.py <bin> <sna>`.

## Audio

The `.wav`/`.mp3` files are recordings of the **original beeper** (2009, captured from the original tape). 3 files, ~30 seconds each — no AY music (the original is 48K and only uses the 1-bit speaker). For the 128K remake's music plan, see [`IDEAS.md`](../../remakes/_in_progress/128k-plus2-original/IDEAS.md) §3.

## Do NOT modify

These files are **read-only and immutable**. They are the project's
"gold standard": if any of them changed, we would lose the byte-perfect
reference that allows validating the reconstructions. If you need a
derived snapshot (e.g. with a cheat applied), generate it in
`original-48k/build/` with the phase's `build.sh`, NOT here.

## Origin

Captures made by the author (Miguel Angel Esteve Marco) in 2009 from
the original TRITON SOFTWARE 1989-1990 tape, via a Fuse emulator
loading the actual `.tap`.
