; =============================================================================
; CPANT — Control de pintado de pantallas (mapper)
; -----------------------------------------------------------------------------
; Range:  0x6A9B - 0x6DAB (785 bytes)
; Pinta el decorado de la pantalla actual leyendo de la tabla PAN según VAR0.
; Soporta primitives con espejo (BIT 5 de flags), inversión, ampliación x2 y
; rotación.
;
; Variables:
;   VAR0  (0xA6C8) — pantalla actual (0..63)
;   PAN   (0xABDB-2 → 0xABDD) — tabla de punteros a definiciones de pantalla
;   PANTA (0xE6FE) — buffer de pantalla en RAM alta
; =============================================================================

; --- PANTAL — entry point: pinta pantalla VAR0 ------------------------------

PANTAL   LD     A,(VAR0)
         AND    0x3F
         LD     B,A
         INC    B

BUJA     INC    HL
         INC    HL
         DJNZ   BUJA
         LD     E,(HL)
         INC    HL
         LD     D,(HL)
         PUSH   DE
         POP    IY
         LD     B,(IY+0)
         INC    IY


; --- BUPP — bucle por cada elemento del decorado ----------------------------

BUPP     PUSH   BC
         LD     A,0
         LD     (DATO3),A

PONIX    CALL   PCNNN
         CALL   INCC
         CALL   INCZ
         POP    BC
         DJNZ   BUPP
         RET


; --- PCNNN — calcula IX desde IY (tabla 5 bytes) ----------------------------

PCNNN    LD     HL,0xABDB
         BIT    5,(IY+3)
         CALL   NZ,PCNNN_OFF
         LD     B,(IY+0)
         INC    B
         LD     DE,5
PCNNN_L  ADD    HL,DE
         DJNZ   PCNNN_L
         PUSH   HL
         POP    IX
         RET

PCNNN_OFF
         LD     HL,0xFFFB
         RET


; --- INCC — selecciona modo: PANTME / AMPLI / PANTHL ------------------------

INCC     BIT    1,(IY+3)
         JP     NZ,PANTME
         BIT    2,(IY+3)
         JP     NZ,AMPLI
         JP     PANTHL


; --- INCZ — avanza IY 4 bytes con bit 7/1 chequeo --------------------------

INCZ     PUSH   IY
         POP    IX
         LD     B,4
INCZ_L   INC    IY
         DJNZ   INCZ_L
         BIT    7,(IX+3)
         CALL   NZ,INCZ_INC
         BIT    1,(IX+3)
         CALL   NZ,INCZ_INC
         CALL   NZ,INCZ_INC
         RET

INCZ_INC INC    IY
         RET


; --- PANTMA / PANTME (ambas, código orphan al final del bloque) ------------
; Código alcanzable solo desde código en main_tail. PANTME decrementa VAR0,
; PANTMA lo incrementa (con saturación a 0..63).

         LD     A,(VAR0)
         AND    0x3F
         CP     0
         RET    Z
         DEC    A
         LD     (VAR0),A
         RET

         LD     A,(VAR0)
         AND    0x3F
         CP     0x3F
         RET    Z
         INC    A
         LD     (VAR0),A
         RET


; --- PANTME — pinta secuencia con bit 1 set (sub-bloque doble) -------------

PANTME   LD     D,(IY+4)
         LD     E,(IY+5)
         BIT    7,(IY+3)
         CALL   NZ,PANTME_HACK
         LD     H,(IY+1)
         LD     L,(IY+2)
         PUSH   HL
PANTME_O LD     B,D
PANTME_M PUSH   BC
         LD     B,E
PANTME_I PUSH   BC
         PUSH   DE
         CALL   PANTHL
         CALL   ATTH
         POP    DE
         POP    BC
         DJNZ   PANTME_I
         CALL   ATTV
         POP    BC
         POP    HL
         LD     (IY+2),L
         PUSH   HL
         DJNZ   PANTME_M
         POP    HL
         LD     (IY+1),H
         LD     (IY+2),L
         RET

PANTME_HACK
         LD     D,(IY+5)
         LD     E,(IY+6)
         RET


; --- PANTHL — selecciona AMPLI o BUCLE según bit 2 -------------------------

PANTHL   BIT    2,(IY+3)
         JP     NZ,AMPLI
         JP     BUCLE


; --- ATTH — actualiza posición Y según flags (3,5) -------------------------

ATTH     LD     A,(IY+3)
         AND    5
         CP     0
         JP     Z,ATTH_NORM
         CP     5
         JP     Z,ATTH_DBL
         LD     A,(IX+1)
ATTH_X2  ADD    A,A
         LD     D,(IY+2)
         ADD    A,D
         LD     (IY+2),A
         RET

ATTH_NORM
         LD     A,(IX+1)
         LD     D,(IY+2)
         ADD    A,D
         LD     (IY+2),A
         RET

ATTH_DBL LD     A,(IX+1)
         ADD    A,A
         JP     ATTH_X2


; --- ATTV — actualiza posición V según flags (2) ---------------------------

ATTV     BIT    2,(IY+3)
         JP     NZ,ATTV_DBL
         LD     A,(IY+1)
         LD     D,(IX+0)
         ADD    A,D
         LD     (IY+1),A
         RET

ATTV_DBL LD     A,(IX+0)
         ADD    A,A
         LD     D,(IY+1)
         ADD    A,D
         LD     (IY+1),A
         RET


; --- DATO3 — flag interno (data byte) --------------------------------------

DATO3    DEFB   0


; --- AMPLI_INIT (se entra desde AMPLI loop hack) ---------------------------

AMPLI_K  LD     A,1
         LD     (DATO3),A
         JP     BUCLE


; --- AMPLI — pinta sprite ampliado x2 ---------------------------------------

AMPLI    LD     H,(IX+3)
         LD     L,(IX+2)
         LD     A,(DATO3)
         INC    A
         LD     (DATO3),A
         CP     2
         JR     Z,AMPLI_K
         PUSH   IX
         PUSH   IY
         LD     D,(IX+1)
         LD     E,(IX+0)
         LD     (DATO_X),DE
         LD     B,(IX+0)
         PUSH   HL
         LD     DE,16
         LD     HL,0xE6FE
AMPLI_L1 ADD    HL,DE
         DJNZ   AMPLI_L1
         PUSH   HL
         POP    IY
         POP    HL
         LD     B,(IX+1)
         LD     IX,0xE6FE

AMPLI_L2 PUSH   BC
         LD     A,(DATO_X)
         LD     B,A
AMPLI_L3 PUSH   BC
         LD     C,8
AMPLI_L4 LD     A,(HL)
         LD     B,8
AMPLI_L5 RRA
         RR     D
         RR     E
         SRA    D
         RR     E
         DJNZ   AMPLI_L5
         LD     (IX+0),D
         LD     (IY+0),E
         LD     (IY+1),E
         LD     (IX+1),D
         INC    HL
         INC    IX
         INC    IY
         INC    IY
         INC    IX
         DEC    C
         JR     NZ,AMPLI_L4
         POP    BC
         DJNZ   AMPLI_L3
         LD     A,(DATO_X)
         LD     B,A
AMPLI_L6 PUSH   BC
         LD     B,16
AMPLI_L7 INC    IX
         INC    IY
         DJNZ   AMPLI_L7
         POP    BC
         DJNZ   AMPLI_L6
         POP    BC
         DJNZ   AMPLI_L2
         POP    IY
         POP    IX
         CALL   BUCLE
         RET


; --- BUCLE — núcleo de pintado (8 columnas) --------------------------------

BUCLE    LD     B,(IY+1)
         LD     D,(IX+3)
         LD     E,(IX+2)
         BIT    2,(IY+3)
         CALL   NZ,PONS2
         LD     C,(IY+2)
         LD     A,C
         CP     0x21
         RET    P
         LD     A,(IX+1)
         BIT    2,(IY+3)
         CALL   NZ,ATTH_DOUBLE

BUCLE_L1 PUSH   AF
         LD     A,(IX+0)
         BIT    2,(IY+3)
         CALL   NZ,ATTH_DOUBLE

BUCLE_L2 PUSH   AF
         CALL   PONNN
         PUSH   BC
         LD     B,8
BUCLE_L3 LD     A,(DE)
         CALL   FONA
         LD     (HL),A
         INC    DE
         INC    H
         DJNZ   BUCLE_L3
         POP    BC
         LD     A,B
         SRA    A
         SRA    A
         SRA    A
         ADD    A,0x58
         LD     H,A
         PUSH   DE
         LD     DE,0xA286
         ADD    HL,DE
         POP    DE
         CALL   PONDE
         LD     (HL),A
         POP    AF
         INC    B
         DEC    A
         JR     NZ,BUCLE_L2

BUCLE_END
         POP    AF
         LD     B,(IY+1)
         INC    C
         PUSH   AF
         LD     A,C
         CP     0x20
         JP     P,BUCLE_PEND
         POP    AF
         DEC    A
         JR     NZ,BUCLE_L1
         CALL   AMPLI2
         RET


; --- ATTH_DOUBLE — duplica A (×2) ------------------------------------------

ATTH_DOUBLE
         ADD    A,A
         RET


; --- FONA — aplica máscara/inversión según flags (3,4) ---------------------

FONA     BIT    4,(IY+3)
         JR     NZ,INV
         BIT    3,(IY+3)
         JR     NZ,MAS
         RET

INV      CPL
         AND    (HL)
         EX     DE,HL
         OR     (HL)
         EX     DE,HL
         RET

MAS      AND    (HL)
         INC    DE
         EX     DE,HL
         OR     (HL)
         EX     DE,HL
         RET


; --- PONDE — selecciona DE source según flags (6,7) -----------------------

PONDE    BIT    7,(IY+3)
         JR     NZ,PONDE_IY
         BIT    6,(IY+3)
         JR     NZ,PONDE_DE
         LD     A,(IX+4)
         RET

PONDE_IY LD     A,(IY+4)
         RET

PONDE_DE LD     A,(DE)
         INC    DE
         RET


; --- PONS2 — DE = PANTA (reset destino) ------------------------------------

PONS2    LD     DE,0xE6FE
         RET


; --- ESPEJO — AND DE/2; rotaciones ----------------------------------------

ESPEJO   AND    A
         RL     D
         AND    A
         RL     E
         RET


; --- AMPLI2 — segunda pasada de AMPLI (rotaciones bit 0) -------------------

AMPLI2   BIT    0,(IY+3)
         RET    Z
         LD     D,(IX+0)
         LD     E,(IX+1)
         BIT    2,(IY+3)
         CALL   NZ,ESPEJO
         LD     (DATO_W),DE
         PUSH   IX
         LD     A,(IY+1)
         LD     (DATO_X),A
         LD     A,(DATO_H)
         LD     B,A

AMPLI2_L1
         PUSH   BC
         LD     A,(DATO_X)
         LD     B,A
         LD     C,(IY+2)
         CALL   PONNN
         LD     B,8
AMPLI2_L2
         PUSH   BC
         PUSH   HL
         PUSH   HL
         POP    IX
         LD     A,(DATO_W)
         ADD    A,A
         DEC    A
         LD     B,A
AMPLI2_L3
         INC    HL
         DJNZ   AMPLI2_L3
         LD     D,0xFF
         LD     A,(DATO_W)
         LD     B,A
AMPLI2_L4
         LD     E,(IX+0)
         LD     A,(DE)
         LD     (HL),A
         INC    IX
         DEC    HL
         DJNZ   AMPLI2_L4
         POP    HL
         POP    BC
         INC    H
         DJNZ   AMPLI2_L2
         LD     A,(DATO_X)
         INC    A
         LD     (DATO_X),A
         POP    BC
         DJNZ   AMPLI2_L1
         CALL   ESPEJO2
         POP    IX
         RET


; --- DATO_W / DATO_H / DATO_X — buffers internos --------------------------

DATO_W   DEFB   0
DATO_H   DEFB   0
DATO_X   DEFB   0,0,0


; --- PONNN — calcula HL = pantalla pixel address (B=Y, C=X) ---------------

PONNN    LD     H,0x40
         LD     A,B
         AND    0x18
         ADD    A,H
         LD     H,A
         LD     A,B
         AND    0x07
         RRC    A
         RRC    A
         RRC    A
         ADD    A,C
         LD     L,A
         PUSH   DE
         POP    DE
         RET


; --- BUCLE_PEND — termina BUCLE (orphan continuation) ----------------------

BUCLE_PEND
         POP    AF
         CALL   AMPLI2
         RET

         POP    AF
         JP     BUCLE_END


; --- ESPEJO2 — rota área de attrs ------------------------------------------

ESPEJO2  LD     A,(IY+1)
         LD     HL,0xFA66
         LD     DE,0x20
         INC    A
         LD     B,A
ESPEJO2_L1
         ADD    HL,DE
         DJNZ   ESPEJO2_L1
         LD     D,0
         LD     E,(IY+2)
         ADD    HL,DE
         LD     A,(DATO_H)
         LD     B,A

ESPEJO2_L2
         PUSH   BC
         PUSH   HL
         PUSH   HL
         POP    DE
         LD     A,(DATO_W)
         ADD    A,A
         DEC    A
         LD     B,A
ESPEJO2_L3
         INC    HL
         DJNZ   ESPEJO2_L3
         LD     A,(DATO_W)
         LD     B,A
ESPEJO2_L4
         LD     A,(DE)
         LD     (HL),A
         INC    DE
         DEC    HL
         DJNZ   ESPEJO2_L4
         POP    HL
         LD     DE,0x20
         ADD    HL,DE
         POP    BC
         DJNZ   ESPEJO2_L2
         RET
