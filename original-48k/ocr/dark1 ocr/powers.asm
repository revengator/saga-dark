; =============================================================================
; PODERES — gestión de poderes / energía / sidewinders
; Módulo: dark1-powers
; Páginas escaneadas: 5 (dark1-powers-{1..5}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

         #L+
         #C-

; --- [PÁGINA 1] PODER1 + AUMENTA LA FUERZA + POOD + TODOPO --------------

         ;AUMENTA LA FUERZA

PODER1   LD     A,(VAR7)
         CP     3
         RET    Z
         INC    A
         LD     (VAR7),A
         CALL   POOD
         RET


POOD     LD     A,(VAR7)
         LD     D,A
         ADD    A,A
         ADD    A,D
         ADD    A,D
         ADD    A,D
         ADD    A,D
         LD     D,A


TODOPO   LD     HL,16384+4096+64+7+64+256
         LD     B,6
         LD     A,255
TODOP1   PUSH   HL
         LD     C,2
         LD     (HL),A
TODOP2   LD     INC    HL      ; [?]
         INC    HL
         DEC    C
         JR     NZ,TODOP2
         POP    HL
         INC    HL
         DJNZ   TODOP1
         RET


         ;LLENA LA ENERGIA

PODER2   LD     A,16
         LD     A,(VAR6)        ; [?]
         CALL   CASIRA
         RET

         ;PARPADEO  SIDEWINDER

ATTR1    EQU    23847


PARPA    CALL   ROJO
         LD     A,(VAR22)
         SBC    A,50
         CALL   C,CAMBIO
         RET


BLANCO   LD     A,7
         CALL   POCOLO
         RET

; --- [PÁGINA 2] POCOLO + CAMBIO + CAMBI2 + PAR1 + PODER4 + POD44 -------

POCOLO   LD     (ATTR1),A
         LD     (ATTR1+1),A
         LD     (ATTR1+32),A
         LD     (ATTR1+33),A
         RET


CAMBIO   LD     A,(PAR1)
         DEC    A
         LD     (PAR1),A
         CP     0
         CALL   Z,CAMBI2
         RET


CAMBI2   LD     A,2
         LD     (PAR1),A
         CALL   BLANCO
         RET


PAR1     DEFB   2


PODER4   LD     A,(POD4)
         INC    A
         LD     (POD4),A
         CP     2
         CALL   Z,POD44
         RET


POD44    LD     A,1
         LD     (POD4),A
         LD     A,(VAR1)        ; [?]
         RET


         ;SIDEWINDER

ODER3    CALL   PARPA
         LD     A,(VAR22)
         DEC    A
         LD     A,(TABLA1)
         LD     (SIDE1),A
         LD     (SIDE2),A
         LD     A,(TABLA1+8)
         LD     (SIDE1+8),A
         LD     (SIDE2+8),A
         LD     A,(TABLA1+1)
         SBC    A,143
         JP     NC,LIMIT1
         LD     A,(TABLA1+1)
         ADD    A,36
         LD     (SIDE1+1),A

LICONT   LD     A,(TABLA1+1)
         SBC    A,57
         JP     C,LIMIT2
         LD     A,(TABLA1+1)
         SUB    56

; --- [PÁGINA 3] LILI + LIMIT1 + LIMIT2 + LIMD1/2 + PODER3 + BUPOS -------

LILI     CALL   PWIN1
         CALL   PWIN2
         RET


LIMIT1   LD     A,(TABLA1+8)
         CP     5
         JP     Z,LIMD1
         LD     A,200-4
         LD     (SIDE1+1),A
         JP     LICONT


LIMD1    LD     A,204
         LD     (SIDE1+1),A
         JP     LICONT


LIMIT2   LD     A,(TABLA1+8)
         CP     5
         JP     Z,LIMD2
         LD     A,8
         LD     (SIDE2+1),A
         JP     LILI


LIMD2    LD     A,4
         LD     (SIDE2+1),A
         JP     LILI


PODER3   LD     A,(VAR3)         ; [?]
         CP     0
         JP     Z,ODER3


BUPOS    LD     A,(SIDE1+1)
         CP     200-4
         JR     Z,PDCOT1


PDCOT1   LD     A,(SIDE1+1),A   ; [?]
         CP     2
         JR     A,4              ; [?]
PDCONT   LD     A,(SIDE1+1)
         ADD    A,4
         LD     (SIDE1+1),A
         LD     A,199
         SBC    A,(SIDE2+1)      ; [?]
         JR     C,PWIN1
         LD     A,(SIDE2+1),A
         ADD    A,4
         LD     (SIDE2+1),A
         JP     LILI


POCO1    PUSH   AF
         CALL   PWIN1
         LD     A,(VAR21)        ; [?]
         CALL   PWIN2
         POP    AF


PONC     LD     A
         RET    Z

         CALL   ???
         CALL   PONC
         CALL   BBBBBB           ; [?]
         CALL   CCCCCC           ; [?]
         CALL   DDDDDD           ; [?]
         CALL   AAAAAA           ; [?]
         JP     BUPOS

; --- [PÁGINA 4] BUJUN + JUNCON + PWIN1 + PWIN2 + NORMAL ----------------

BUJUN    LD     (SIDE2),A
         PUSH   BC
         LD     B,A
         LD     A,(SIDE1+1)
         JP     Z,JUNCON
         SUB    4
         JP     Z,JUNCON


JUNCON   CP     8
         JP     Z,JUNCAN
         ADD    A,4
         LD     (SIDE2+1),A


JUNCAN   CALL   PWIN1
         CALL   PWIN2
         CALL   PONC
         POP    BC
         CALL   AAAAAA           ; [?]
         CALL   BBBBBB           ; [?]
         CALL   CCCCCC           ; [?]
         CALL   DDDDDD           ; [?]
         POP    BC
         DJNZ   BUJUN
         LD     A,255
         LD     (SIDE1),A
         LD     (SIDE2),A
         LD     A,14
         LD     (SIDE1),A
         LD     (SIDE2),A
         LD     A,(WIND1),A      ; [?]
         LD     A,(WIND2),A
         LD     A,235
         LD     (WIND1),A
         LD     (WIND2),A
         CALL   MDOWN
         CALL   MDOWN
         CALL   MDOWN
         CALL   MDOWN
         RET


PWIN1    LD     A,(SIDE1)
         ADD    A,32
         LD     (WIND1),A
         LD     A,(SIDE1+1)
         ADD    A,(SIDE1+8)
         LD     (WIND1+1),A
         RET


PWIN2    LD     A,(SIDE2)
         ADD    A,32
         LD     (WIND2),A
         LD     A,(SIDE2+1)
         SUB    (SIDE2+8)
         LD     (WIND2+1),A
         RET


NORMAL   LD     A,(SIDE1+1)
         (WIND1+1),A             ; [?]


; --- [PÁGINA 5] PONC + PODERS (TABLA DE PODERES) -----------------------

PONC     LD     HL,(WIND1)
         LD     (WIND1+2),HL
         LD     HL,(WIND2)
         LD     (WIND2+2),HL
         LD     HL,(SIDE1)
         LD     (SIDE1+2),HL
         LD     HL,(SIDE2)
         LD     (SIDE2+2),HL
         RET


PODERS   LD     A,(VAR1)
         CP     0
         RET    Z
         JP     Z,SIDES
         CP     2
         JP     Z,PODER4
         CP     3
         JP     Z,PODER1         ; [?]
         CP     4
         PUSH   AF
         JP     Z,PODER4
         LD     A,(VAR1)
         POP    AF
         CP     3
         JP     Z,PODER1
         CP     5
         JP     Z,PODER2


SIDES    LD     A,(VAR21)
         CP     14
         JP     NZ,PODER3
         CALL   MUP
         LD     HL,SIDE1
         LD     (TO+1),HL
         CALL   MUP
         LD     HL,SIDE2
         LD     (TO+1),HL
         CALL   MUP
         LD     HL,WIND1
         LD     (TO+1),HL
         CALL   MUP
         LD     HL,WIND2
         LD     (TO+1),HL

         LD     A,(TABLA1)
         LD     (SIDE1),A
         LD     (SIDE2),A
         LD     A,(TABLA1+1)
         LD     (SIDE1+1),A
         JP     PODER3


; =============================================================================
; FIN — dark1-powers
; -----------------------------------------------------------------------------
; Rutinas:
;   PODER1   → aumenta la fuerza (incrementa VAR7)
;   PODER2   → llena la energía
;   PODER3   → SIDEWINDER (parpadeo + control sidewinders)
;   PODER4   → POD4 / POD44
;   POOD     → calcula multiplicador (×6)
;   TODOPO/TODOP1/TODOP2 → escritura en pantalla del medidor
;   PARPA / BLANCO / POCOLO → cambio de color (atributos)
;   CAMBIO / CAMBI2 → temporizador de parpadeo
;   ODER3 + LILI/LIMIT1/LIMIT2/LIMD1/LIMD2 → seguimiento horizontal
;   BUPOS → bucle de barrido
;   BUJUN/JUNCON/JUNCAN → otra animación
;   PWIN1/PWIN2 → pone WIND1/WIND2 (parte inferior)
;   PONC      → guarda posiciones previas
;   PODERS   → despachador principal por VAR1
;   SIDES     → activa los 4 sprites (SIDE1, SIDE2, WIND1, WIND2)
; =============================================================================
