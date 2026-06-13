#!/usr/bin/env python3
"""
Genera líneas DEFB con los bytes del binario en el rango dado.

Uso:
    bytes_to_defb.py <start_hex> <end_hex_exclusive> [--label NOMBRE] [--per-line N]
"""
import sys
import argparse

ap = argparse.ArgumentParser()
ap.add_argument('start')
ap.add_argument('end')
ap.add_argument('--label', default=None)
ap.add_argument('--per-line', type=int, default=16)
ap.add_argument('--sna', default='/Volumes/Almacen/github/saga-dark/original-48k/snapshots/dark1.sna')
args = ap.parse_args()

start = int(args.start, 16)
end = int(args.end, 16)
sna = open(args.sna, 'rb').read()[27:]
data = sna[start - 0x4000 : end - 0x4000]

if args.label:
    print(f'{args.label}:')

for i in range(0, len(data), args.per_line):
    chunk = data[i:i + args.per_line]
    bytes_str = ','.join(f'0x{b:02X}' for b in chunk)
    addr = start + i
    print(f'         DEFB   {bytes_str}    ;0x{addr:04X}')
