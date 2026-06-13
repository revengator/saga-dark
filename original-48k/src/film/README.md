# Film — Saga Dark Intro (Saga Film)

Reconstructed source code of the "Saga Film" intro/cutscene — **compiles byte-perfect against `game-sagadark.tap`** (41527/41527 bytes match, data block 0x5DC0–0xFFAF inclusive).

## Architecture: presentation engine

Unlike the game engines (Dark 1/2/3), Film is a **cutscene engine**: pre-recorded scenes with directed animation, custom charset, screen management as a script. Details in [`docs/engine-architecture.md`](../../../docs/engine-architecture.md) §3.

## Structure

```
src/film/
├── game.asm              ← MASTER build file — main of the film
├── charset.asm           ← custom character set
├── libreria.asm          ← auxiliary routines (printing, sound, colour)
├── pelicula.asm          ← the "film" (scenes)
├── pantallas.asm         ← screen definitions
├── jaca.asm              ← horse-ride scene
├── pijama.asm            ← pyjama scene
├── final.asm             ← final film screen
├── build.sh              ← script: source → .bin + .tap
├── game.tap              ← reference compiled binary (build output)
├── game-sagadark.tap     ← authoritative original TAP
├── game-sagadark.map     ← symbol map
└── project.xml           ← original project config
```

## Technical highlight

Uses **Interrupt Mode 2 (IM2)** with a custom vector at `ORG 65021` — allows music/animation to run independently of the main loop. This is the same pattern that will be used in the 128K remake (see [`IDEAS.md`](../../../remakes/_in_progress/128k-plus2-original/IDEAS.md) §7).

**Fix applied during reconstruction:** `DEFS 65021-$,0` was added before `ORG 65021` — sjasmplus did not fill the 71-byte gap with `--raw`, leaving the IM2 routine offset by 71 bytes. With the fix, the rebuilt `film.tap` is byte-perfect against the original.

## Build

```bash
./build.sh                          # produces film.bin + film.tap
```

Produces:
- `original-48k/build/film.bin` — raw 41527 bytes
- `original-48k/build/film.tap` — 117 B loader + code block (loadable in any emulator)

## Byte-perfect verification

`build.sh` automatically compares against `game-sagadark.tap`.

## Run in an emulator

```bash
fuse -m 48 -t original-48k/src/film/game.tap
# or via the wrapper:
tools/run-emulator.sh original-48k/src/film/game.tap
```

## Reference snapshot

`original-48k/snapshots/film/film.z80` — running snapshot of the film for inspection with ZEsarUX.
