; =============================================================================
; SAGA DARK — DARK1 (FASE 1: EL PÁRAMO)
; =============================================================================
; Master build file para sjasmplus 1.23.0+. Compila byte-a-byte idéntico a
; dark1.sna (31739 bytes desde 0x6A9B a 0xE695).
;
; Build:    sjasmplus --raw=dark1.bin dark1.asm
; Verifica: cmp dark1.bin <(dd if=dark1.sna bs=1 skip=10934 count=31739)
;
; Estado de las fuentes (2026-04-28):
;   ✅ MOTOR (7/7): mapper, colas, abuelo, hres-printing, player, powers, collisions
;   ✅ ENEMIES: piranha, chicle, gaseodoptero, speedy, dragons, explosion
;   ⏳ viscosa, stone-blocks, final-boss, main, faces — INCBIN pendiente cleanup OCR
; =============================================================================

         INCLUDE "defines.inc"

         ORG 0x6A9B

; --- Motor: 7 módulos del engine ---------------------------------------------
; mapper, colas, abuelo, hres-printing, player, powers, collisions
; Progresivamente reemplazados de INCBIN→INCLUDE conforme se limpia el OCR.

; mapper (CPANT) — control de pantallas — ✅ código limpio
         INCLUDE "mapper.asm"             ; 785B (0x6A9B-0x6DAB)

; colas (COLAS) — gestión cola de sprites — ✅ código limpio
         INCLUDE "colas.asm"              ; 143B (0x6DAC-0x6E3A)

; abuelo (ABUELO) — NPC del intro — ✅ código limpio
         INCLUDE "abuelo.asm"             ; 1064B (0x6E3B-0x7262)

; hres-printing (IMPRES) — blitter alta-res + SDERE/SIZQUI — ✅ código limpio
         INCLUDE "hres-printing.asm"      ; 1121B (0x7263-0x76C3)

; player (PERSO) — control del jugador — ✅ código limpio
         INCLUDE "player.asm"             ; 1239B (0x76C4-0x7B9A)

; powers (PODERES) — power-ups + CAMBIO — ✅ código limpio
         INCLUDE "powers.asm"             ; 150B (0x7B9B-0x7C30)

; collisions (CHOQUES) — colisiones + CHOQUE/PALO + MUPP/T0DEC — ✅ código limpio
         INCLUDE "collisions.asm"         ; 500B (0x7C31-0x7E24)

; --- Enemy modules: PEZ (piraña) ----------------------------------------------
         INCLUDE "piranha.asm"            ; código (260B)
         INCBIN "data/piranha_sprite.bin" ; PEZ1 + PEZF1 + PEZF2 (1754B)

; --- Enemy modules: GASEO (gaseodóptero) --------------------------------------
         INCLUDE "gaseodoptero.asm"       ; código
         INCBIN "data/gaseodoptero_sprite.bin"  ; GASEO1 + GAS1 + GAS2 (600B)

; --- Enemy modules: VISCO (viscosa - boss del pantano) — ✅ código limpio -------
         INCLUDE "viscosa.asm"            ; 3420B

; --- Enemy modules: CHICLE (m. F1) --------------------------------------------
         INCLUDE "chicle.asm"             ; código
         INCBIN "data/chicle_sprite.bin"  ; MOMI + MOM1 + MOM2 + MOM3 (1953B)

; --- Enemy modules: PIEDRA (bloques de piedra) — ✅ código limpio --------------
         INCLUDE "stone-blocks.asm"       ; 722B

; --- Enemy modules: SPEDY (veloz) ---------------------------------------------
         INCLUDE "speedy.asm"             ; módulo entero (174B)

; --- Enemy modules: DRAGON (dragones de lava) ---------------------------------
         INCLUDE "dragons.asm"            ; módulo entero (203B)

; --- Enemy modules: EXPO (explosión del boss) ---------------------------------
         INCLUDE "explosion.asm"          ; módulo entero (143B)

; --- Final boss (NINJA / KAMUIR) ----------------------------------------------
; ✅ código limpio
         INCLUDE "final-boss.asm"         ; 348B

; --- Main module: data tables + dispatch + game loop — ✅ código limpio --------
         INCLUDE "main.asm"               ; 12282B (0xA60C-0xD605)

; --- HUD: faces-and-enemy + tablas finales — ✅ código limpio ------------------
         INCLUDE "faces-and-enemy.asm"    ; 4240B → ends at 0xE696

; =============================================================================
; FIN — dark1 termina en 0xE695. Total: 31739 bytes.
; =============================================================================
