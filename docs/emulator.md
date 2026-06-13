# ZX Spectrum Emulator

Recommended for the project:

- **Fuse / FuseX** (GPL-2) — main emulator, fast and lightweight. Supports 48K and +2 128K.
- **ZEsarUX** (GPL-3) — advanced debugger (conditional breakpoints, reverse-debug, hex editor, watches). For debugging the remake.

Both are open-source and available in Homebrew.

## Installation

### macOS (recommended)

```bash
# Main emulator — Fuse (FuseX.app)
brew install --cask fredm-fuse

# Advanced debugger — ZEsarUX
brew install --cask zesarux
```

> **Note:** the `zesarux` cask is marked as deprecated by Gatekeeper and will be disabled in September 2026. Manual fallback:
>
> ```bash
> # Download the corresponding .dmg from:
> # https://github.com/chernandezba/zesarux/releases/latest
> ```

The `fredm-fuse` cask installs FuseX.app v1.7.1+ (fork maintained by speccytools, GPL-2).

### Linux (Debian / Ubuntu)

```bash
sudo apt install fuse-emulator-gtk spectrum-roms
# ZEsarUX from source:
git clone https://github.com/chernandezba/zesarux.git
cd zesarux/src && ./configure && make && sudo make install
```

### Windows

- Fuse: download a binary from https://fuse-emulator.sourceforge.net/
- ZEsarUX: download from https://github.com/chernandezba/zesarux/releases

## CLI usage

### Original 48K snapshots

```bash
fuse -m 48 -s original-48k/snapshots/dark1/dark1.sna
fuse -m 48 -s original-48k/snapshots/dark2/dark2.sna
fuse -m 48 -s original-48k/snapshots/dark3/dark3.sna
fuse -m 48 -t original-48k/src/film/game.tap
```

### Compiled builds

```bash
# After running `original-48k/src/dark1/build.sh`
fuse -m 48 -s original-48k/build/dark1.sna

# Cheat version (INFINITE_ENERGY)
fuse -m 48 -s original-48k/build/dark1_cheat.sna
```

### +2 128K remake builds

```bash
fuse -m plus2 -t remakes/_in_progress/128k-plus2-original/build/dark.tap
fuse -m plus2 -s remakes/_in_progress/128k-plus2-original/build/dark.sna
```

### Debug with ZEsarUX

```bash
zesarux --machine 48k --snap original-48k/snapshots/dark1/dark1.sna

# With a conditional breakpoint at the main game loop
zesarux --machine 48k \
        --enable-breakpoints \
        --set-breakpointaction 1 "PC=0xAAEE" \
        original-48k/snapshots/dark1/dark1.sna
```

## macOS shortcut — CLI binary inside FuseX.app

The Fuse cask on macOS installs a `.app`; the CLI binary lives inside:

```bash
# Add to ~/.zshrc or ~/.bashrc:
alias fuse="/Applications/FuseX.app/Contents/MacOS/Fuse"
```

Alternative without alias:

```bash
open -a FuseX original-48k/build/dark1.sna
```

## Useful in-emulator shortcuts

| Key | Action (Fuse) |
|---|---|
| F1 | Main menu |
| F2 | Save snapshot |
| F3 | Open file |
| F5 | Pause |
| F10 | Reset |
| F11 | NMI (ROM debugger) |

ZEsarUX opens its debugger window with `F5` and supports breakpoints, watches, step, hex editor, etc.

## Quick wrapper

`tools/run-emulator.sh` detects the machine from the file path (48K
if it comes from `snapshots/dark{1,2,3}` or `original-48k/build/`, +2 if
it comes from `remakes/_in_progress/128k-plus2-original/`) and chooses the emulator
automatically:

```bash
tools/run-emulator.sh original-48k/build/dark1.sna
tools/run-emulator.sh remakes/_in_progress/128k-plus2-original/build/dark.tap
tools/run-emulator.sh --debug original-48k/snapshots/dark2/dark2.sna
```
