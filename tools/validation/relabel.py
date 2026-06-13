#!/usr/bin/env python3
"""
Aplica un mapeo de auto-labels (LXXXXH/SUB_XXXXH) a nombres humanos en un .asm.

Uso:
    relabel.py <archivo.asm> <mapping.json>

Tras aplicar, compila y verifica byte-perfect contra el binario.
"""
import sys
import re
import json
import shutil

if len(sys.argv) < 3:
    print("Uso: relabel.py <archivo.asm> <mapping.json>")
    sys.exit(1)

asm_file = sys.argv[1]
mapping_file = sys.argv[2]

with open(mapping_file) as f:
    mapping = json.load(f)

# Backup
shutil.copy(asm_file, asm_file + '.relabel.bak')

with open(asm_file) as f:
    text = f.read()

# Aplicar mapeo: cada LXXXXH/SUB_XXXXH → nombre humano
# Solo si la palabra está en límites
n_replaced = 0
for old, new in mapping.items():
    # Reemplazo solo cuando es una palabra completa
    pattern = r'\b' + re.escape(old) + r'\b'
    new_text, count = re.subn(pattern, new, text)
    if count > 0:
        n_replaced += count
    text = new_text

with open(asm_file, 'w') as f:
    f.write(text)

print(f'Reemplazos aplicados: {n_replaced}')
print(f'Backup guardado en: {asm_file}.relabel.bak')
