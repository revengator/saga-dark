#!/usr/bin/env python3
"""Generate an address-ordered memory map of the +2 128K Film build.

Reads `remakes/128k-plus2-film/film.sym` (emitted by sjasmplus on every build
when invoked with `--sym=film.sym`) and prints a table ordered by linear
address, marking gaps so overlaps and free regions are obvious at a glance.

Usage:
    tools/film-memory-map.py                    # print to stdout
    tools/film-memory-map.py --md > section.md  # markdown table
    tools/film-memory-map.py --update           # rewrite the auto-section
                                                # of MEMORY-MAP.md in place

Run after every structural change (added/moved code, new INCBIN, new ORG)
to spot accidental overlaps before they show up as a black-screen reset.

Linear address layout (sjasmplus DEVICE ZXSPECTRUM128 convention):
  0x00000000-0x0000FFFF  whatever is in slots 0..3 at the time of assembly.
                         For the Film: ROM (slot 0), bank 5 (slot 1),
                         bank 2 (slot 2), bank that PAGE'd at slot 3.
  0x00010000+            additional bank stashes — sjasmplus reuses linear
                         addresses past 64 KB for assembled-but-not-active
                         banks.

Filtering: skips labels starting with `.` (sjasmplus locals), `dzx0s_*`
(decoder internals), and constants that don't correspond to memory.
"""

from __future__ import annotations
import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SYM_PATH = ROOT / "remakes/128k-plus2-film/film.sym"
MD_PATH = ROOT / "remakes/128k-plus2-film/MEMORY-MAP.md"

# Section markers in MEMORY-MAP.md for --update mode.
AUTO_BEGIN = "<!-- AUTO-MAP:BEGIN -->"
AUTO_END = "<!-- AUTO-MAP:END -->"

SKIP_PREFIXES = ("dzx0s_", "bank1.", "bank6.")
SKIP_EXACT = {"PORT_7FFD", "PORT_BORDER", "ENTRY", "STACK_BASE",
              "SCREEN", "PILA", "INICIO", "VAR"}

# SP_* are show_pantalla id constants, not memory addresses.
SKIP_RE = re.compile(r"^(SP_|FINCODIGO2?$)")


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
        if any(name.startswith(p) for p in SKIP_PREFIXES):
            continue
        if name in SKIP_EXACT or SKIP_RE.match(name):
            continue
        addr = int(addr_hex, 16)
        # Below 0x4000 = ROM space, irrelevant.
        if addr < 0x4000:
            continue
        rows.append((addr, name))
    rows.sort()
    return rows


def bank_of(addr: int) -> str:
    """Best-effort bank identification from a linear address."""
    if addr < 0x4000:
        return "ROM"
    if addr < 0x8000:
        return "bank 5 (slot 1)"
    if addr < 0xC000:
        return "bank 2 (slot 2)"
    if addr < 0x10000:
        return "bank @ slot 3 (default: bank 0)"
    # Past 64 KB: sjasmplus stashed banks. The Film's main.asm uses bank 6
    # then bank 7 then bank 1 in this order — but their linear offsets
    # depend on assembler internals, so just label them as "bank stash".
    return f"bank stash (linear 0x{addr:08X})"


def render_text(rows: list[tuple[int, str]]) -> str:
    lines: list[str] = []
    prev_addr: int | None = None
    prev_name = ""
    for addr, name in rows:
        gap_note = ""
        if prev_addr is not None and addr - prev_addr > 64:
            gap_note = f"   ⤴ gap +{addr - prev_addr} B"
        lines.append(f"{addr:08X}  {name:<32s}  {bank_of(addr)}{gap_note}")
        prev_addr = addr
        prev_name = name
    return "\n".join(lines)


def render_md(rows: list[tuple[int, str]]) -> str:
    lines = [
        "| Address | Label | Bank/slot | Gap from previous |",
        "|---|---|---|---:|",
    ]
    prev_addr: int | None = None
    for addr, name in rows:
        gap = ""
        if prev_addr is not None:
            delta = addr - prev_addr
            if delta > 64:
                gap = f"+{delta} B"
        lines.append(
            f"| `0x{addr:08X}` | `{name}` | {bank_of(addr)} | {gap} |"
        )
        prev_addr = addr
    return "\n".join(lines)


def render_summary_md(rows: list[tuple[int, str]]) -> str:
    """Group consecutive labels into blocks; show start..end + gaps.
    Two labels separated by < GAP_THRESHOLD bytes belong to the same block;
    a wider gap starts a new block. Each block prints first..last labels
    and its byte size. Gaps print as their own row.
    """
    GAP_THRESHOLD = 256  # B — anything wider is a "free region"
    lines = [
        "| Range | First | Last | Size | Bank/slot |",
        "|---|---|---|---:|---|",
    ]
    if not rows:
        return "\n".join(lines)
    # Build blocks
    blocks: list[tuple[int, int, str, str]] = []  # (start, end_addr, first, last)
    bstart, bfirst = rows[0]
    blast_addr, blast_name = rows[0]
    for addr, name in rows[1:]:
        if addr - blast_addr > GAP_THRESHOLD:
            blocks.append((bstart, blast_addr, bfirst, blast_name))
            bstart, bfirst = addr, name
        blast_addr, blast_name = addr, name
    blocks.append((bstart, blast_addr, bfirst, blast_name))

    for i, (start, end, first, last) in enumerate(blocks):
        # The block size we know is end - start + small (last label's body
        # is unknown). Use end - start as a lower-bound size.
        size = end - start
        size_label = f"{size:5d} B" if size > 0 else "single"
        same = first if first == last else f"{first} .. {last}"
        lines.append(
            f"| `0x{start:08X}-0x{end:08X}` | `{first}` | `{last}` | "
            f"{size_label} | {bank_of(start)} |"
        )
        # Gap to next block
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
    """Replace the auto-managed section of MEMORY-MAP.md."""
    block = (
        f"{AUTO_BEGIN}\n"
        f"_Regenerate with `tools/film-memory-map.py --update` after every "
        f"`build.sh` that changes code/data layout._\n\n"
        f"{table_md}\n"
        f"{AUTO_END}"
    )
    if AUTO_BEGIN in md_text and AUTO_END in md_text:
        pre, _, rest = md_text.partition(AUTO_BEGIN)
        _, _, post = rest.partition(AUTO_END)
        return pre + block + post
    # First time: append at the top, after the H1 line.
    head, sep, tail = md_text.partition("\n")
    return head + sep + "\n" + block + "\n" + tail


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--md", action="store_true",
                    help="Output as a markdown table (full label list).")
    ap.add_argument("--summary", action="store_true",
                    help="Group labels into blocks with gaps (compact MD).")
    ap.add_argument("--update", action="store_true",
                    help="Rewrite MEMORY-MAP.md auto-section in place "
                         "(uses --summary form by default — overlap-friendly).")
    args = ap.parse_args()

    if not SYM_PATH.exists():
        raise SystemExit(
            f"film.sym not found at {SYM_PATH} — run `bash build.sh` first."
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
