; =============================================================================
; CPANT — CONTROL DE PANTALLAS
; Módulo: dark1-mapper
; Páginas escaneadas: 8 (dark1-mapper-{1..8}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. Marca '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 1] PANTAL + BUJA + BUPP + PONIX + PONS2 + PCNNN -------------

PANTAL   LD     HL,VAR0
         BIT    7,(HL)
         CALL   NZ,PANTME
         BIT    6,(HL)
         CALL   NZ,PANTMA
         LD     HL,PAN-2
         LD     A,(VAR0)
         AND    %00111111
         LD     B,A

BUJA     INC    B
         INC    HL
         INC    HL
         DJNZ   BUJA
         LD     E,(HL)
         INC    HL
         LD     D,(HL)
         PUSH   DE
         POP    IY
         LD     B,(IY)         ; [?]


BUPP     INC    IY
         PUSH   BC
         LD     A,0
         LD     (DATO3),A
         CALL   PONIX
         CALL   PONNN
         CALL   INCZ
         POP    BC
         DJNZ   BUPP
         RET


PONIX    LD     HL,SET1-5
         BIT    5,(IY+3)
         CALL   NZ,PONS2
         LD     B,(IY+0)
         INC    B
         LD     DE,5

PCNNN    ADD    HL,DE
         DJNZ   PCNNN
         PUSH   HL
         POP    IX
         RET


PONS2    LD     HL,SET2-5
         RET


PONNN    BIT    1,(IY+3)
         JP     NZ,BUCLES
         BIT    2,(IY+3)
         JP     NZ,AMPLI
         JP     IMPRES


INCZ     PUSH   IY
         POP    IX
         LD     B,4
         INC    IY
         INCB   ; [?]
         BIT    7,(IX+3)        ; [?]
         CALL   NZ,INCC
         BIT    1,(IX+3)        ; [?]


; --- [PÁGINA 2] INCC + PANTME + PANTMA + BUCLES --------------------------

         CALL   NZ,INCC
         CALL   NZ,INCC
         RET


INCC     INC    IY
         RET


PANTME   LD     A,(VAR0)
         AND    %00111111
         CP     0
         RET    Z
         LD     (VAR0),A
         RET


PANTMA   LD     A,(VAR0)
         AND    %00111111
         CP     63
         RET    Z
         INC    A
         LD     (VAR0),A
         RET


BUCLES   LD     D,(IY+4)
         LD     E,(IY+5)
         BIT    7,(IY+3)
         CALL   NZ,PCOR
         LD     H,(IY+1)
         LD     L,(IY+2)
         PUSH   HL
         LD     B,D
BUUU1    PUSH   BC
         LD     B,E
BUUU2    PUSH   BC
         CALL   IMPRES
         POP    BC
         POP    HL
         POP    BC
         LD     (IY+2),L
         PUSH   HL
         DJNZ   BUUU1
         POP    HL
         LD     (IY+1),H
         LD     (IY+2),L
         RET


PCOR     LD     D,(IY+5)
         LD     E,(IY+6)
         RET


AMPLI    LD     H,(IX+3)
         LD     L,(IX+2)
         LD     A,(DATO3)
         INC    A
         LD     (DATO3),A
         PUSH   IX

; --- [PÁGINA 3] AMPLI continuación + INCX0 + INCX4 + INCY + INCY2 -------

         CP     5
         JP     Z,INCX4
         LD     A,(IX+1)


ETI      ADD    A,A
         LD     D,(IY+2)
         ADD    A,D
         LD     (IY+2),A
         RET


INCX0    LD     A,(IX+1)
         LD     D,(IY+2)
         ADD    A,D
         LD     (IY+2),A
         RET


INCX4    LD     A,(IX+1)
         ADD    A,A
         JP     ETI


INCY     BIT    2,(IY+3)
         JP     NZ,INCY2
         LD     A,(IY+0)
         LD     D,(IX+0)
         ADD    A,D
         LD     (IY+1),A
         RET


INCY2    LD     A,(IX+0)
         ADD    A,A
         LD     D,(IY+1)
         ADD    A,D
         LD     (IY+1),A
         RET


DATO3    DEFB   0


COCOCO   LD     A,1
         LD     (DATO3),A      ; [?]
         JP     IMPRES


AMPLI2   LD     H,(IX+3)
         LD     L,(IX+2)
         LD     A,(DATO3)
         INC    A
         LD     CP     2       ; [?]
         JR     Z,COCOCO
         PUSH   IX

; --- [PÁGINA 4] BUC9 + BCO + BC1 + BC2 + IMPRES --------------------------

         PUSH   IY
         LD     D,(IX+1)
         LD     E,(IX+0)
         LD     B,(IX+0)
         PUSH   HL
         LD     DE,16
         ADD    HL,DE
         DJNZ   BUC9
         POP    HL
         POP    IY
         POP    IX
         RET


BC0      LD     B,8
BC1      RRA
         SRA    D
         RR     E

BC2      DJNZ   BC0
         JR     NZ,BC2
         POP    POP            ; [?] inválido — dos POP juntos
         LD     IX,IX          ; [?]
         LD     IY,IY          ; [?]
         LD     (IX+1),D       ; [?]
         LD     (IX+0),E       ; [?]
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         DEC    C
         JR     NZ,BC0
         POP    IY
         POP    IX
         RET


IMPRES   LD     A,(DATO)
         LD     B,A
         LD     C,(IY+2)
         CALL   DIRE


BU0      PUSH   IY             ; [?]
         PUSH   HL
         LD     DE,16
         POP    HL
         ADD    HL,DE
         POP    HL
         POP    IY              ; [?]


BUP      LD     A,(DATO)
         INC    IY              ; [?]
         CP     0
         JR     Z,BUC0          ; [?]


BUD      LD     A,A,(DATO)      ; [?]
         BUD    DEFB   0        ; [?]
         POP    IY
         POP    HL
         RET


CARACT   LD     A,(DE)
         INC    H
         JR     ATTH            ; [?]


ATTH     LD     A,B
         SRA    A
         SRA    A
         ADD    A,A%58          ; [?] expresión rara
         LD     H,A
         PUSH   DE
         LD     DE,DIFE-1144    ; [?]
         ADD    HL,DE
         POP    DE
         POP    COMP2           ; [?]
         LD     (HL),A          ; [?]


COMP2    LD     A,(DE)
         DEC    A

         JR     NZ,FILA         ; [?]
         CPL                   ; [?]
         AND    (HL)
         EX     DE,HL           ; [?]
         OR     (HL)
         EX     DE,HL
         RET


MAS      AND    (HL)
         INC    DE
         EX     DE,HL
         OR     (HL)
         EX     DE,HL
         RET


COMP2B   LD     A,(DATO1)       ; [?]
         INC    DE
         CP     32
         JP     P,SIGUE         ; [?]

; --- [PÁGINA 5] IMPRES + COLUM + PANTHL + CARACT + ATTH + COMP2 + PLUS --

         LD     B,(IY+1)
         LD     D,(IX+3)
         LD     E,(IX+2)
         BIT    2,(IY+3)
         CALL   NZ,(IY+3)      ; [?]
         LD     A,C
         CP     33
         RET    P              ; [?]
         LD     B,A
         CALL   NZ,PONA
         PUSH   AF
         LD     A,(IX+1)
         BIT    2,(IY+3)
         CALL   NZ,PONA

FILA     POP    AF
         LD     A,(IX+0)


COLUM    PUSH   AF
         CALL   DIRE


PANTHL   PUSH   BC
         LD     B,(IY+0)


CARACT   LD     A,(DE)
         INC    H
         JR     ATTH


ATTH     LD     A,B
         SRA    A
         SRA    A
         ADD    A,%58           ; [?]
         LD     H,A
         PUSH   DE
         LD     DE,DIFE-1144
         ADD    HL,DE
         POP    DE
         POP    COMP2           ; [?]
         LD     (HL),A          ; [?]


COMP2    LD     A,(DE)
         DEC    A
         JR     NZ,PLUS         ; [?] o FILA


PLUS     LD     B,(IY+1)
         LD     A,NZ,COLUM      ; [?]


; --- [PÁGINA 6] FONA + COMPRU + INV + MAS + COMP2 + COCO + LOR + PONDE --

         JP     P,SIGUE         ; [?]
         POP    AF
         DEC    A
         JR     NZ,FILA
         ESPEJO ; [?]


FONA     BIT    4,(IY+3)
         JR     NZ,INV
         LD     A,3,(IY+3)      ; [?]
         JR     NZ,MAS

         RET


COMPRU   BIT    4,(IY+3)
         JR     NZ,INV
         OR     DE,HL           ; [?]
         BIT    3,(IY+3)
         JR     NZ,MAS
         RET


INV      CPL
         AND    (HL)
         EX     DE,HL
         OR     DE,HL           ; [?]
         EX     DE,HL
         RET


MAS      AND    (HL)
         INC    DE
         EX     DE,HL
         OR     (HL)
         EX     DE,HL
         RET


COMP2B   LD     A,(DATO1)
         INC    DE
         CP     32
         JR     NZ,COMP2
         LD     A,(DATO1)
         INC    DE,COLO         ; [?]


COCO     LD     A,(IY+4)
         RET


LOR      LD     A,(DE)
         INC    DE
         RET


PONDE    LD     DE,PANTA


PONN     AND    A
         RL     A
         AND    A
         RL     A

         BIT    0,(IY+3)
         JR     NZ,(IY+3)       ; [?]


ESPEJO   BIT    0,(IY+3)
         RET    Z
         LD     D,(IX+0)
         LD     E,(IX+1)
         CALL   NZ,FONA
         LD     (DATO),A        ; [?]
         LD     (DATO1),A       ; [?]
         B,A    ;ALTO            ; [?]


BU7      PUSH   BC

; --- [PÁGINA 7] BU2 + BUCLE + COCO + COLOR + BIBO + BU + BU4 + UCLE -----

BU2      LD     A,(DATO)
         LD     B,A
         LD     C,(IY+2)
         CALL   DIRE
         LD     B,8
         PUSH   HL
         POP    BC
         LD     A,(DATO1)  ;ANCHO
         ADD    A,A
         LD     B,A
         BIBO              ; [?]
         INC    HL
         POP    HL


BUCLE    LD     A,(DATO1)
         LD     B,A
         INC    DEC          ; [?] inválido
         LD     E,(IX)
         LD     A,(DE)
         BUCLE  ; [?] etiqueta repetida
         LD     (HL),A
         INC    HL
         DEC    HL
         INC    DE
         DJNZ   BUCLE
         INC    DEC          ; [?]
         BU2    ; [?] referencia
         JP     COCO


COLOR    LD     A,(IY+1)  ;COOR Y
         LD     HL,PANTA-32+5000
         LD     DE,32
         LD     A,B,A      ; [?]


BIBO     ADD    HL,DE
         DJNZ   BIBO
         LD     D,O
         LD     E,(IY+2)  ;COOR X
         ADD    HL,DE
         LD     A,(DATO1+1)
         LD     B,A    ;ALTO


BU       PUSH   BC
         LD     HL
         POP    DE


BU4      INC    DEC          ; [?]
         LD     A,(DATO1)  ;ANCHO
         BU4    ; [?]
         LD     E,(IX)


UCLE     LD     A,(IX)
         LD     A,(DE)
         LD     (HL),A
         LD     A,(IX+1)    ; [?]
         LD     (HL),A
         INC    DE
         INC    HL
         DEC    HL          ; [?]
         JP     PLUS         ; [?]
         BU     ;            ; [?]


SET1     EQU    44000
SET2     EQU    0           ; [?]


; --- [PÁGINA 8] FIN MAPPER --------------------------------------------------

         RET

SIGUE2   POP    AF
         JP     PLUS

; (resto: continúa flujo de impresión)

; =============================================================================
; FIN — dark1-mapper (CPANT)
; -----------------------------------------------------------------------------
; Rutinas principales:
;   PANTAL  → entrada principal: dibuja la pantalla actual
;   PANTME / PANTMA → cambia de pantalla (menos / más)
;   BUCLES / AMPLI → modos de impresión (loops y amplificación)
;   IMPRES  → imprime un bloque
;   DIRE    → calcula dirección de pantalla
;   FILA / COLUM / PANTHL → bucles internos
;   CARACT / ATTH → carácter + atributo
;   FONA / COMPRU / INV / MAS → modos de fusión (XOR, AND, OR)
;   COLOR   → calcula dirección de atributo
;   ESPEJO  → versión espejada
;
; SET1=44000, SET2=? — bases de las tablas de tiles.
; OCR muy degradado en pp. 4-7 (lógica BC0/BC1/BC2 y FONA/COMPRU).
; =============================================================================
