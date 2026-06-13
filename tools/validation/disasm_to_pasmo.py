#!/usr/bin/env python3
"""
Convierte un rango del disasm z80dasm a sintaxis Pasmo/sjasmplus uppercase.
Permite proporcionar un mapa de etiquetas humanas para reemplazar las
auto-generadas (l6aa2h, sub_6ab7h, etc.).

Uso:
    disasm_to_pasmo.py <disasm.asm> <start_hex> <end_hex> [labels.json]
"""
import sys
import re
import json
import argparse


def parse_disasm(path, start, end):
    """Parse z80dasm output. Devuelve lista de (addr, raw_line, label_at_this_addr)."""
    with open(path) as f:
        lines = f.readlines()
    out = []
    pending_label = None
    for raw in lines:
        line = raw.rstrip()
        # Label sin dirección (p.ej. "l6aa2h:")
        m = re.match(r'^((?:l|sub_)[0-9a-f]+h)\s*:\s*$', line)
        if m:
            pending_label = m.group(1)
            continue
        # Línea con instrucción y address comment
        m = re.search(r';([0-9a-f]{4})\s*$', line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        if addr < start or addr > end:
            if addr > end and out:
                break
            # Resetear pending_label si nos saltamos esta línea — evita
            # arrastrar labels de regiones previas (causaba duplicados al
            # disassemblear varios módulos consecutivos).
            pending_label = None
            continue
        # Extraer instrucción (parte antes del ;)
        instr_part = re.split(r'\s*;[0-9a-f]{4}\s*$', line)[0].rstrip()
        instr_part = instr_part.lstrip('\t').lstrip(' ')
        out.append({'addr': addr, 'instr': instr_part, 'label': pending_label})
        pending_label = None
    return out


def normalize_instruction(instr, label_map):
    """Reemplaza addresses absolutos por etiquetas humanas si aplica."""
    # Reemplazar etiquetas auto-generadas: l6aa2h → PANTAL si está mapeado.
    # Si no hay mapeo, devuelve la auto-label en MAYÚSCULAS para coincidir
    # con la convención sjasmplus (case-sensitive) de defines/EQU.
    def replace_label(m):
        auto = m.group(0)
        return label_map.get(auto, auto.upper())
    instr = re.sub(r'(?:l|sub_)[0-9a-f]+h', replace_label, instr)
    # Convertir números hex del z80dasm: "03fh" → "0x3F"
    instr = re.sub(r'\b0([0-9a-f]+)h\b', lambda m: f'0x{m.group(1).upper()}', instr)
    instr = re.sub(r'\b([0-9])h\b', lambda m: f'0x{m.group(1).upper()}', instr, flags=re.IGNORECASE)
    # No quiero cambiar comentarios — solo la parte de instrucción
    return instr


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('disasm')
    ap.add_argument('start', help='Dirección inicio hex (ej: 0x6A9B)')
    ap.add_argument('end', help='Dirección fin hex inclusive (ej: 0x6DAB)')
    ap.add_argument('--labels', help='JSON con mapa "l6aa2h": "PANTAL"')
    args = ap.parse_args()

    start = int(args.start, 16)
    end = int(args.end, 16)
    label_map = {}
    if args.labels:
        with open(args.labels) as f:
            label_map = json.load(f)

    items = parse_disasm(args.disasm, start, end)

    for item in items:
        addr = item['addr']
        instr = normalize_instruction(item['instr'], label_map)
        # Convertir a uppercase los mnemónicos pero respetando operandos
        # Simple: split por primera espacio, uppercase la primera parte
        parts = instr.split(None, 1)
        if parts:
            mnem = parts[0].upper()
            rest = ' ' + parts[1] if len(parts) > 1 else ''
            instr = f'{mnem}{rest}'

        # Etiqueta visible
        label_str = ''
        if item['label']:
            label_str = label_map.get(item['label'], item['label'].upper())
            print(f'{label_str}:')

        # Indentar instrucción
        print(f'         {instr}    ;{addr:04X}')


if __name__ == '__main__':
    main()
