#!/usr/bin/env python3
"""
Preprocesador Pasmo → pyz80.

Convierte sintaxis Pasmo de los .asm de saga-dark a sintaxis pyz80:
- Añade `:` después de etiquetas en columna 1.
- Reemplaza `#F MODULE` por `INCLUDE "module.asm"` según un mapeo.
- Las directivas `#D+`, `#C-`, `#L+` se quedan como comentarios (pyz80 trata `#` como comentario).
- Avisa de líneas DEFB truncadas (terminadas en coma).

Uso:
    python3 preprocess.py <input.asm> <output.asm> [module_map_json]
"""
import sys
import os
import re
import json

# Mapa por defecto Pasmo→archivo
DEFAULT_MAP = {
    "CPANT":     "mapper.asm",
    "COLAS":     "colas.asm",
    "ABUELO":    "abuelo.asm",
    "IMPRESION": "hres-printing.asm",
    "PERSO":     "player.asm",
    "PODERES":   "powers.asm",
    "CHOQUES":   "collisions.asm",
    "PIRANA":    "piranha.asm",
    "GASEO":     "gaseodoptero.asm",
    "VISCOSA":   "viscosa.asm",
    "CHICLE":    "chicle.asm",
    "PIEDRA":    "stone-blocks.asm",
    "SPEDY":     "speedy.asm",
    "DRAGON":    "dragons.asm",
    "EXPLOSION": "explosion.asm",
    "NINJA":     "final-boss.asm",
}

# Pseudo-ops que llevan etiqueta opcional (label EQU value, label DEFB ..., etc.)
PSEUDO_OPS = {"EQU", "DEFB", "DEFW", "DEFM", "DEFS", "DB", "DW", "DM", "DS"}
# Mnemónicos que NO llevan label en columna 1 si aparecen primero
INSTRUCTION_OPCODES = {
    "ADC","ADD","AND","BIT","CALL","CCF","CP","CPD","CPDR","CPI","CPIR","CPL",
    "DAA","DEC","DI","DJNZ","EI","EX","EXX","HALT","IM","IN","INC","IND","INDR",
    "INI","INIR","JP","JR","LD","LDD","LDDR","LDI","LDIR","NEG","NOP","OR","OTDR",
    "OTIR","OUT","OUTD","OUTI","POP","PUSH","RES","RET","RETI","RETN","RL","RLA",
    "RLC","RLCA","RLD","RR","RRA","RRC","RRCA","RRD","RST","SBC","SCF","SET",
    "SLA","SLL","SRA","SRL","SUB","XOR",
    "ORG","INCLUDE","INCBIN","ALIGN","DUMP","PRINT",
}

LABEL_RE = re.compile(r'^([A-Za-z_][A-Za-z_0-9]*)\b')

def preprocess_line(line, module_map):
    """Devuelve la línea preprocesada (sin newline)."""
    raw = line.rstrip('\n').rstrip('\r')

    # Líneas en blanco o comentarios pasan tal cual
    if not raw.strip():
        return raw
    if raw.lstrip().startswith(';'):
        return raw

    # `#F MODULE` → `INCLUDE "module.asm"`
    m = re.match(r'^\s*#F\s+(\w+)\s*(;.*)?$', raw)
    if m:
        name = m.group(1).upper()
        comment = m.group(2) or ''
        if name in module_map:
            return f'         INCLUDE "{module_map[name]}"   ; #F {name} {comment}'
        return f'         ; #F {name} (sin mapping)  {comment}'

    # `#D+`, `#C-`, `#L+` etc. → comentario explícito
    if re.match(r'^\s*#[A-Za-z]\s*[+\-]\s*$', raw):
        return f'         ; {raw.strip()}'

    # Si la línea empieza en columna 1 con un identificador, es una etiqueta.
    # Caso 1: `LABEL` solo (label en su propia línea, posiblemente con colon ya)
    # Caso 2: `LABEL    INSTR ...`
    if raw and not raw[0].isspace() and not raw[0] in (';', '#'):
        m = LABEL_RE.match(raw)
        if m:
            label = m.group(1)
            rest = raw[m.end():]
            label_upper = label.upper()
            # Si el "label" es realmente un opcode/instrucción (línea sin label en col1)
            if label_upper in INSTRUCTION_OPCODES:
                return raw
            # Si ya viene seguido de `:`, no añadimos otro
            if rest.startswith(':'):
                return raw
            # Detectar si tiene un pseudo-op o instrucción detrás (label con código)
            stripped_rest = rest.strip()
            if stripped_rest:
                # Añadir colon
                return f'{label}:{rest}'
            else:
                # Etiqueta sola en su línea
                return f'{label}:'
    return raw


def main():
    if len(sys.argv) < 3:
        print("Uso: preprocess.py <input.asm> <output.asm> [module_map.json]")
        sys.exit(1)

    inp = sys.argv[1]
    out = sys.argv[2]
    module_map = DEFAULT_MAP.copy()
    if len(sys.argv) > 3:
        with open(sys.argv[3]) as f:
            module_map.update(json.load(f))

    warnings = []
    with open(inp, encoding='utf-8') as fin, open(out, 'w', encoding='utf-8') as fout:
        for lineno, line in enumerate(fin, 1):
            new = preprocess_line(line, module_map)
            # Detectar DEFB/DEFW truncado (terminado en coma sin valor)
            stripped = new.split(';')[0].rstrip()
            if re.search(r'(DEFB|DEFW|DB|DW)\s+.*,\s*$', stripped, re.IGNORECASE):
                warnings.append((lineno, new))
            fout.write(new + '\n')

    if warnings:
        print(f"⚠️  {len(warnings)} líneas DEFB/DEFW truncadas en {inp}:", file=sys.stderr)
        for ln, txt in warnings[:5]:
            print(f"  L{ln}: {txt.strip()}", file=sys.stderr)
        if len(warnings) > 5:
            print(f"  ... y {len(warnings)-5} más", file=sys.stderr)


if __name__ == '__main__':
    main()
