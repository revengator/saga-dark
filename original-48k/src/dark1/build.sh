#!/usr/bin/env bash
# Compila dark1 a .bin y .sna ejecutable.
# Uso:
#   ./build.sh           — build normal (byte-perfect contra dark1.sna original)
#   ./build.sh cheat     — build con INFINITE_ENERGY=1 (energía infinita)
#   ./build.sh all       — ambas

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$SCRIPT_DIR/../../build"
SNA_ORIG="$SCRIPT_DIR/../../snapshots/dark1/dark1.sna"

mkdir -p "$BUILD_DIR"

build_one() {
    local name=$1
    local flag=$2
    local bin="$BUILD_DIR/${name}.bin"
    local sna="$BUILD_DIR/${name}.sna"

    cd "$SCRIPT_DIR"
    if [ -n "$flag" ]; then
        sjasmplus -D"$flag" --raw="$bin" dark1.asm > /dev/null
    else
        sjasmplus --raw="$bin" dark1.asm > /dev/null
    fi

    python3 << EOF
sna = open('$SNA_ORIG','rb').read()
bin_data = open('$bin','rb').read()
ram = sna[27:]
new_sna = sna[:27] + ram[:0x6A9B - 0x4000] + bin_data + ram[0xE696 - 0x4000:]
open('$sna','wb').write(new_sna)
diffs = sum(1 for i,b in enumerate(bin_data) if b != ram[i + 0x6A9B - 0x4000])
print(f'  {"$name".ljust(15)}: {len(bin_data)}B  ({len(bin_data)-diffs}/{len(bin_data)} bytes vs original)')
EOF
}

case "${1:-normal}" in
    normal)
        build_one "dark1" ""
        ;;
    cheat)
        build_one "dark1_cheat" "INFINITE_ENERGY=1"
        ;;
    all)
        build_one "dark1" ""
        build_one "dark1_cheat" "INFINITE_ENERGY=1"
        ;;
    *)
        echo "Uso: $0 [normal|cheat|all]"
        exit 1
        ;;
esac
