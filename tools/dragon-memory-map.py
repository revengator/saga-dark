#!/usr/bin/env python3
"""Generate an address-ordered memory map of the +2 128K Dragon build.

Reads `remakes/128k-plus2-dragon/dragon.sym` (emitted
by sjasmplus on every build when invoked with `--sym=dragon.sym`) and prints
a table ordered by linear address.

Dragon-specific quirks vs the film tool:
  - dragon.asm is byte-for-byte the disassembled Dark 3 code, so the bulk of
    its labels look like `LXXXXh` (auto-generated). Those add noise and are
    skipped — we only surface the human labels we care about (INICIO, INICI2,
    CARGADOR, MUERTE, …) plus the structural anchors from main.asm
    (boot_start, ENTRY EQU, PILA EQU).
  - Banks 1, 3, 4, 6, 7 are entirely free in the current dragon build — they
    are listed in the manual section of MEMORY-MAP.md, not in the auto-section.

Usage:
    tools/dragon-memory-map.py                # print to stdout (summary form)
    tools/dragon-memory-map.py --md           # full markdown table
    tools/dragon-memory-map.py --update       # rewrite MEMORY-MAP.md auto-section
"""

from __future__ import annotations
import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DRAGON_DIR = ROOT / "remakes/128k-plus2-dragon"
SYM_PATH = DRAGON_DIR / "dragon.sym"
MD_PATH = DRAGON_DIR / "MEMORY-MAP.md"

AUTO_BEGIN = "<!-- AUTO-MAP:BEGIN -->"
AUTO_END = "<!-- AUTO-MAP:END -->"

# Drop sjasmplus-internal locals (.dot prefix) and pure constants/EQUs that
# don't correspond to a memory location.
SKIP_EXACT = {
    "PORT_7FFD", "PORT_BORDER",
    # Aliases handled separately in the manual section
}

# Auto-generated labels from the disassembler — Lxxxxh, SUB_xxxxh — are noise.
SKIP_RE = re.compile(r"^(L[0-9A-Fa-f]{4}H|SUB_[0-9A-Fa-f]{4}H)$")


def parse_sym(text: str) -> list[tuple[int, str]]:
    rows: list[tuple[int, str]] = []
    for line in text.splitlines():
        line = line.strip()
        if not line or "EQU" not in line:
            continue
        m = re.match(r"^([A-Za-z_][\w.]*): EQU 0x([0-9A-Fa-f]+)\s*$", line)
        if not m:
            continue
        name, addr_hex = m.group(1), m.group(2)
        if name.startswith("."):
            continue
        if name in SKIP_EXACT or SKIP_RE.match(name):
            continue
        addr = int(addr_hex, 16)
        if addr < 0x4000:
            continue
        rows.append((addr, name))
    rows.sort()
    return rows


def bank_of(addr: int) -> str:
    if addr < 0x4000:
        return "ROM"
    if addr < 0x8000:
        return "bank 5 (slot 1)"
    if addr < 0xC000:
        return "bank 2 (slot 2)"
    if addr < 0x10000:
        return "bank 0 (slot 3 default)"
    return f"bank stash (linear 0x{addr:08X})"


def render_text(rows: list[tuple[int, str]]) -> str:
    lines: list[str] = []
    prev_addr: int | None = None
    for addr, name in rows:
        gap = ""
        if prev_addr is not None and addr - prev_addr > 64:
            gap = f"   gap +{addr - prev_addr} B"
        lines.append(f"{addr:08X}  {name:<28s}  {bank_of(addr)}{gap}")
        prev_addr = addr
    return "\n".join(lines)


def render_md(rows: list[tuple[int, str]]) -> str:
    lines = ["| Address | Label | Bank/slot |", "|---|---|---|"]
    for addr, name in rows:
        lines.append(f"| `0x{addr:08X}` | `{name}` | {bank_of(addr)} |")
    return "\n".join(lines)


def render_summary_md(rows: list[tuple[int, str]]) -> str:
    """Group consecutive labels into blocks; show start..end + gaps wider
    than GAP_THRESHOLD as their own rows. Symmetric with the film tool."""
    GAP_THRESHOLD = 256
    lines = [
        "| Range | First | Last | Size | Bank/slot |",
        "|---|---|---|---:|---|",
    ]
    if not rows:
        return "\n".join(lines)
    bstart, bfirst = rows[0]
    blast_addr, blast_name = rows[0]
    blocks: list[tuple[int, int, str, str]] = []
    for addr, name in rows[1:]:
        if addr - blast_addr > GAP_THRESHOLD:
            blocks.append((bstart, blast_addr, bfirst, blast_name))
            bstart, bfirst = addr, name
        blast_addr, blast_name = addr, name
    blocks.append((bstart, blast_addr, bfirst, blast_name))

    for i, (start, end, first, last) in enumerate(blocks):
        size = end - start
        size_label = f"{size:5d} B" if size > 0 else "single"
        lines.append(
            f"| `0x{start:08X}-0x{end:08X}` | `{first}` | `{last}` | "
            f"{size_label} | {bank_of(start)} |"
        )
        if i + 1 < len(blocks):
            next_start = blocks[i + 1][0]
            gap_bytes = next_start - end
            if gap_bytes > GAP_THRESHOLD:
                lines.append(
                    f"| `0x{end:08X}-0x{next_start:08X}` | _gap_ | _gap_ | "
                    f"**{gap_bytes:5d} B free** | — |"
                )
    return "\n".join(lines)


def update_md(md_text: str, table_md: str) -> str:
    block = (
        f"{AUTO_BEGIN}\n"
        f"_Regenerate with `tools/dragon-memory-map.py --update` after every "
        f"`build.sh` that changes code/data layout._\n\n"
        f"{table_md}\n"
        f"{AUTO_END}"
    )
    if AUTO_BEGIN in md_text and AUTO_END in md_text:
        pre, _, rest = md_text.partition(AUTO_BEGIN)
        _, _, post = rest.partition(AUTO_END)
        return pre + block + post
    head, sep, tail = md_text.partition("\n")
    return head + sep + "\n" + block + "\n" + tail


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--md", action="store_true")
    ap.add_argument("--summary", action="store_true")
    ap.add_argument("--update", action="store_true")
    args = ap.parse_args()

    if not SYM_PATH.exists():
        raise SystemExit(
            f"dragon.sym not found at {SYM_PATH} — run `bash build.sh` first."
        )

    rows = parse_sym(SYM_PATH.read_text())

    if args.update:
        table = render_summary_md(rows)
        new_md = update_md(MD_PATH.read_text(), table)
        MD_PATH.write_text(new_md)
        print(f"Updated {MD_PATH} (summary form, {len(rows)} symbols).")
    elif args.summary:
        print(render_summary_md(rows))
    elif args.md:
        print(render_md(rows))
    else:
        print(render_text(rows))


if __name__ == "__main__":
    main()
