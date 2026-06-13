; =============================================================================
; PODERES — gestión de poderes (parte que reside en 0x7B9B - 0x7C30)
; -----------------------------------------------------------------------------
; Range:  0x7B9B - 0x7C30 (150 bytes)
; Variables:
;   VAR7  (0xA616) — fuerza actual (0..3)
;   VAR1  (0xA60D?) — fase de power-up actual
;   PAR1  (0x7BFB) — contador de parpadeo (data dentro del módulo)
;   VAR16 (0xA614?) — variable de estado
;
; NOTA: el scan original `_scan/powers.asm` (5 páginas) cubre TAMBIÉN rutinas
; que residen fuera de este rango (LIMIT1, JUNCAN, BUPOS, PWIN1, PWIN2,
; SIDES, etc. probablemente en main_tail). Aquí solo está la parte motor.
; =============================================================================

; --- PODER1 — Aumenta la fuerza --------------------------------------------

PODER1   LD     A,(VAR7)
         CP     3
         RET    Z
         INC    A
         LD     (VAR7),A
         CALL   POOD
         RET


; --- POOD — Calcula multiplicador (×6) y pinta barra de fuerza --------------

POOD     LD     A,(VAR7)
         LD     D,A
         ADD    A,A           ; A = VAR7*2
         ADD    A,D           ; *3
         ADD    A,D           ; *4
         ADD    A,D           ; *5
         ADD    A,D           ; *6
         LD     D,A
         LD     HL,0x5187     ; pantalla atributos (área barra de fuerza)
         LD     B,6
         LD     A,255

TODOP1   PUSH   HL
         LD     C,D           ; (scan tenía 'LD C,2' por OCR)
TODOP2   LD     (HL),A
         INC    HL
         DEC    C
         JR     NZ,TODOP2
         POP    HL
         INC    H             ; (scan tenía 'INC HL' por OCR)
         DJNZ   TODOP1
         RET


; --- PODER2 — Power-up nivel 5 (llama externo + BLANCO) --------------------
; PODERS dispatch: case CP 5 → PODER2 (llama sub_a7e3h externa luego BLANCO)

PODER2   CALL   MUERTE_K      ; rutina externa en main_tail
                              ; cae a BLANCO (sin RET intermedio)


; --- BLANCO — Atributos blancos -------------------------------------------

BLANCO   LD     A,7
         CALL   POCOLO
         RET


; --- PARPA — Atributos rojos con parpadeo (flash=1, ink=2) ----------------

PARPA    LD     A,0x42        ; flash=1, ink=red
         CALL   POCOLO
         RET


; --- POCOLO — Aplica atributo A a 4 celdas de la barra de poderes ---------

POCOLO   LD     (0x5ACF),A    ; ATTR1 = 0x5ACF (no 23847=0x5D27 como scan)
         LD     (0x5AD0),A
         LD     (0x5AEF),A
         LD     (0x5AF0),A
         RET


; --- CAMBIO — Temporizador de parpadeo (decrementa PAR1, llama CAMBI2) ----

CAMBIO   LD     A,(PAR1)
         DEC    A
         LD     (PAR1),A
         CP     0
         JP     Z,CAMBI2
         CALL   PARPA         ; (scan: 'CALL PARPA'... binario llama sub_7bcfh)
         RET

CAMBI2   LD     A,2
         LD     (PAR1),A
         CALL   BLANCO
         RET

PAR1     DEFB   2             ; data — contador de parpadeo


; --- PODER4 — Power-up POD4 (incrementa contador y wrap a 1 si llega a 2) -

PODER4   LD     A,(POD4_VAR)  ; POD4 - variable
         INC    A
         LD     (POD4_VAR),A
         CP     2
         CALL   Z,POD44
         RET


; --- POD44 — Reset del contador POD4 a 1 ---------------------------------

POD44    LD     A,1
         LD     (POD4_VAR),A
         LD     A,0
         LD     (VAR1),A    ; otra variable de estado
         RET


; --- PODERS — Dispatcher principal según VAR16 (0xA614) -------------------

PODERS   LD     A,(VAR1)
         CP     0
         RET    Z
         CP     4
         JP     Z,PODER4      ; case 4 → PODER4
         PUSH   AF
         LD     A,0           ; reset VAR16
         LD     (VAR1),A
         POP    AF
         CP     3
         JP     Z,PODER1      ; case 3 → PODER1
         CP     5
         JP     Z,PODER2      ; case 5 → PODER2
         RET
