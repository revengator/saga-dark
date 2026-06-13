; =============================================================================
; SAGA DARK — DARK1 — Definiciones compartidas (EQU)
; =============================================================================
; Direcciones de variables y rutinas externas a cada módulo enemy, verificadas
; byte-a-byte vs dark1.sna durante la fase de validación pyz80/sjasmplus.
; =============================================================================

; --- Variables de estado (definidas como label en main.asm) ------------------
; NOTA: cuando main.asm está INCLUDE'd, estas variables se definen
; naturalmente como labels en sus direcciones. Aquí solo dejamos EQUs para
; los tests de módulos individuales (build wrapper independiente).
;   E1  (0xA84B) — estado piraña/speedy/chicle
;   E2  (0xA84C) — estado gaseodoptero
;   E3  (0xA84D) — estado reservado
;   T0  (0xA652) — cabeza cola sprites
;   VAR0 (0xA633), VAR7 (0xA616), VARB (0xA617)
;   TABLA1 (0x5D2A), TABLA2 (0x5D3E)
;   DAT2 (0x7831) — estado de la lanza
VARO     EQU 0xA633    ; alias OCR (letra O por dígito 0)

; --- Flags de modificación (CHEAT MODE) --------------------------------------
; INFINITE_ENERGY se define en `main.asm` (con IFNDEF guard) — sjasmplus
; trata IFNDEF + EQU como label duplicado si la misma EQU aparece dos veces
; en archivos distintos, así que aquí NO la redeclaramos. Para builds
; standalone de dark1 usa la copia en `original-48k/src/dark1/defines.inc`.
TABLA1   EQU 0x5D2A    ; tabla pantallas (atributos screen, fuera del programa)
TABLA2   EQU 0x5D3E    ; tabla pantallas parte 2
; VAR7, MUERTE están en main.asm (defines aquí solo si se compila standalone)

; AAAAAA, SIZQUI, SDERE están en hres-printing.asm (definidos localmente)

; --- Rutinas en player.bin (pendiente cleanup OCR) ---------------------------

; --- MDOWNN: alias OCR usado por explosion (= T0DEC, definido en collisions) -
MDOWNN   EQU 0x7E1D

; --- Símbolos en módulos ya limpios:
;   colas.asm:      MUP, MDOWN, SPRIPE, RESET, SPRI1, BUS1
;   powers.asm:     CAMBIO, PODER1, POOD, PODER4, POD44, PODERS, BLANCO, ...
;   collisions.asm: CHOQUE, PALO, MUPP, T0DEC, SALIR, ANTES, DESPU, ...

; --- CHOQUE, PALO definidos en collisions.asm (no necesitan EQU stub) -------

; --- Rutinas de flujo de juego (definidas en main.asm) ----------------------
; MUERTE (0xA7F1), CAMBIO (en powers.asm), PON1 (en piranha.asm)
; VAR7 (0xA616) — fuerza actual (definido como label en main.asm)

; --- Sprites del boss y datos externos --------------------------------------
; ENEMI1 (0xD223), ENEMI2 (0xD22F) — sprites del NINJA en main.asm (labels)
TEF1     EQU 0xE696    ; tabla PASOS del NINJA — fuera del rango compilado
                       ; (104 bytes que viven en RAM 0xE696-0xE6FD)
; DPERSO, DMALO — definidos en faces-and-enemy.asm

; --- Punteros a frames de sprite (datos truncados en scan original) ----------
PEZF2    EQU 0x829D    ; segundo frame piranha
GAS2     EQU 0x888D    ; segundo frame gaseodoptero
MOM2     EQU 0x9ACC    ; segundo frame chicle
MOM3     EQU 0x9D51    ; tercer frame chicle

; --- Direcciones de sprite headers (en datos INCBIN) -------------------------
PEZ1     EQU 0x7F29    ; sprite header piranha
GASEO1   EQU 0x875A    ; sprite header gaseodoptero
MOMI     EQU 0x9835    ; sprite header chicle

; --- Tunable balance: energy / life ------------------------------------------
; Hook-mode MUERTE (hooks.asm) decrements NU1 ONCE per damage tick (every
; NRG_TICK contact-frames) and ticks MUERE (the energy "face"/bar) on the same
; beat, so the bar draws exactly NRG_FULL segments over a life and empties right
; at death. Survival = NRG_FULL * NRG_TICK contact-frames.
;   NRG_FULL = hits/segments to die (24 = the bar's natural length).
;   NRG_TICK = contact-frames per hit (the survivability knob).
; Platformer: 24*12 = 288 frames, ~3x the original 96 (=24*4) -> base game is
; playable without the INFINITE_ENERGY cheat. Legacy/byte-perfect (no
; UNIFIED_HOOKS) keeps NU1=0x60 for PA02; its every-frame MUERTE ignores NRG_TICK.
    IFDEF UNIFIED_HOOKS
NRG_FULL EQU 0x18
    ELSE
NRG_FULL EQU 0x60
    ENDIF
    IFDEF UNIFIED_PLATFORMER
NRG_TICK EQU 0x0C
    ELSE
NRG_TICK EQU 0x04
    ENDIF

; --- Variables OCR-pendientes (provisional) ----------------------------------
SONI2    EQU 0xA97D    ; rutina de sonido (usada por explosion)
; PEDD1 (0xA6A2), PEDD2 (0xA6B0), PEDD3 (0xA6A7), PEDD4 — definidos en main.asm
; Nota: el binario los pone en orden PEDD1 (0xA665), PEDD2 (0xA6A2), PEDD3 (0xA6A7),
; con valores específicos. Los labels se mapean a sus posiciones reales en main.
; RESET y SPRIPE están definidos en colas.asm (no necesitan EQU stub)
