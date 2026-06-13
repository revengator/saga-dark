; =============================================================================
; COLAS — Gestión de la cola de sprites
; -----------------------------------------------------------------------------
; Range:  0x6DAC - 0x6E3A (143 bytes)
; T0 (0xA652) es el contador de la cola.
; T0+1 (0xA653) primer puntero, T0+3 (0xA655) segundo, etc.
;
; Rutinas exportadas:
;   MUP    (0x6DAC) — inserta entrada al inicio (desplaza con LDDR)
;   MDOWN  (0x6DD2) — elimina la primera entrada (desplaza con LDIR)
;   SPRI1  (0x6DEC) — busca sprite en TABLA1 según VAR0 y mete entradas en cola
;   BUS1   (0x6E0F) — bucle interno: cadena de IX recorriendo entradas
;   SPRIPE (0x6E22) — mete TABLA1 + TABLA2 en cola
;   RESET  (0x6E35) — limpia la cola (T0=0)
; =============================================================================

; --- MUP — Inserta una entrada al inicio de la cola --------------------------

MUP      PUSH   HL
         PUSH   DE
         PUSH   BC
         LD     A,(T0)
         CP     0
         JR     Z,MUPI
         ADD    A,A
         LD     C,A
         LD     B,0
         LD     HL,T0
         LD     D,0              ; (scan tenía 'ADD HL,BC' aquí; OCR error)
         LD     E,C
         ADD    HL,DE
         PUSH   HL
         POP    DE
         INC    DE
         INC    DE
         LDDR

MUPI     LD     A,(T0)
         INC    A
         LD     (T0),A
         POP    BC
         POP    DE
         POP    HL
         RET


; --- MDOWN — Elimina la primera entrada de la cola ---------------------------

MDOWN    PUSH   HL
         PUSH   DE
         PUSH   BC
         LD     HL,T0+3
         LD     DE,T0+1
         LD     A,(T0)
         DEC    A
         LD     (T0),A
         ADD    A,A
         LD     C,A
         LD     B,0
         LDIR
         POP    BC
         POP    DE
         POP    HL
         RET


; --- SPRI1 — Busca sprite en TABLA1 e inserta en cola (VAR0 = índice) --------

SPRI1    LD     A,(VAR0)
         AND    %00111111        ; máscara 6 bits (0..63 pantallas)
         LD     B,A
         INC    B
         LD     IX,0xFFFE        ; base de tabla PAN-2 (wrap a 0x0000+2)
BUS      INC    IX
         INC    IX
         DJNZ   BUS
         LD     L,(IX+0)
         LD     H,(IX+1)
         PUSH   HL
         POP    IX
         LD     B,(IX+0)
         INC    IX
         LD     A,B
         CP     0
         RET    Z


; --- BUS1 — Bucle: encadena IX por las B entradas restantes ------------------

BUS1     CALL   MUP
         LD     H,(IX+1)
         LD     L,(IX+0)
         LD     (T0+1),HL
         INC    IX
         INC    IX
         DJNZ   BUS1
         RET


; --- SPRIPE — Mete TABLA1 y TABLA2 en la cola --------------------------------

SPRIPE   CALL   MUP
         LD     HL,TABLA1
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,TABLA2
         LD     (T0+1),HL
         RET


; --- RESET — Vacía la cola (T0=0) --------------------------------------------

RESET    LD     A,0
         LD     (T0),A
         RET
