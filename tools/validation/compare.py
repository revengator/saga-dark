#!/usr/bin/env python3
"""
Compara un binario compilado contra un .sna en una dirección dada.

Uso:
    compare.py <bin> <sna> <ram_addr_hex> [--max-diff N]

El bin compilado se asume que comienza en ram_addr_hex.
Imprime un resumen y las primeras N diferencias con direcciones.
"""
import sys
import argparse


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('binary')
    ap.add_argument('sna')
    ap.add_argument('addr', help='Dirección hex de RAM donde empieza el binario, ej. 0x7E25')
    ap.add_argument('--max-diff', type=int, default=20)
    ap.add_argument('--known-stub', action='append', default=[],
                    help='Direcciones (offset relativo al bin, hex) donde se esperan stubs '
                         'externos. Estas posiciones se ignoran. Formato: "0xNN-0xMM" o "0xNN".')
    args = ap.parse_args()

    bin_data = open(args.binary, 'rb').read()
    sna_data = open(args.sna, 'rb').read()

    if len(sna_data) != 27 + 49152:
        print(f"⚠️  .sna tamaño inesperado: {len(sna_data)} bytes (esperado 49179)")

    addr = int(args.addr, 16)
    sna_offset = 27 + (addr - 0x4000)
    sna_slice = sna_data[sna_offset:sna_offset + len(bin_data)]

    if len(sna_slice) < len(bin_data):
        print(f"⚠️  .sna no tiene suficientes bytes desde {hex(addr)}")
        return 2

    diffs = []
    for i, (a, b) in enumerate(zip(bin_data, sna_slice)):
        if a != b:
            diffs.append((i, a, b))

    matches = len(bin_data) - len(diffs)
    pct = 100.0 * matches / len(bin_data) if bin_data else 0.0
    print(f"Comparación: {len(bin_data)} bytes en {hex(addr)}")
    print(f"  Coincidencias: {matches}/{len(bin_data)} ({pct:.1f}%)")
    print(f"  Diferencias:   {len(diffs)}")

    if diffs:
        print(f"\nPrimeras {min(args.max_diff, len(diffs))} diferencias:")
        print(f"{'addr':>8}  {'rel':>6}  {'esp':>3}  {'got':>3}  contexto")
        for i, a, b in diffs[:args.max_diff]:
            rel = i
            absaddr = addr + i
            ctx_start = max(0, i - 2)
            ctx_end = min(len(bin_data), i + 3)
            ctx_got = ' '.join(f'{x:02x}' for x in bin_data[ctx_start:ctx_end])
            ctx_exp = ' '.join(f'{x:02x}' for x in sna_slice[ctx_start:ctx_end])
            print(f"  {hex(absaddr):>8}  {rel:>6}  {b:02x}   {a:02x}   "
                  f"got=[{ctx_got}] exp=[{ctx_exp}]")
    return 0 if not diffs else 1


if __name__ == '__main__':
    sys.exit(main())
