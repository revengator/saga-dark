#!/usr/bin/env python3
"""
Sustituye direcciones hex de variables dark1 por sus equivalentes dark2.
Aplica a un fichero .asm fuente. Los labels (VAR0, T0, etc.) se preservan
intactos — solo se cambian literales hex 0xA6XX/0xA7XX/0xA8XX que se
encuentran en el address map.

Uso:
    translate_dark1_to_dark2.py <input.asm> <output.asm>
"""
import sys
import re

# Mapeo dark1 → dark2 (deducido del diff motor + entry points conocidos)
ADDR_MAP = {
    # Variables main (área 0xA60D-0xA665 → +0x95)
    0xA60D: 0xA6A2,   # VAR1
    0xA612: 0xA6A7,   # VAR12 (abuelo_off)
    0xA613: 0xA6A8,   # VAR10 (abuelo counter)
    0xA614: 0xA6A9,   # VAR16
    0xA615: 0xA6AA,   # VAR13 (abuelo state)
    0xA616: 0xA6AB,   # VAR7 (fuerza)
    0xA617: 0xA6AC,   # VARB (power-up counter)
    0xA619: 0xA6AE,   # VAR2
    0xA61F: 0xA6B4,   # VAR25
    0xA633: 0xA6C8,   # VAR0
    0xA652: 0xA6E7,   # T0
    0xA653: 0xA6E8,   # T0+1
    0xA655: 0xA6EA,   # T0+3
    0xA665: 0xA6FA,   # PEDD1
    0xA6E8: 0xA77D,   # TP0 (tabla pasos abuelo)
    # Vars 0xA7XX → +0xBC (área medio main)
    0xA7E3: 0xA89F,   # rutina externa main_tail (PODER2 call)
    0xA7F1: 0xA8AD,   # MUERTE (delta +0xBC)
    # Vars 0xA8XX → +0xB7 (área final main, BICHOS dispatcher)
    0xA820: 0xA8D7,   # NUEVO
    0xA84B: 0xA8F7,   # E1
    0xA84C: 0xA8F8,   # E2
    0xA84D: 0xA8F9,   # E3
    0xA84F: 0xA8FB,   # BICHOS
}

def translate_line(line):
    """Reemplaza direcciones hex en una línea por las equivalentes dark2."""
    def replace(m):
        v = int(m.group(0), 16)
        if v in ADDR_MAP:
            new = ADDR_MAP[v]
            # Preservar formato 0xXXXX
            return f'0x{new:04X}'
        return m.group(0)
    # Solo reemplazar literales hex 0xA6XX, 0xA7XX, 0xA8XX (rango variables)
    line = re.sub(r'\b0x[Aa][6-8][0-9A-Fa-f]{2}\b', replace, line)
    return line

def main():
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)
    src, dst = sys.argv[1], sys.argv[2]
    with open(src) as f:
        text = f.read()
    out_lines = []
    n = 0
    for line in text.splitlines():
        new = translate_line(line)
        if new != line:
            n += 1
        out_lines.append(new)
    with open(dst, 'w') as f:
        f.write('\n'.join(out_lines) + '\n')
    print(f'Líneas modificadas: {n}/{len(text.splitlines())}  →  {dst}')

if __name__ == '__main__':
    main()
