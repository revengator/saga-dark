#!/usr/bin/env python3
"""
Extrae los bytes "tail" de cada módulo enemy: los bytes entre el final del
compile actual y el inicio del siguiente módulo en dark1.sna. Estos son
los DEFB truncados al final del scan + alineamiento.

Para cada módulo:
  1. Compila con sjasmplus + wrapper actual
  2. Calcula tamaño compilado
  3. Calcula tamaño esperado (= siguiente_entry - este_entry)
  4. Extrae los bytes faltantes desde dark1.sna
  5. Guarda como build/<módulo>_tail.bin

Uso:
    python3 extract_tails.py
"""
import os
import subprocess
import sys

# Mapa: (módulo, módulo_start, next_módulo_start)
# módulo_start incluye variables que están ANTES del entry point oficial
# (ej: DEREB antes de SPEDY, NEXP/DIEXP/EXP antes de EXPO, etc.)
ENEMY_MAP = [
    # (modulo, start, next_start)
    ("piranha",        0x7E25, 0x8603),  # entry PEZ = 0x7E25
    ("gaseodoptero",   0x8603, 0x89B2),  # entry GASEO = 0x8603
    ("viscosa",        0x89B2, 0x970E),  # entry VISCO = 0x89B2
    ("chicle",         0x970E, 0x9FD6),  # entry CHICLE = 0x970E
    ("stone-blocks",   0x9FD6, 0xA2A8),  # entry PIEDRA = 0x9FD6
    ("speedy",         0xA2A8, 0xA356),  # DEREB en 0xA2A8, entry SPEDY = 0xA2A9
    ("dragons",        0xA356, 0xA421),  # SUBI10/SUBIR9 en 0xA356, entry DRAGON = 0xA358
    ("explosion",      0xA421, 0xA4B0),  # NEXP/DIEXP/EXP en 0xA421, entry EXPO = 0xA425
    ("final-boss",     0xA4B0, 0xA60C),  # POSDAT/VARMAL/VMALO en 0xA4B0, entry NINJA = 0xA4B4
]

ROOT = "/Volumes/Almacen/github/saga-dark"
BUILD = f"{ROOT}/build"
SNA = f"{ROOT}/original-48k/snapshots/dark1.sna"


def main():
    sna = open(SNA, 'rb').read()
    ram = sna[27:]   # 49152 bytes desde 0x4000

    print(f"{'módulo':<16} {'entry':>6} {'next':>6} {'expected':>8} {'compiled':>8} {'tail':>6}")
    print("-" * 60)

    for mod, entry, next_entry in ENEMY_MAP:
        expected = next_entry - entry
        bin_path = f"{BUILD}/{mod}_test.bin"
        if not os.path.exists(bin_path):
            print(f"{mod:<16} {entry:>#06x} {next_entry:>#06x} {expected:>8} -- (sin .bin) --")
            continue

        compiled_size = os.path.getsize(bin_path)
        tail_size = expected - compiled_size

        if tail_size < 0:
            print(f"{mod:<16} {entry:>#06x} {next_entry:>#06x} {expected:>8} {compiled_size:>8} ⚠️ EXCEDE en {-tail_size}B")
            continue
        if tail_size == 0:
            print(f"{mod:<16} {entry:>#06x} {next_entry:>#06x} {expected:>8} {compiled_size:>8} ✅ exacto")
            continue

        # Extraer tail bytes desde el final del compile hasta next_entry
        # El compile produce bytes de [entry, entry + compiled_size)
        # El tail va de [entry + compiled_size, next_entry)
        tail_start = entry + compiled_size
        tail_end = next_entry
        offset_start = tail_start - 0x4000
        offset_end = tail_end - 0x4000
        tail = ram[offset_start:offset_end]

        out_path = f"{BUILD}/{mod}_tail.bin"
        with open(out_path, 'wb') as f:
            f.write(tail)
        print(f"{mod:<16} {entry:>#06x} {next_entry:>#06x} {expected:>8} {compiled_size:>8} {tail_size:>6}")


if __name__ == '__main__':
    main()
