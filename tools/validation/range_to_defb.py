#!/usr/bin/env python3
"""
Convierte un rango de un .asm a DEFB preservando todos los labels declarados
dentro de ese rango. Lee los bytes desde el binario .sna y genera líneas
DEFB que mantienen los labels en sus direcciones exactas.

Uso:
    range_to_defb.py <asm_file> <start_hex> <end_hex>

Modifica el .asm in-place.
"""
import sys
import re
import argparse

ap = argparse.ArgumentParser()
ap.add_argument('asm_file')
ap.add_argument('start')
ap.add_argument('end')
ap.add_argument('--sna', default='/Volumes/Almacen/github/saga-dark/original-48k/snapshots/dark1.sna')
args = ap.parse_args()

start = int(args.start, 16)
end = int(args.end, 16)

# Leer bytes del binario
sna = open(args.sna, 'rb').read()[27:]
data = sna[start - 0x4000 : end - 0x4000]

# Leer .asm y extraer labels en el rango
with open(args.asm_file) as f:
    lines = f.readlines()

# Identificar líneas dentro del rango y los labels
# Cada línea tiene formato: "LABEL:\n" o "         INSTR    ;XXXX\n"
range_start_line = None
range_end_line = None
labels_in_range = {}   # addr → label_name

current_addr = None
i = 0
while i < len(lines):
    line = lines[i]
    # Buscar dirección
    m = re.search(r';0?x?([0-9A-Fa-f]{4})\s*$', line.rstrip())
    if m:
        addr = int(m.group(1), 16)
        if start <= addr < end:
            if range_start_line is None:
                range_start_line = i
                # Buscar labels antes de esta línea (sin dirección)
                j = i - 1
                while j >= 0 and re.match(r'^[A-Z_][A-Z0-9_]*:\s*$', lines[j]):
                    label = lines[j].strip().rstrip(':')
                    labels_in_range[addr] = label
                    j -= 1
                    range_start_line = j + 1  # incluir labels en el rango
            range_end_line = i
            current_addr = addr
        elif addr >= end and range_end_line is not None:
            break
    elif current_addr is not None and start <= current_addr < end:
        # Línea sin dirección: posible label
        m_label = re.match(r'^([A-Z_][A-Z0-9_]*):\s*$', line.rstrip())
        if m_label:
            # Este label aplica a la SIGUIENTE línea con dirección
            # Buscar siguiente línea con dirección
            for k in range(i + 1, len(lines)):
                next_m = re.search(r';0?x?([0-9A-Fa-f]{4})\s*$', lines[k].rstrip())
                if next_m:
                    next_addr = int(next_m.group(1), 16)
                    labels_in_range[next_addr] = m_label.group(1)
                    break
    i += 1

if range_start_line is None:
    print(f'No hay líneas en rango {hex(start)}-{hex(end)}')
    sys.exit(1)

# Generar nuevo contenido con DEFB
new_lines = []
addr = start
PER_LINE = 16
buffer_bytes = []
buffer_addr = addr

def flush():
    if buffer_bytes:
        bs = ','.join(f'0x{b:02X}' for b in buffer_bytes)
        new_lines.append(f'         DEFB   {bs}    ;0x{buffer_addr:04X}\n')

while addr < end:
    if addr in labels_in_range:
        flush()
        buffer_bytes = []
        buffer_addr = addr
        new_lines.append(f'{labels_in_range[addr]}:\n')

    buffer_bytes.append(data[addr - start])
    addr += 1

    if len(buffer_bytes) >= PER_LINE:
        flush()
        buffer_bytes = []
        buffer_addr = addr

flush()

# Reconstruir el archivo
new_content = ''.join(lines[:range_start_line]) + ''.join(new_lines) + ''.join(lines[range_end_line + 1:])

with open(args.asm_file, 'w') as f:
    f.write(new_content)

print(f'Convertido rango {hex(start)}-{hex(end)} a DEFB. Labels preservados: {len(labels_in_range)}')
