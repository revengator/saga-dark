; =============================================================================
; RUTINA DE CONTROL DEL ABUELO
; Módulo: dark1-abuelo
; Páginas escaneadas: 5 (dark1-abuelo-{1..5}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa. Páginas 4-5 son
;        básicamente datos gráficos del sprite del abuelo.
; =============================================================================

; --- [PÁGINA 1] SOUND2 + SOUND1 + BULE1 + BULE2 + PARI -----------------

SOUND2   LD     L,O
         LD     H,255
         CALL   SOUND1
         LD     H,1
         CALL   SOUND1
         RET


SOUND1   LD     B,200
         LD     C,1
         DEC    C
BULE1    JR     NZ,BULE1
         LD     A,%00011000
         OUT    (254),A
         LD     C,H
         DEC    C
BULE2    JR     NZ,BULE2
         LD     A,O
         OUT    (254),A
         LD     C,H
         DJNZ   BULE1
         RET


PARI     LD     A,L
         CP     0


; --- [PÁGINA 2] PARIPH + PODER + DAS + STOP + ABUELO ------------------

         INC    H
         RET


PARIPH   DEC    H
         RET


PODER    LD     A,(VAR12)
         CP     0
         RET    NZ
         LD     A,(DAS)
         CALL   NOSAL
         RET    Z
         LD     A,(DAS)
         DEC    A
         RET    NZ
         LD     A,2
         LD     (DAS),A
         LD     A,(VAR10)
         RET    NZ
         LD     A,(VAR10),A
         DEC    A
         RET    NZ
         LD     A,40
         LD     (VAR10),A
         LD     HL,TPO
         LD     A,(VAR0)
         AND    %00111111
         LD     B,O
         LD     C,A
         ADD    HL,BC
         ADD    HL,BC
         ADD    HL,BC
         LD     A,(HL)
         CP     0
         JP     Z,STOP
         LD     (VAR13),A
         LD     A,(VAR2)
         CALL   VAR21          ; [?]
         LD     A,(HL)
         INC    HL
         LD     A,(HL)
         CALL   DE,ABU         ; [?]
         CALL   MUPP
         LD     A,(ABU+2),HL
         RET


DAS      DEFB   2


STOP     LD     A,1
         LD     (VAR12),A
         RET


ABUELO   LD     A,(VAR13)
         CP     0
         RET    Z
         CALL   PONDAL         ; [?]
         LD     A,(DASI)        ; [?]

; --- [PÁGINA 3] ABAJ + ARRI + DASO + DASI + ABU + JU + JU2 + ABU/datos -

         CP     0
         RET    NZ
         LD     A,3
         LD     (DASO),A
         JP     Z,SOUND2
         CP     2
         JP     Z,JU2

ABAJ     LD     A,(ABU)
         SUB    2
         LD     (ABU),A
         RET

ARRI     LD     A,(ABU)
         INC    A
         INC    A
         RET


DASO     DEFB   25
DASI     DEFB   3


FIN      LD     A,O
         LD     (VAR13),A
         LD     A,25
         LD     (DASO),A
         LD     A,4
         LD     (DASI),A
         LD     A,(ABU)
         SUB    2
         CALL   AAAAAA          ; [?]
         CALL   MDOWN
         RET


JU       LD     A,2
         LD     (ABU+8),A
         RET


JU2      LD     A,1
         LD     (ABU+8),A
         LD     A,(VAR1)
         JP     FIN


ABU      DEFB   100,130,100,130,0,0,0,2,1,0
ABU1     DEFB   ?              ; [?] etiquetas estimadas
ABU2     DEFB   ?

; --- [PÁGINA 4] datos gráficos del sprite ABU --------------------------

         DEFB   6,4,0
yayo1    DEFB   255,0,255,0,18,0,255,0
         DEFB   255,0,248,0,0,237,127,0
         DEFB   255,0,240,7,0,82,63,128
         DEFB   255,0,224,10,0,169,31,64
         DEFB   255,0,224,12,0,2,15,160
         DEFB   255,0,192,12,0,241,7,208
         DEFB   255,0,192,14,0,80,7,176
         DEFB   255,0,128,58,0,173,7,80
         DEFB   255,0,128,51,0,92,3,200
         DEFB   255,0,128,42,0,249,3,200
         DEFB   255,0,192,21,0,250,7,128
         DEFB   255,0,224,11,0,249,15,64
         DEFB   255,0,224,2,0,245,7,80
         DEFB   255,0,224,9,0,196,5,216
         DEFB   255,0,240,0,0,10,3,188
         DEFB   231,0,252,1,0,82,1,68
         DEFB   195,24,254,0,0,172,1,156
         DEFB   129,44,254,0,0,168,1,140
         DEFB   128,58,248,1,0,177,0,82
         DEFB   128,58,248,2,0,128,0,42
         DEFB   0,122,248,2,0,0,0,38
         DEFB   0,86,248,2,0,58,0,2
         DEFB   128,38,248,2,0,61,0,106
         DEFB   192,26,252,1,0,4,0,170
         DEFB   225,12,248,2,0,6,0,170
         DEFB   240,4,252,2,0,63,0,86
         DEFB   248,3,253,0,0,255,0,90
         DEFB   248,3,128,2,0,199,0,86
         DEFB   252,3,120,2,0,107,0,86
         DEFB   252,1,124,2,0,63,0,42
         DEFB   254,1,126,0,89,0,178
         DEFB   255,0,128,0,127,0,170
         DEFB   254,0,140,0,165,1,4
         DEFB   252,1,148,2,0,103,0,162
         DEFB   248,7,170,0,0,107,0,178
         DEFB   240,15,213,0,0,1,68
         DEFB   252,1,32,142,0,165,1,4
         DEFB   252,1,112,2,0,64,0,162
         DEFB   254,0,110,16,1,4
         DEFB   255,0,198,16,224,0,3,148
         DEFB   255,0,199,16,160,4,2,16
         DEFB   255,0,7,16,160,2,0,76,1,4
         DEFB   255,0,7,16,224,0,127,0
         DEFB   255,0,3,16,224,1,255,0
         DEFB   255,0,0,16,224,0,255,0
         DEFB   255,0,0,16,224,0,255,0
         DEFB   255,0,0,16,255,0,255,0
         DEFB   255,0,0,16,160,4,255,0
         ;FIN1
         DEFB   0
         DEFB   6,4,0
yayo2    DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,240,7,0,88,63,128
         DEFB   255,0,224,9,0,237,127,0
         DEFB   255,0,128,58,0,77,3,88
         DEFB   255,0,128,51,0,44,7,192

; --- [PÁGINA 5] continuación de datos gráficos --------------------------

         DEFB   255,0,128,42,0,217,31,192
         DEFB   255,0,192,21,0,249,31,128
         DEFB   255,0,224,11,0,249,15,64
         DEFB   255,0,224,3,0,245,15,96
         DEFB   255,0,240,3,0,196,5,216
         DEFB   255,0,252,0,0,176,7,176
         DEFB   255,0,254,0,0,128,3,80
         DEFB   255,0,255,0,0,128,3,128
         DEFB   255,0,252,0,178,0,177,76
         DEFB   255,0,248,2,0,165,15,74
         DEFB   255,0,250,3,0,148,32,63,128
         DEFB   255,0,255,0,135,2,250,4
         DEFB   255,0,128,0,165,2,250,4
         DEFB   255,0,192,21,0,205,15,80
         DEFB   255,0,224,11,0,249,15,64
         DEFB   255,0,225,3,0,245,15,96
         DEFB   255,0,224,9,0,196,5,216
         DEFB   255,0,240,0,0,10,3,188
         DEFB   255,0,252,0,165,1,68
         DEFB   195,24,254,0,0,172,1,156
         DEFB   129,44,254,0,0,168,1,140
         DEFB   128,58,248,1,0,177,0,82
         DEFB   255,0,248,2,0,128,0,38
         DEFB   255,0,238,2,0,0,0,74
         DEFB   255,0,128,2,0,0,0,38
         DEFB   254,0,128,2,0,15,0,170
         DEFB   192,26,252,1,0,4,0,170
         DEFB   225,12,248,2,0,6,0,170
         DEFB   240,4,252,2,0,239,127,0
         DEFB   255,0,240,2,0,82,63,128
         DEFB   255,0,224,3,0,82,63,128
         DEFB   255,0,224,11,0,249,15,64
         DEFB   255,0,252,2,0,176,7,176
         DEFB   255,0,128,58,0,77,3,88
         DEFB   255,0,255,0,142,32,63,128
         DEFB   0,114,255,0,148,32,63,128
         DEFB   0,74,255,0,7,80,127,0,
         ;FIN2
         DEFB   0
         DEFB   6,4,0
yayo2B   DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,255,0,255,0,255,0
         DEFB   255,0,240,0,239,127,0
         DEFB   255,0,224,0,219,7,128
         DEFB   255,0,224,1,128,205,3,200


; =============================================================================
; FIN — dark1-abuelo
; -----------------------------------------------------------------------------
; Rutinas:
;   SOUND2/SOUND1 → beeper para diálogo del abuelo
;   PARI/PARIPH   → ¿variación de pitch?
;   PODER         → controla el frame del abuelo
;   ABUELO        → entrada principal — ABAJ/ARRI animan el sprite
;   ABU/ABU1/ABU2 → tabla de sprite (datos)
;   yayo1/yayo2   → frames del sprite
; =============================================================================
