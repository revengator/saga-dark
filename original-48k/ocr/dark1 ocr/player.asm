; =============================================================================
; RUTINA DE CONTROL DEL PERSONAJE
; Módulo: dark1-player
; Páginas escaneadas: 10 (dark1-player-{01..10}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo original. Marcas '; [?]' indican lecturas dudosas.
; =============================================================================

; --- [PÁGINA 1] COMPROBACION DE TECLADO + MOVIMIENTO HORIZONTAL -------------

         ;RUTINA DE COMPROBACION
         ;DEL TECLADO

         ;ENTRADA A=CODIGO
         ;SALIDA Z=PULSADA

COMPR    LD     D,A
         LD     A,(VAR14)
         CP     0
         JP     NZ,KEM
         LD     A,D
         LD     L,A
         LD     H,0
         LD     DE,TABLA
         ADD    HL,DE
         LD     A,(HL)
         LD     HL,(HL)       ; [?]
         INC    HL
         LD     HL            ; [?]
         IN     A,(254)
         AND    (HL)
         RET

KEM      IN     A,(31)        ; [?]
         AND    D
         CP     D
         RET


TABLA    DEFB   247,1,247,2,247,4,247,8,247,16
         DEFB   239,16,239,8,239,4,239,2,239,1
         DEFB   251,1,251,2,251,8,251,16,251,1   ; [?]
         DEFB   223,16,223,8,223,4,223,2,223,1
         DEFB   191,1,191,2,191,4,191,8,191,1
         DEFB   254,1,254,2,254,4,254,8,254,16
         DEFB   127,2,127,8,127,16,127,2,127,1   ; [?]
         DEFB   127,16,127,8,127,4,127,2,127,1


SALTO    DEFB   0


         ;MOVIMIENTO A LA DERECHA

VAR18M   CALL   FASE          ; [?] etiqueta — ¿VAR18 ó variante?
         RET    Z
         LD     IX,TABLA1
         LD     A,(IX+8)
         ADD    A,4
         LD     (IX+1),A
         LD     A,(IX+1)      ; [?]
         CP     B             ; [?]
         JR     Z,SIGB
         LD     IX,TABLA1
         LD     A,4
         ADD    A,(IX+1)
         LD     (IX+1),A
         CALL   SUELO
         JP     C,ANTIC

ANTIC    LD     IX,TABLA1
         LD     A,(IX+1)
         SUB    4
         LD     (IX+1),A
         LD     A,(IX)        ; [?]

; --- [PÁGINA 2] MOVIMIENTO + MPI/MPIES + MUELLE -----------------------------

         SUB    4
         LD     (IX+1),A
         RET


FASE     LD     IX,TABLA2
         LD     A,(IX+8)
         CP     1
         RET    Z

         LD     IX,TABLA1
         LD     A,(IX+8)
         JP     P,MPIES       ; [?]
         CP     3
         JR     Z,MPI
         INC    A
         JR     MPIES
MPI      LD     A,1
         LD     (IX+8),A
         JR     MPIES
MPIES    LD     A,(DAT3)      ; [?]
         CP     0
         JR     NZ,MPIES      ; [?]


MP1      LD     A,1
         LD     (IX+8),A
         LD     IX,TABLA2
         LD     A,(DAT3)
         CP     0
         RET
MP3      LD     A,(IX+8)      ; [?]
         CP     2
         JR     Z,MP4
         LD     A,(DAT3),A    ; [?]
         RET
MP4      LD     A,0
         LD     (DAT3),A
         LD     A,3
         LD     (IX+8),A
         RET
MP1B     LD     A,1           ; [?] segunda etiqueta MP1
         LD     (DAT3),A
         RET


CARGAS   PUSH   AF            ; [?] — observado en muchos sitios
         ; ... rutina de fondo

ANTI1    LD     A,(SALTO)
         CP     1
         JR     Z,FINITO
         LD     A,(IX+8)
         RET    Z
         LD     A,(IX)
         ADD    A,2
         LD     (IX),A
         CALL   SUELO
         JP     NC,FINITO
         LD     A,(IX)
         SUB    2
         LD     (IX),A
         RET

FINITO   LD     A,(IX)
         SUB    4
         LD     (IX),A
         RET

         ;LEVANTARSE

DESAM    LD     IX,TABLA2
         LD     A,(IX+8)
         CP     1
         RET    NZ
         LD     A,2
         LD     (IX+8),A
         LD     A,(IX)
         SUB    16
         LD     (IX),A
         LD     IX,TABLA1
         LD     A,(IX)
         SUB    16
         LD     (IX),A
         RET


DAT2     DEFB   0
DAT1     DEFB   0


         ;DISPARO

DISPAM   LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,0
         LD     (DAT2),A
         CALL   PUNTOS
         LD     IX,TABLA1
         LD     A,(IX+1)
         CP     0
         JP     Z,M,A48       ; [?]
         LD     A,(DAT1)
         JP     Z,SIG6        ; [?]
         JR     Z,SIG6
         LD     A,(IX+8)
         LD     A,(IX+8)
         LD     INC    A      ; [?]
         CP     6
         JR     Z,SIG
         LD     A,(IX+8)      ; [?]
         CP     5
         JP     Z,T1          ; [?]

; --- [PÁGINA 3] SIGNS + SIGB + SIG --------------------------------------

         CALL   ???           ; [?] línea borrosa
         LD     A,(IX+8)
         LD     A,(IX+8)      ; [?]
SIG6     LD     A,(IX)        ; [?]
         LD     ADD A,2       ; [?]
         CP     B             ; [?]
SIGB     LD     A,(IX+8)
         CP     8
         JP     Z,SIGGB       ; [?]


SIG      LD     A,(IX)
         LD     B,(IX+8)
         CP     2
         JP     Z,SIG1
         LD     A,(IX+1)
         CP     8
         JP     Z,SIG1
         LD     A,(IX)
         ADD    A,2
         CP     5
         JP     Z,SIG1
         LD     A,(IX+8)      ; [?]
         CP     B             ; [?]
         RET    NZ            ; [?]


T1       LD     A,(VAR7)      ; [?]
         CP     0
         JR     NZ,T1B        ; [?]
         CALL   ANTIC         ; [?]
         CALL   PEZ           ; [?]
         RET    NZ            ; [?]
         LD     IX,TABLA1
         LD     A,(IX+1)
         SUB    4
         LD     (IX+1),A
         CALL   SUELO
         JP     C,ANTIC
         RET


SIG1     LD     A,(IX)
         ADD    A,2
         LD     (IX),A
         RET


; --- [PÁGINA 4] CONTROL VARIOS (TABLA1/TABLA2) ----------------------------

         JR     Z,T2          ; [?]
         LD     A,(IX+1)
         SUB    8
         LD     (IX+1),A
         RET                  ; [?]


T3       LD     A,1           ; [?]
         LD     (DAT10),A     ; [?]
         RET


POWER    LD     A,(DIS)
         CP     1
         RET    Z
         LD     A,(DISA)
         CP     0
         RET    Z
         LD     A,1
         LD     (DAT2),A
         RET


CERO     LD     A,0
         LD     (DIS),A
         RET


DIS      DEFB   0
DISA     DEFB   0


         ;MOVIMIENTO A LA DERECHA

VAR19M   CALL   FASE
         RET    Z
         LD     IX,TABLA1
         LD     A,(IX+1)
         ADD    A,4
         LD     (IX+1),A
         LD     A,(IX+1)      ; [?]
         CP     B             ; [?]
         JR     Z,SIGB
         LD     IX,TABLA1
         LD     A,4
         ADD    A,(IX+1)
         LD     (IX+1),A
         CALL   SUELO
         JP     C,ANTIC
         RET


ANTICM   LD     IX,TABLA1
         LD     A,(IX+1)
         SUB    4
         LD     (IX+1),A
         LD     A,(IX)        ; [?]

; --- [PÁGINA 5] SALTO ARRIBA + MOVIMIENTOS COMBINADOS -----------------------

         SUB    4
         LD     (IX+1),A
         RET


         ;SALTO ARRIBA

SALTO1   LD     A,(SALTO)
         CP     1
         RET    NZ
         LD     A,(DAT4)      ; [?]
         CP     1
         JR     Z,?DESAM      ; [?]

PART1    LD     A,(DAT5)      ; [?]
         CP     14
         JR     Z,DESAM
         LD     CALL  COMPR   ; [?]
         JP     Z,DESPAM      ; [?]


P,DESAM  LD     A,?           ; [?]
         CP     0
         RET    Z
         JR     Z,FINP1       ; [?]
         LD     IX,TABLA1
         LD     A,(IX+8)
         SUB    4
         LD     (IX+8),A
         LD     A,(IX)
         SUB    4
         LD     (IX),A
         RET    Z

         LD     ADD    A,4    ; [?]
         CP     5
         RET    Z
         CALL   ADD    A,4    ; [?]
         RET


FINP1    LD     A,(IX+8)
         CP     2             ; [?]
         RET    Z
         JP     C,ANTI1
         LD     IX,TABLA1
         LD     A,(IX+8)
         RET    Z


PART2    LD     A,1
         LD     (DAT5),A      ; [?]
         RET


SS1      LD     A,(SALTO)
         CP     1
         JR     Z,SS3
         LD     A,(MOV1)      ; [?]
         CP     1
         JR     Z,DAT5        ; [?]
         LD     A,(IX+8)      ; [?]
         CP     ?
         JP     Z,SUEL        ; [?]
         LD     CALL  ANTI1   ; [?]
         RET


SS3      LD     A,1           ; [?]
         LD     (MOV1),A
         RET                  ; [?]


DAT3     DEFB   0
DAT4     DEFB   0
DAT5     DEFB   0
DAT6     DEFB   0


ANTIC    LD     IX,TABLA1
         LD     A,(IX+1)
         ADD    A,4
         LD     (IX+1),A
         LD     A,(IX)        ; [?]

; --- [PÁGINA 6] MOVI + RUTINA PRINCIPAL DEL PERSONAJE -----------------------

         ;RUTINA PRINCIPAL
         ;DE MOVIMIENTO

MOVI     LD     A,(VAR16)
         CALL   COMPR
         JR     Z,S1
         LD     A,(VAR18)
         CALL   COMPR
         JP     Z,VAR18M
         LD     A,(VAR19)
         CALL   COMPR
         JP     Z,VAR19M
         LD     A,(VAR17)
         CALL   COMPR
         JP     Z,DESAM
         LD     S5            ; [?]
         CALL   ?             ; [?]
         JR     S3            ; [?]


S5       LD     A,?           ; [?]
S3       LD     A,(VAR16)
         CALL   COMPR
         JP     Z,DISPAM
         CALL   POWER
         CALL   SALTO1
         CALL   ?,DISPA       ; [?]
         CALL   PMER          ; [?]
         CALL   GRAVE         ; [?]
         RET


VAR18M   CALL   VAR18M        ; [?] re-uso etiqueta
         JR     S5
VAR19M   CALL   VAR19M        ; [?] re-uso etiqueta
         JR     S5

DISPA    LD     A,(DAT2)      ; [?]
         CP     1
         RET    Z
         LD     A,1
         LD     (DAT2),A
         RET


S1       LD     A,(SALTO)
         CP     1
         JP     Z,S10         ; [?]
         LD     A,14          ; [?]
         LD     (DAT5),A      ; [?]
         LD     A,1
         LD     (SALTO),A
         RET


S10      LD     A,(SALTO)
         CP     1
         JP     Z,S3          ; [?]
         LD     A,(DAT5)
         CP     0             ; [?]
         JR     Z,SALTO       ; [?]
         LD     A,(DAT6)      ; [?]
         CP     1
         RET    Z


         ;GRAVEDAD

GRAVE    LD     A,(SALTO)
         CP     0
         RET    NZ            ; [?]
         LD     A,(IX)        ; [?]

; --- [PÁGINA 7] GRAVEDAD + GRAVE1 + S2 -------------------------------------

         JP     C,GRAVE1
         LD     IX,TABLA1
         LD     A,(IX)
         ADD    A,4
         LD     (IX),A
         RET


GRAVE1   LD     IX,TABLA2
         LD     A,(IX)
         SUB    4
         LD     (IX),A
         RET


         ; ----

S2       CALL   AGACHM
         JP     S3


         ;AGACHARSE

POWER    LD     A,(DIS)
         CP     1
         RET    Z
         LD     A,2
         LD     (DAT2),A
         RET


DAT030   DEFB   0


POWERX   LD     A,(DIS)       ; [?] etiqueta repetida
         CP     1
         RET    Z

         ; ----

DIS      DEFB   0             ; [?] redefinición
DISA     DEFB   0


         ;DETECCION DE SUELO
         ;DEL PERSONAJE

         IC     = 1 CHOQUE    ; [?] directiva o comentario

SUELO    LD     IX,TABLA2
         LD     A,(IX)
         ADD    A,32
         LD     D,A
         LD     A,(IX+1)
         ADD    A,A
         ADD    A,(IX+1)
         LD     E,A
         LD     A,(VAR0)
         INC    A
         LD     A,(VARO)      ; [?] o VAR0
         CP     IY,SUEL-2     ; [?]
         AND    %00111111
         LD     B,A
         LD     C,(IY)
         LD     H,(IY+1)
         LD     L,(IY+2)
BSSI1    INC    IY
         INC    IY
         DEC    C
         LD     A,(IY)
         LD     L,(IY)
         POP    HL
         LD     B,(IY)        ; [?]

; --- [PÁGINA 8] CONTINUACIÓN DETECCION SUELO + RUTINA POWERMETER ------------

BSSI2    LD     A,(IY+1)
         ADD    A,(IY+3)
         LD     H,A
         LD     A,(IX+1)
         ADD    A,A
         ADD    A,(IX+1)
         LD     B,A
         LD     A,NC,CONTT1   ; [?]
         LD     A,E
         SBC    A,(IY+1)
         CP     A             ; [?]
         JR     NC,CONTT1
         LD     A,(IY+2)
         ADD    A,(IY+4)
         LD     B,A
         LD     A,(IY+2)
         ADD    A,A
         JR     NC,CONTT1
         LD     A,(IY+2)
         ADD    A,(IY+2)
         LD     SBC    A,B    ; [?]
         JR     NC,CONTT1
         LD     A,(IY)
         SCF
         RET


CONTT1   INC    IY
         INC    IY
         INC    IY
         INC    IY
         DJNZ   BSSI2
         AND    A
         RET


         ;RUTINA POWERMETER UP

PERSO    LD     HL,20578+5+32+256
DESINT   LD     DE,2048
         LD     B,1
         LD     C,48
UK       LD     PUSH   DE     ; [?]
         PUSH   BC

         LD     DE,256-18     ; [?]

ER       LD     B,18
         SET    7,(HL)
         RR     RR            ; [?] mnemónico inválido
         INC    HL
         LD     HL,L          ; [?]
         AND    A
         JP     NZ,ER
         POP    BC
         POP    DE
         JP     NZ,ER
         LD     A,(VAR8)
         SBC    A,B
         LD     A,(VAR8)
         INC    A
         JR     Z,ATO
         RR     A             ; [?]
         LD     (VAR8),A      ; [?]
         RET                  ; [?]


OTE      LD     (HL),B        ; [?]
         SET    7,(HL)
         RR     (HL)
         POP    DE
         INC    DE
         DEC    DEC           ; [?] inválido
         LD     A,(FUERZA)
         CP     48
         JR     Z,SI          ; [?]
         DJNZ   ATO           ; [?]
         ADD    A,(VARB)      ; [?]

; --- [PÁGINA 9] DESINTEGRA + JUDER + JAPUT + ATO ---------------------------

         CP     3
         RET    Z
         LD     A,(VARB)
         LD     A,0           ; [?]
         LD     (FUERZA),A
         RET


         ;DESINTEGRA

PUNTOS   LD     A,(VAR7)
         CP     0
         JR     Z,(POW),A     ; [?]
         CP     1
         JR     A,6           ; [?]
         JR     Z,(POW),A     ; [?]

TR3      LD     CP     2      ; [?]
         JP     NZ,QUESE      ; [?]
         LD     A,12
         LD     (POW),A
         RET                  ; [?]


QUESE    CP     3
         JP     NZ,LEFT       ; [?]
         LD     A,?           ; [?]


LEFT     LD     HL,20088+256+256
DOS      LD     B,1
         LD     C,32
GB       PUSH   DE
         PUSH   BC
         LD     DE,256+18     ; [?]


BUR      DEC    DE
         DEC    DE
         JP     Z,JUDER       ; [?]


JUDER    LD     B,(IY)        ; [?]
         LD     A,(POW)
         JP     NZ,BUR        ; [?]
         LD     C,6
         LD     B,18
         LD     A,(POW)
         CP     0


JAPUT    DEC    B
         DEC    B
         JP     Z,ATO         ; [?]


ATO      AND    (HL)          ; [?]
         OR     A             ; [?]
         LD     A,(HL)        ; [?]
         RL     RL            ; [?] inválido
         DEC    HL
         DEC    HL
         DEC    HL


JODER    JP     NZ,JODER      ; [?]
         POP    BC
         POP    DE
         AND    A
         SBC    HL,DE
         PUSH   HL

; --- [PÁGINA 10] FIN GB + POW/CUATRO/FUERZA --------------------------------

         ADD    HL,BC
         POP    BC
         DJNZ   GB
         LD     A,(VAR7)
         LD     (VAR8),A
         LD     (FUERZA),A
         RET


POW      DEFB   0
CUATRO   DEFB   0
FUERZA   DEFB   0

         DEFB   0,0,0,0,0,0,0,0,0,0,0,0,0


; =============================================================================
; FIN DE LA TRANSCRIPCIÓN — dark1-player
; -----------------------------------------------------------------------------
; Etiquetas externas referenciadas:
;   FASE, PUNTOS (¿definida abajo?), POW, FUERZA, VAR7, VAR8, VAR16-19,
;   TABLA1, TABLA2, SALTO (también externa)
; Notas:
;   - Hay etiquetas duplicadas (POWER, ANTIC, MP1) — corregir al portar
;     a sjasmplus.
;   - Páginas 7-9 con OCR muy degradado, especialmente las rutinas
;     de detección de suelo y desintegración.
;   - VAR16-19 son códigos de tecla; ver mapeo en TABLA al inicio.
; =============================================================================
