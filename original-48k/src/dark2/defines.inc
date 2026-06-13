; =============================================================================
; SAGA DARK — DARK2 — Definiciones compartidas (EQU)
; =============================================================================
; Direcciones de variables y rutinas externas a cada módulo enemy, derivadas
; del análisis byte-a-byte vs dark2.sna. Las direcciones difieren de dark1
; porque dark2 tiene más datos antes del bloque de variables.
;
; Mapping dark1 → dark2 (motor, 17 vars detectadas en 77 diff bytes):
;   0xA60D → 0xA6A2   0xA619 → 0xA6AE   0xA655 → 0xA6EA
;   0xA612 → 0xA6A7   0xA61F → 0xA6B4   0xA665 → 0xA6FA
;   0xA613 → 0xA6A8   0xA633 → 0xA6C8   0xA6E8 → 0xA77D
;   0xA614 → 0xA6A9   0xA652 → 0xA6E7   0xA7E3 → 0xA89F
;   0xA615 → 0xA6AA   0xA653 → 0xA6E8   0xA820 → 0xA8D7
;   0xA616 → 0xA6AB
;   0xA617 → 0xA6AC
; =============================================================================

; --- Variables de estado ---------------------------------------------------
; (definidas como label en main.asm; las EQU aquí son por si se compila standalone)
;   VAR0  (0xA6C8) — pantalla actual (era 0xA633 en dark1)
;   VAR7  (0xA6AB) — fuerza actual (era 0xA616)
;   VARB  (0xA6AC) — contador power-up (era 0xA617)
;   T0    (0xA6E7) — cabeza cola sprites (era 0xA652)
;   E1    (0xA8F7) — estado armadura/diablo/pincho (era 0xA84B)
;   E2    (0xA8F8) — estado trimonster/sierra/saltaron/llamaron (era 0xA84C)
;   E3    (0xA8F9) — estado fuego (era 0xA84D)
;   BICHOS(0xA8FB) — dispatcher principal de enemigos
VARO     EQU 0xA6C8    ; alias OCR (letra O por dígito 0)

; --- Variables: definidas como labels en main.asm (cuando se INCLUDE) -------
; La mayoría de variables (VAR0, VAR7, E1, E2, E3, MUERTE, T01...) son labels
; en main.asm y se resuelven naturalmente al INCLUDE.
; T0 (0xA6E7) NO está labeleada en main.asm (z80dasm no emite label para
; addresses solo referenciados por loads sin saltos). Se queda como EQU.
T0       EQU 0xA6E7    ; cabeza cola sprites
; DAT2 — definido como label en player.asm

; --- Flags de modificación (CHEAT MODE) --------------------------------------
; Si INFINITE_ENERGY=1, la rutina MUERTE retorna sin restar vida.
; Compilar con: sjasmplus -DINFINITE_ENERGY=1 dark2.asm
; Por defecto (=0), build byte-perfect contra dark2.sna original.
    IFNDEF INFINITE_ENERGY
INFINITE_ENERGY EQU 0
    ENDIF

; --- Tablas de pantallas (área atributos screen, fuera del programa) --------
TABLA1   EQU 0x5D2A    ; tabla pantallas (atributos screen)
TABLA2   EQU 0x5D3E    ; tabla pantallas parte 2

; --- Rutinas/labels en módulos motor (resueltos por orden de INCLUDE) -------
; mapper.asm:     PANTAL, BUJA
; colas.asm:      MUP, MDOWN, SPRIPE, RESET, SPRI1, BUS1
; abuelo.asm:     ABUELO, SOUND2 (ABU sprite + 3 frames)
; hres-printing:  AAAAAA, BBBBBB, ESPEJ, SDERE, SIZQUI, DDDDDD
; player.asm:     COMPR, MUP1, etc.
; powers.asm:     PODER1, PODER2, PODER4, PODERS
; collisions.asm: SALIR, CHOQUE, PALO, MUPP, T0DEC, SALVAR

; --- TBD: rutinas en main.asm referenciadas por motor -----------------------
; CALL 0xA89F (era 0xA7E3 en dark1) — rutina en main_tail
; JP   0xA8D7 (era 0xA820 en dark1) — NUEVO en main
