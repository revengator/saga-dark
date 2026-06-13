; =============================================================================
; RUTINA IMPRESION ALTA RESOLUCION
; CON MASCARA, PRIORIDADES Y ROTACIONES
; Módulo: dark1-hres-printing
; Páginas escaneadas: 11 (dark1-hres-printing-{01..11}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. Sprite blitter con rotaciones y máscara.
;        Marcas '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 1] AAAAAA + BUCLE0 + IMP1 -------------------------------------

         ;IMPRESION EN ALTA RESOL.
         ;CON MASCARA, PRIORIDADES
         ;Y ROTACIONES

AAAAAA   LD     HL,BUFFER
         LD     IX,TO         ; [?] o T0
         LD     B,(IX)
         DEC    IX
BUCLE0   PUSH   BC
         INC    IX
         LD     D,(IX+1)
         LD     E,(IX)
         PUSH   IX
         PUSH   DE
         POP    IY
         PUSH   DE
         POP    BC
         CALL   IMP1
         POP    IX
         POP    BC
         DJNZ   BUCLE0
         RET


IMP1     LD     B,(IX+8)
         LD     C,8
         INC    IX
         DEC    C
         JR     NZ,BUPO2
         INC    IX
         INC    IX
BUPO2    INC    IX
         INC    IX
         DJNZ   BUPO2
         LD     E,(IX)
         LD     D,(IX+1)
         PUSH   DE
         POP    IX

         LD     D,(IY+2)
         LD     A,0
         LD     B,3

USUS     AND    A
         RR     D
         RR     A
         DJNZ   USUS

         LD     C,A
         LD     A,D
         AND    %00000111     ; [?]
         LD     D,A

UJUJ     LD     A,E
         AND    %11000000     ; [?] máscara
         OR     C             ; [?]
         LD     E,A

         AND    %00111111
         OR     E
         LD     L,A
         LD     A,(IY+3)
         LD     E,(IY+3)
         LD     A,(IY+1)      ; [?]
         OR     E
         RR     E             ; [?]

UUU      LD     A,(IY+1)
         INC    IY
         LD     B,3
         LDIR

; --- [PÁGINA 2] continuación rotaciones + IMP2 -----------------------------

         LD     B,(IX)
         LD     E,(IX+1)
         CP     0
         CALL   NZ,PONMAS
         PUSH   BC
         PUSH   BC
         POP    DE
         PUSH   DE
         CALL   DIR1
         EX     DE,HL
BUCLE1   PUSH   DE
         LD     B,0
         PUSH   DE
         LD     C,(IX+1)
         LD     LDIR
         POP    DE
         LDIR
         POP    BC
         INC    BC
         POP    DE
         DJNZ   BUCLE1
         POP    BC
         POP    DE
         RET


PONMAS   INC    B
         RET

         ; (relleno entre rutinas)

         RET

         ;BBBBBB — entrada para tipo distinto

BBBBBB   LD     HL,BUFFER
         LD     IX,T0
         LD     B,(IX)
BUCLE0B  PUSH   BC
         INC    IX
         LD     D,(IX+1)
         LD     E,(IX)
         PUSH   IX
         PUSH   DE
         POP    IY
         CALL   IMP2
         POP    IX
         POP    BC
         DJNZ   BUCLE0B
         RET


IMP2     LD     B,(IX+8)
         LD     C,8
         INC    IX
         DEC    C
         JR     NZ,BPO2
         INC    IX
         INC    IX
BPO2     INC    IX
         INC    IX
         DJNZ   BPO2

; --- [PÁGINA 3] BPO + UUU + BCLE0/BCLE1 ------------------------------------

         JR     UUU           ; [?]


UUU2     LD     A,(IY+1)
         AND    A
         RR     A
         DJNZ   UUU2          ; [?]
         LD     C,A
         LD     A,B,3         ; [?]

UJUJ2    LD     A,E
         AND    %11100000
         OR     C
         LD     B,(IY+1)
         LD     E,(IY+1)
         RR     RR            ; [?] inválido
         LD     A,(IY+1)
         AND    A,(HL),A      ; [?]
         OR     B,3           ; [?]


UUU3     INC    IY
         INC    IY
         LD     B,3
         LD     C,(IX+1)
         LDIR
         PUSH   DE
         CP     0
         CALL   NZ,PONMAS
         POP    DE

BCLE1    PUSH   BC
         PUSH   DE
         LD     B,(IX+1)
         LD     C,6
         LDIR
         INC    DE
         INC    DE
         INC    DE
         POP    HL
         POP    BC
         DJNZ   BCLE1
         RET


CCCCCC   LD     IX,TO
BLE0     LD     B,(IX)        ; [?] BLE0 ó BCLE0
IMP3     LD     B,(IX+8)
         LD     C,(IX)        ; [?]
         LD     E,(IX+1)
         PUSH   DE
         POP    IY
         CALL   IMP3          ; [?] recursivo
         RET


IMP3B    PUSH   IX
         POP    IX
         CALL   IMP3
         POP    BC
         DJNZ   BLE0          ; [?]
         RET

; --- [PÁGINA 4] IMP3 + BSBS + RIACM + BJBJ + BKL + BHJB --------------------

         CALL   IMP3
         POP    IX
         POP    BC
         DJNZ   BLE0          ; [?]
         RET


IMP3X    PUSH   IX
         LD     B,(IX+8)
         PUSH   IX
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         INC    IX
         DJNZ   BUCLE9
         LD     L,(IY)
         LD     H,(IY+1)
         PUSH   HL
         POP    IY


RIACM    LD     D,(IX)
         LD     (IX+2),D
         LD     A,O
         LD     B,3

BSBS     AND    A
         RR     D
         RR     A
         DJNZ   BSBS

         DJNZ   BSBS
         LD     C,A
         LD     A,D
         AND    %00000111     ; [?]
         LD     D,A


BJBJ     LD     A,(DAT025),A  ; [?]
         LD     A,(DAT026),A  ; [?]
         LD     A,(DAT025),A  ; [?]
         LD     A,B
         LD     A,B           ; [?]
         LD     (CDR Y),A     ; [?]
         LD     E,(IX+1)
         LD     A,O
         LD     B,3

BKL      AND    A
         RR     E
         RR     A
         DJNZ   BKL


BHJB     LD     A,(DAT026)
         AND    A
         LD     A,(IY+2)
         LD     B,A,(IY+2)    ; [?]
         CP     B
         JP     C,(CDR),A     ; [?]
         LD     B,(DATO26)    ; [?]
         JP     P,ROTATE      ; [?]
         LD     H,A

; --- [PÁGINA 5] ROM + ROTATE + RODE + COBNN + JBU2 + JBU3 -----------------

         LD     B,A
         SUB    B,A           ; [?]
         LD     B,A
         INC    B
         LD     C,A
         CALL   ROIZ
         LD     A,(DATO26)
         LD     LD            ; [?] inválido
         CALL   IMP
         LD     CALL  ROTATE  ; [?]
         JP     RODE          ; [?]


RODE     SUB    B
         LD     B,A
         JP     COBNN

COBNN    INC    B

ROBE     RL     RR            ; [?] inválido
         POP    POP           ; [?] inválido
         JP     RET           ; [?]


CORY     CORY                 ; [?] línea vacía/etiqueta
         RODE   DEFB   0      ; [?]


         ;RUTINA DE ESPEJ
         ;SDERE
         ;IX TABLA
         ;ISDERE  SIZQUI

ESPEJ    LD     B,(IX+7)
BC23     PUSH   BC
         PUSH   IX
         CALL   CALGRA        ; [?] o algo similar
         CP     0
         JR     Z,P4          ; [?]
         LD     A,0
         LD     (IX+2),A      ; [?]
         PUSH   HL
         LD     DE,5
         PUSH   HL
         LD     DE,5
         POP    HL
         ADD    HL,DE
         POP    DE
         LD     A,(HL),A      ; [?]
         POP    POP           ; [?] inválido
         BC23   DEFB   0      ; [?]
         RET


SDERE    LD     A,(IX+6)
         LD     CP     0      ; [?]
         JR     Z,FIN11
         LD     CALL  ESPEJ   ; [?]


FIN11    POP    IX
         LD     B,(IX+6)      ; [?]


P4       LD     A,4
         LD     (IX+8),A
         JR     P5            ; [?]


SIZQUI   LD     A,(IX+6)      ; [?]
         CP     1
         JR     Z,FIN22
         LD     CALL  ESPEJ   ; [?]


FIN22    POP    IX
         POP    DE
         LD     (IX+6),A
         RET


SPEJO    LD     B,(IX)        ; [?]
         AND    A
         RL     B
         RL     B
         LD     C,(IX+1)
         PUSH   BC
         LD     DE,DE,BUFER   ; [?]
         POP    HL
         LD     B,0
         CALL   ?,(CIY+1)     ; [?]

; --- [PÁGINA 6] GRAFIC + MASK + BUBU + BUBO -------------------------------

         POP    HL
         CALL   SPEJO2        ; [?]
         DEC    HL
         DJNZ   BBC1          ; [?]


GRAFIC   PUSH   HL
         LD     A,(DE)
         LD     L,A
         LD     A,(HL)
         POP    HL
         INC    HL
         INC    HL
         DEC    DEC           ; [?]
         JP     NZ,GRAFIC


MASK     PUSH   HL
         LD     A,(DE)
         LD     L,A
         LD     A,(HL)
         POP    HL
         DEC    HL
         DEC    HL
         DEC    HL
         DEC    HL
         JP     NZ,MASK
         RET


PONE LA TABLA PARA  ; [?] cabecera/comentario
         ;LOS ESPEJS

PONLIS   LD     L,0
         LD     H,255
         LD     B,255
BUBU     PUSH   BC
         LD     B,8
         LD     A,0
BUBO     RL     C
         RL     A
         DJNZ   BUBO
         POP    BC
         LD     (HL),C
         INC    HL
         DJNZ   BUBU
         RET


SPEJO    EQU    $             ; [?]
         ;IX TABLA

SPEJO2   PUSH   HL
         LD     B,(IX+7)
         PUSH   IX
         CALL   CALGRA        ; [?]
         CP     0
         DEC    B
         JP     C,(IX+1)      ; [?]


P4B      LD     A,4
         LD     (IX+8),A      ; [?]
         RET                  ; [?]

; --- [PÁGINA 7] IMP + DAT025 + BUUS + COMPEW ------------------------------

         INC    HL
         INC    HL
         DJNZ   BUJ           ; [?]


BUK      POP    DE
         INC    DE
         POP    BC
         DJNZ   BUL
         RET


DIR1     PUSH   AF
         AND    %00000111     ; [?] LSB filas
         RRCA
         RRCA
         RRCA
         ADD    A,A
         LD     L,A


COMPI    LD     B,1           ; [?]
         CALL   B,(IX+8)      ; [?]
         CALL   ?,(DATO27)    ; [?]
         CP     0
         JP     NZ,COMPEW
         LD     A,(DATO27)
         INC    BUK           ; [?]


C4       POP    POP           ; [?]
         RET


COMPI2   LD     A,(DATO25)    ; [?]
         CP     0
         RET    Z
         LD     B,A,(DATO25)  ; [?]
         LD     INC    A      ; [?]
         JP     C,IY          ; [?]
         LD     C,(IY+1)      ; [?]


BUUS     LD     INC    D      ; [?]
         INC    H
         BUUS   DEFB   0      ; [?]
         CP     Z
         RET    NZ            ; [?]
         LD     A,(DATO25),A  ; [?]
         RET


COMPEW   LD     B,1           ; [?]
         PUSH   BC
         CALL   DIR1
         LD     A,(DATO27)
         LD     B,A
         LD     A,0
         LD     A,(DATO27),A  ; [?]
         JP     BUK
         RET                  ; [?]


DATO25   DEFB   0
DATO26   DEFB   0
DATO27   DEFB   0


DIRES    LD     A,B           ; [?]
         SBC    A,C            ; [?]
         JR     C,ROM         ; [?]
         LD     A,B
         RL     A             ; [?]


ROM      LD     HL,O          ; [?]
         RET                  ; [?]

; --- [PÁGINA 8] DDDDDD + BUDI + LDI repetidos -----------------------------

         LD     A,B
         SUB    B
         LD     B,A
         LD     H,A40         ; [?] '/A40' es offset
         AND    24
         ADD    A,A
         RRCA
         RRCA
         RRCA
         RRCA
         RRCA
         AND    A             ; [?]
         RRCA
         L,A    ; [?] mnemónico ausente
         RET

         ;ROM   — bloque que rellena
ROM      LD     HL,O          ; [?]
         RET


         ;DDDDDD — gran bloque LDI

DDDDDD   LD     HL,PANTA
         LD     DE,16384
         LD     A,B,128       ; [?]


BUDI     EXX
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         LDI
         EXX
         DJNZ   BUDI
         RET

; --- [PÁGINA 9] ESPEJ + ZB23 + SDERE + SIZQUI -----------------------------

         ;RUTINA DE ESPEJ
         ;IX TABLA
         ;ISDERE  SIZQUI

ESPEJ    LD     B,(IX+7)
ZBC23    PUSH   BC
         PUSH   IX
         CALL   CALGRA        ; [?]
         LD     A,(IX+2)
         CP     0
         JR     Z,P4
         LD     C,P4          ; [?]
         JR     Z,P4
         CALL   F5            ; [?]
         POP    HL
         LD     DE,5
         ADD    HL,DE
         POP    DE
         LD     A,(HL)
         INC    HL,A          ; [?]
         POP    BC23          ; [?]
         RET


SDERE    LD     A,(IX+6)
         CP     0
         JR     Z,FIN11
         CALL   ESPEJ
FIN11    POP    IX
         LD     B,(IX+6)      ; [?]


P4       LD     A,4
         LD     (IX+8),A
         JR     P5            ; [?]


SIZQUI   LD     A,(IX+6)
         CP     1
         JR     Z,FIN22
         CALL   ESPEJ
FIN22    POP    IX
         POP    DE
         LD     (IX+6),A
         RET


SPEJO    LD     B,(IX)
         AND    A
         RL     B
         RL     B
         LD     C,(IX+1)
         PUSH   BC
         LD     DE,BUFER      ; [?]
         POP    HL
         LD     B,O
         CALL   BBC1          ; [?]

; --- [PÁGINA 10] PONE LA TABLA PARA LOS ESPEJOS + GRAFIC + MASK ----------

         POP    HL
         CALL   SPEJO2
         DEC    HL
         DJNZ   BBC1


GRAFIC   PUSH   HL
         LD     A,(DE)
         LD     L,A
         LD     A,(HL)
         POP    HL
         INC    HL
         INC    HL
         INC    HL
         INC    HL
         POP    HL
         INC    HL
         DEC    DE            ; [?]
         JP     NZ,GRAFIC


MASK     PUSH   HL
         LD     A,(DE)
         LD     L,A
         LD     A,(HL)
         POP    HL
         DEC    HL
         DEC    HL
         DEC    HL
         DEC    HL
         JP     NZ,MASK
         RET


         ;PONE LA TABLA PARA
         ;LOS ESPEJOS

PONLIS   LD     L,0
         LD     H,255
         LD     B,255
BUBU     PUSH   BC
         LD     B,8
         LD     A,0
BUBO     RL     C
         RL     A
         DJNZ   BUBO
         POP    BC
         LD     (HL),C
         INC    HL
         DJNZ   BUBU
         RET


SPEJO    EQU    $             ; [?] ó nueva entrada
         ;IX TABLA

SPEJO2   ; (continúa rutina de espejo)

; --- [PÁGINA 11] CALGRA + BBC5 + BBC6 + BUFER ------------------------------

         LD     A,255
         LD     (HL),A
         RET


CALGRA   LD     C,8
BBC5     INC    IX
         DEC    C
         JP     NZ,BBC5
BBC6     INC    IX
         INC    IX
         DJNZ   BBC6
         LD     E,(IX)
         LD     D,(IX+1)
         PUSH   DE
         POP    IX
         RET


BUFER    DEFB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
         DEFB   0,0,0,0,0,0,0,0,0,0,0,0,0,0


; =============================================================================
; FIN — dark1-hres-printing
; -----------------------------------------------------------------------------
; Rutinas principales:
;   AAAAAA  → primer pase (impresión normal)
;   BBBBBB  → segundo pase (variación)
;   CCCCCC  → tercer pase
;   DDDDDD  → volcado de pantalla (LDIs masivos)
;   ESPEJ / SDERE / SIZQUI → rotación / espejo
;   PONLIS  → genera tabla de bit-reverso
;   GRAFIC / MASK → rutinas de gráfico y máscara
;   CALGRA  → recorre cabecera para llegar al gráfico
;
; OCR muy degradado en muchas líneas (especialmente pp. 4-7).
; Las funciones LDI repetidas (DDDDDD) son un volcado tipo unrolled-loop.
; =============================================================================
