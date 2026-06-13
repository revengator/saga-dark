#!/usr/bin/env bash
# Validación rápida de un módulo dark1 contra dark1.sna
# Uso: validate.sh <modulo> <entry_hex> [--diff N]
#   ej: validate.sh chicle 0x970E

set -e
MOD="$1"
ENTRY="$2"
MAXDIFF="${4:-10}"

ROOT="/Volumes/Almacen/github/saga-dark"
BUILD="$ROOT/build"
SRC="$ROOT/original-48k/src/dark1/${MOD}.asm"
SNA="$ROOT/original-48k/snapshots/dark1.sna"
WRAPPER="$BUILD/test_${MOD}.asm"

cd "$BUILD"
python3 "$ROOT/tools/validation/preprocess.py" "$SRC" "${MOD}.asm" 2>&1 | grep -v '^pass\|^Finished' || true
python3 -m pyz80.pyz80 --obj=${MOD}_test.bin --nozip --mapfile=${MOD}_test.map "$WRAPPER" 2>&1 | tail -3
python3 "$ROOT/tools/validation/compare.py" ${MOD}_test.bin "$SNA" "$ENTRY" --max-diff $MAXDIFF
