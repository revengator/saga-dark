; =============================================================================
; RUTINA DE CONTROL DE COLAS
; Módulo: dark1-colas
; Páginas escaneadas: 2 (dark1-colas-{1..2}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        Gestión de la cola de sprites en T0 (lista enlazada compacta).
; =============================================================================

; --- [PÁGINA 1] MUP + MUPI + MDOWN + SPRI1 + BUS ----------------------------

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
         ADD    HL,BC
         LD     D,0
         LD     E,C
         ADD    HL,DE
         PUSH   HL
         POP    DE
         INC    DE
         INC    DE
         LDDR


MUPI     LD     A,(T0)
         INC    A                ; [?]
         LD     (T0),A
         POP    BC
         POP    DE
         POP    HL
         RET


MDOWN    PUSH   HL
         PUSH   DE
         PUSH   BC
         LD     HL,T0+3
         LD     DE,T0+1
         LD     A,(T0)
         DEC    A
         LD     B,A              ; [?]
         ADD    A,A
         LD     C,A
         LD     B,0
         LDIR
         POP    BC
         POP    DE
         POP    HL
         RET


SPRI1    LD     A,(VAR0)
         AND    %00011111
         LD     B,A
         INC    B
         LD     IX,TAB1+2        ; [?] (TABLA1?)
BUS      INC    IX
         INC    IX
         DJNZ   BUS
         LD     L,(IX)
         LD     H,(IX+1)
         PUSH   HL
         POP    IX
         INC    IX
         LD     B,(IX)
         INC    IX
         LD     A,B

; --- [PÁGINA 2] BUS1 + SPRIPE + RESET ---------------------------------------

         RET    Z

BUS1     CALL   MUP
         LD     H,(IX+1)
         LD     L,(IX)
         LD     (T0+1),HL
         INC    IX
         INC    IX
         DJNZ   BUS1
         RET


SPRIPE   CALL   MUP
         LD     HL,TABLA1
         LD     (T0+1),HL
         CALL   MUP
         LD     HL,TABLA2
         LD     (T0+1),HL
         RET


RESET    LD     A,0
         LD     (T0),A
         RET


; =============================================================================
; FIN — dark1-colas
; -----------------------------------------------------------------------------
; Gestión de la cola de sprites (T0):
;   MUP    → inserta una entrada al inicio (desplaza con LDDR)
;   MDOWN  → elimina la primera entrada (desplaza con LDIR)
;   SPRI1  → busca un sprite aleatorio en TABLA1 vía VAR0
;   BUS1   → encadena IX recorriendo entradas
;   SPRIPE → mete TABLA1 + TABLA2 en cola
;   RESET  → limpia el contador (T0=0)
; T0 es el contador de la cola; T0+1 = primer puntero (HL), etc.
; =============================================================================
