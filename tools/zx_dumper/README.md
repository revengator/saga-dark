# tools/zx_dumper/ — Memory block visualiser for `.sna`

Python utility (imported from the author's `~/github/sagadark` repo —
see [`CONTEXT.md`](../../CONTEXT.md), 2026-04-27 finding) that renders
a memory range from a `.sna` or `.z80` snapshot as an image — useful for
visually identifying sprites, tilesets, screens or tables inside the
binary.

## Usage

```bash
python dumper.py [options] <snapshot.sna>
```

Try with the included reference snapshots:

```bash
python dumper.py sdark1.sna
python dumper.py sdark1.z80
```

`sdark1.sna` and `sdark1.z80` are Dark 1 snapshots that came with the
script — kept as a reference for tests so you don't need to download a
fresh one each time.

## When to use it

- Identify the offset of a sprite within unlabelled data.
- Visualise tilesets to confirm format (8×8, 16×16, planar/interleaved).
- Detect screen blocks (`.scr` embedded) inside the binary.
- Verify that a range really is visual data (not mis-decoded code).

For **code** inspection, use ZEsarUX instead:
`tools/run-emulator.sh --debug <snapshot>`.

## Dependencies

- Python 3.8+
- Pillow (`pip install Pillow`) — for image rendering.
