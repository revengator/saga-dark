#!/usr/bin/env python3
"""platformer-memory-map.py — symbol-derived section anchors + free holes for the
+2 128K unified platformer build, to help refresh
remakes/128k-plus2-platformer/MEMORY-MAP.md after a layout change.

It assembles main.asm with --sym to a temp file and prints an address-ordered
table of the section-boundary labels plus the computed stack-safe free holes.
It does NOT rewrite MEMORY-MAP.md (the prose/bank tables are hand-maintained) —
it just gives you the current numbers to paste in.

Usage:
    tools/platformer-memory-map.py            # build + report
    tools/platformer-memory-map.py --sym F    # report from an existing .sym
"""
import os, re, subprocess, sys, tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PLAT = os.path.join(ROOT, "remakes/128k-plus2-platformer")

# (label, description) in the order they should appear; sorted by address on output.
ANCHORS = [
    ("boot_start",          "bank5 0x5B00 boot + transition_routine"),
    ("intermediate_screen", "inter-level screen"),
    ("print_str",           "string printer"),
    ("BOOT_AREA_END",       "boot area end (pin 0x5C00)"),
    ("PANTAL",              "engine: mapper"),
    ("MUP",                 "engine: colas"),
    ("SOUND2",              "engine: abuelo"),
    ("AAAAAA",              "engine: hres-printing"),
    ("COMPR",               "engine: player"),
    ("DAT2",                "  spear state"),
    ("PODER1",              "engine: powers"),
    ("SALIR",               "engine: collisions"),
    ("PALO_IMPL",           "  PALO body (must stay put)"),
    ("RCPE",                "  RCPE"),
    ("STAR",                "canonical hook-mode loop"),
    ("msg1",                "inter-level strings"),
    ("hit_beep",            "hit-sfx: beep + latch (loop-hole pad)"),
    ("VAR0",                "state block (data.asm)"),
    ("T0",                  "  T0"),
    ("SONI1_LP",            "beeper core (Phase 1)"),
    ("palo_tramp",          "hit-sfx: PALO trampoline (code-end pad)"),
    ("PLATFORMER_CODE_END", "== code end (pin 0xAAA1)"),
    ("current_7ffd",        "music region (master_im2)"),
    ("master_im2",          "  IM2 handler"),
    ("MUSIC_HELPERS_END",   "  music helpers end"),
]


def load_sym(path):
    d = {}
    for line in open(path):
        m = re.match(r"(\S+):\s*EQU\s*0x0*([0-9A-Fa-f]+)", line)
        if m:
            d[m.group(1)] = int(m.group(2), 16)
    return d


def main():
    if "--sym" in sys.argv:
        sym = sys.argv[sys.argv.index("--sym") + 1]
    else:
        fd, sym = tempfile.mkstemp(suffix=".sym")
        os.close(fd)
        r = subprocess.run(
            ["sjasmplus", "-DUNIFIED_HOOKS=1", "-DUNIFIED_PLATFORMER=1",
             "--sym=" + sym, "main.asm"],
            cwd=PLAT, capture_output=True, text=True)
        # main.asm writes a .sna into PLAT; clean it up.
        for f in ("saga-platformer-128k.sna", "saga-platformer-128k-cheat.sna"):
            p = os.path.join(PLAT, f)
            if os.path.exists(p):
                os.remove(p)
        if r.returncode != 0:
            sys.stderr.write(r.stdout + r.stderr)
            sys.exit("assembly failed")

    s = load_sym(sym)
    print(f"{'addr':>6}  {'label':<22} section")
    for addr, name, desc in sorted((s[n], n, d) for n, d in ANCHORS if n in s):
        print(f"0x{addr:04X}  {name:<22} {desc}")

    print("\nStack-safe free holes (slot 1/2):")
    if "msg1" in s:
        # loop-hole pad runs from end of the last loop-hole item to the state block 0xA6A1.
        end = max(v for k, v in s.items() if 0xA60C <= v < 0xA6A1) if any(
            0xA60C <= v < 0xA6A1 for v in s.values()) else s["msg1"]
        # better: use hit_latch end if present, else msg3+len; just report vs 0xA6A1
        ref = s.get("hit_latch", s.get("msg1"))
        print(f"  loop-hole pad : ~0x{ref:04X}+ .. 0xA6A1  (state block at 0xA6A1)")
    print(f"  code-end pad  : 0x{s['PLATFORMER_CODE_END']:04X} .. 0xAAA1 = "
          f"{0xAAA1 - s['PLATFORMER_CODE_END']} B")
    print(f"  boot slack    : 0x{s['BOOT_AREA_END']:04X} .. 0x5C00 = "
          f"{0x5C00 - s['BOOT_AREA_END']} B")
    print("  (0xAE76-0xAF90 = Phase 1 stack/scratch — NOT usable for code)")


if __name__ == "__main__":
    main()
