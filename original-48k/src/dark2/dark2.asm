; =============================================================================
; SAGA DARK — DARK2 (FASE 2: LAS CATACUMBAS + TEMPLO + SKULL PLAINS)
; =============================================================================
; Master build file para sjasmplus 1.23.0+. Objetivo: byte-a-byte idéntico a
; dark2.sna (31739 bytes desde 0x6A9B a 0xE695).
;
; Build:    cd src/dark2 && sjasmplus --raw=../../build/dark2.bin dark2.asm
;
; Estado de las fuentes (2026-04-28):
;   ✅ MOTOR (7/7): mapper, colas, abuelo, hres-printing, player, powers,
;      collisions — heredados de dark1 con substitución de direcciones.
;   ✅ ENEMIES (9): armadura, trimonster, fuego, sierra, diablo, pincho,
;      saltaron, llamaron, globman — generados por disasm + label map del
;      motor (auto-labels donde aún no hay nombre humano).
;   ✅ main + faces — generados por disasm. Pendiente cleanup OCR para
;      nombres humanos del autor (BICHOS, NU1, etc.) y conversión de data
;      tables a DEFB en lugar de pseudo-código.
; =============================================================================

         INCLUDE "defines.inc"
         INCLUDE "enemy_stubs.inc"

         ORG 0x6A9B

; --- Motor: 7 módulos del engine (heredados de dark1) ------------------------
         INCLUDE "mapper.asm"             ; 785B (0x6A9B-0x6DAB)
         INCLUDE "colas.asm"              ; 143B (0x6DAC-0x6E3A)
         INCLUDE "abuelo.asm"             ; 1064B (0x6E3B-0x7262)
         INCLUDE "hres-printing.asm"      ; 1121B (0x7263-0x76C3)
         INCLUDE "player.asm"             ; 1239B (0x76C4-0x7B9A)
         INCLUDE "powers.asm"             ; 150B (0x7B9B-0x7C30)
         INCLUDE "collisions.asm"         ; 500B (0x7C31-0x7E24)

; --- Enemy modules (9) — disasm generado, byte-perfect ----------------------
; 1 byte de gap entre collisions (0x7E24) y armadura (0x7E26): rellenar con
; 0x00. (En dark1 no hay gap; en dark2 hay este padding.)
         DEFB 0                            ; padding 0x7E25

         INCLUDE "armadura.asm"           ; ARMADU 0x7E26-0x86DD (2232B)
         INCLUDE "trimonster.asm"         ; TRIVI  0x86DE-0x8BAC (1231B)
         INCLUDE "fuego.asm"              ; FUEGO  0x8BAD-0x8EA5 ( 761B)
         INCLUDE "sierra.asm"             ; SIERRA 0x8EA6-0x939C (1271B)
         INCLUDE "diablo.asm"             ; DEMON  0x939D-0x98D7 (1339B)
         INCLUDE "pincho.asm"             ; PINCHO 0x98D8-0x9B6F ( 664B)
         INCLUDE "saltaron.asm"           ; SALTA  0x9B70-0x9E04 ( 661B)
         INCLUDE "llamaron.asm"           ; LLAMAS 0x9E05-0xA572 (1902B)
         INCLUDE "globman.asm"            ; GLOBO  0xA573-0xA6A0 ( 302B)

; --- main + faces (disasm-generado, pendiente OCR cleanup) ------------------
         INCLUDE "main.asm"               ; 0xA6A1-0xD605 (11781B)
         INCLUDE "faces-and-enemy.asm"    ; 0xD606-0xE695  (4240B)

; =============================================================================
; FIN — dark2 termina en 0xE695. Total: 31739 bytes.
; =============================================================================
