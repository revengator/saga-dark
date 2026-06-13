#!/usr/bin/env python3
"""
Para cada módulo del scan, intenta inferir el rango de direcciones encontrando
las CALL/JP instructions en el disasm que apuntan a labels del scan.

Output: para cada módulo, lista (label, dirección_inferida).
"""
import re
import sys
import os
from collections import defaultdict

ROOT = '/Volumes/Almacen/github/saga-dark/original-48k'
DISASM = f'{ROOT}/disasm/dark1_raw.asm'
SCAN_DIR = f'{ROOT}/src/dark1/_scan'

# Cargar disasm: lista de (addr, instruction)
def load_disasm():
    """Devuelve dict addr→linea, y dict addr→{labels en esa dirección}."""
    addr_to_line = {}
    with open(DISASM) as f:
        for raw in f:
            m = re.search(r';([0-9a-f]{4})\s*$', raw)
            if m:
                addr = int(m.group(1), 16)
                addr_to_line[addr] = raw.rstrip()
    return addr_to_line


def labels_in_scan(path):
    """Devuelve lista de (lineno, label) en el scan."""
    out = []
    with open(path) as f:
        for ln, raw in enumerate(f, 1):
            # Label en columna 1: identificador seguido de espacio y opcode/EQU
            m = re.match(r'^([A-Z][A-Z0-9_]+)\s+(\S)', raw)
            if m and m.group(2) != ';':
                lbl = m.group(1)
                # Excluir pseudo-ops como DEFB
                if lbl in ('DEFB', 'DEFW', 'DEFM', 'EQU', 'ORG', 'INCLUDE'):
                    continue
                out.append((ln, lbl))
    return out


def main():
    addr_to_line = load_disasm()
    modules = ['mapper', 'colas', 'abuelo', 'hres-printing',
               'player', 'powers', 'collisions']
    print(f"{'Modulo':<18}{'Labels':>8}{'Primera líneas':>30}")
    print('-'*70)
    for mod in modules:
        path = f'{SCAN_DIR}/{mod}.asm'
        if not os.path.exists(path):
            print(f'{mod}: NO ENCONTRADO')
            continue
        labels = labels_in_scan(path)
        # Primeros 5 labels
        first_5 = ', '.join(l for _, l in labels[:5])
        print(f'{mod:<18}{len(labels):>8}    {first_5}')


if __name__ == '__main__':
    main()
