# tools/zx0 — ZX0 compressor for the +2 128K builds

Einar Saukas' [ZX0](https://github.com/einar-saukas/ZX0) v2.2 — optimal LZ77
data compressor used by the film build (and future platformer/dragon
builds) to compress static screens, fonts, narrative text, and any other
read-only assets.

## What's in this folder

| File | Source-controlled? | Purpose |
|---|---|---|
| `src/` | ✅ committed | Upstream clone of the ZX0 repo (incl. C source under `src/src/`). |
| `zx0`, `dzx0` | ❌ gitignored | Native binaries built locally per machine. |
| `dzx0_standard.asm` | ✅ committed | Z80 forward decoder (68 B), included by film/main.asm. |
| `dzx0_standard_back.asm` | ✅ committed | Z80 backwards decoder (69 B). Currently unused by the film (B+ pass landed forward-only) — kept for future builds where in-place backwards is unavoidable. |
| `LICENSE-ZX0`, `UPSTREAM-README.md` | ✅ committed | Upstream license + README. |

## Building (first time per machine)

The native binary is gitignored because it's architecture-specific (Intel
x86_64, Apple Silicon arm64, Linux ARM64, …). On first checkout, build it:

```bash
cd tools/zx0/src/src
clang -O2 -o zx0  zx0.c optimize.c compress.c memory.c
clang -O2 -o dzx0 dzx0.c
cp zx0 dzx0 ../../          # → tools/zx0/zx0 + tools/zx0/dzx0
```

Verify:

```bash
tools/zx0/zx0   # prints "ZX0 v2.2: Optimal data compressor by Einar Saukas"
```

The upstream `Makefile` targets Windows (Open Watcom). The four-line clang
recipe above is enough on macOS / Linux.

## Using

Forward compression (default):

```bash
tools/zx0/zx0 -f input.bin output.zx0
```

Backwards compression (for in-place layouts where blob and destination
share memory):

```bash
tools/zx0/zx0 -f -b input.bin output.zx0b
```

Decompression (debug):

```bash
tools/zx0/dzx0 input.zx0 output.bin
```

## Z80 decoder

Include `dzx0_standard.asm` from your build:

```asm
        INCLUDE "tools/zx0/dzx0_standard.asm"
        ...
        ld hl, blob          ; compressed source
        ld de, dest           ; destination
        call dzx0_standard
```
