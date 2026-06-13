; =============================================================================
; FASE DEL DRAGON
; Módulo: dark3-dragon
; Páginas escaneadas: 18 (dark3-dragon-{01..18}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        Transcripción literal del listado en papel.
;        Para cotejar luego con `dragon/src/game.asm` y `dragon/src/43355.asm`
;        importados desde el repo `sagadark` (que pueden ser una recreación,
;        no el original).
; =============================================================================

; --- [PÁGINA 1] cabecera + ENDED + FRASE + MOVI/MOVE/VEL1 + TDO + tablas ---

         ORG    40000
         JP     INICIO


END      LD     A,(OK)           ; [?] (la etiqueta puede ser ENDED)
         CP     0
         JP     Z,INICIO
         LD     HL,FRASE
         CALL   ESCRIB
         LD     IX,45000
         LD     DE,6912+200      ; [?] dragon/src/ pone 6192+200
         LD     A,255
         SCF
         CALL   1366             ; ROM LD-BYTES
         LD     HL,45000
         LD     DE,16384
         LD     BC,6912
         LDIR
         JP     45000+6912


FRASE    DEFB   22,7,11,19,0,18,1,16,2,17,7
         DEFM   "PULSA PLAY"
         DEFB   255


MOVI     CALL   TECLAS
         CALL   TECLA2
MOVE     LD     A,(VELO)
         LD     C,A
         LD     A,(HOH)
         CP     1
         CALL   Z,TDO
         LD     A,C
         LD     B,0
         LD     HL,FILA
         LD     DE,22545
         CP     0
         JR     Z,VEL1
         LDIR
VEL1     LD     B,A
         LD     A,15
         SUB    B
         CP     0
         RET    Z
         LD     C,A
         LD     B,0
         LD     HL,CER
         LDIR
         RET


TDO      LD     C,15
         RET


VELO     DEFB   0
FILA     DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000

; --- [PÁGINA 2] FILA cont + CER + TECLA2 + UNA/DOS/COMPR/MIS/BAS + MENUS ---

         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01100000
         DEFB   %01110000

CER      DEFB   7,7,7,7,7,7,7,7,7,7,7,7,7,7,7


TECLA2   LD     A,(BAS)
         CP     0
         JR     Z,UNA
         LD     A,(TEII)
         CP     0
         CALL   NZ,MENUS         ; [?] (MENOS?)
         LD     A,(TEDE)
         CP     0
         CALL   NZ,MENUS         ; [?]
         JP     MIS

UNA      LD     A,0
         LD     (BAS),A
         JP     MIS

OOAA     LD     A,(TEII)         ; [?] (etiqueta UNA o similar)
         CP     0
         CALL   NZ,MENUS
         LD     A,1
         LD     (BAS),A
         JP     MIS

OOBB     LD     A,(TEII)         ; [?] (etiqueta DOS o similar)
         CP     0
         CALL   NZ,MENES
         LD     A,1
         LD     (BAS),A
         JP     MIS

MIS      LD     A,(VELO)
         CP     15
         RET    Z
         LD     (VELO),A
         RET


BAS      DEFB   0


MENUS    LD     A,(PAES)
         DEC    A
         CP     0
         JR     Z,MENES
         LD     (PAES),A
         RET


MENES    LD     A,1
         LD     (PAES),A
         RET


PAES     DEFB   3                ; [?]


TECLAS   LD     A,(BIS)
         CP     0
         JR     Z,UNO            ; [?]
         LD     A,(TEDE)
         CP     0
         RET    Z
         CALL   CERO             ; [?]
         RET


UNO      LD     A,(TEDE)
         CP     0
         JR     Z,MAS

; --- [PÁGINA 3] MAS/MENOS/MENAS + flags + COMPR + TABLA + SCROLL + S_BU* --

         JP     Z,MENDS          ; [?]
         LD     A,1
         LD     (BIS),A
         JP     MAS


MAS      LD     A,(VELO)
         CP     15
         RET    Z
         INC    A
         LD     (VELO),A
         RET


MENDS    LD     A,(PAUS)         ; [?] (MENOS)
         DEC    A
         CP     0
         JR     Z,MENAS
         LD     (PAUS),A
         RET


MENAS    LD     A,2
         LD     (PAUS),A
         LD     A,(VELO)
         CP     0
         RET    Z
         DEC    A
         LD     (VELO),A
         RET


PAUS     DEFB   2
BIS      DEFB   0
TEDE     DEFB   13               ; [?]
TEIZ     DEFB   14               ; [?]
T_SAL    DEFB   5                ; [?]


COMPR    LD     DE,TABLA
         LD     L,A
         LD     H,0
         ADD    HL,HL
         ADD    HL,DE
         LD     A,(HL)
         INC    HL
         IN     A,(254)
         AND    (HL)
         RET


TABLA    DEFB   247,1,247,2,247,4,247,8,247,16
         DEFB   239,16,239,8,239,4,239,2,239,1
         DEFB   251,1,251,2,251,4,251,8,251,16
         DEFB   223,16,223,8,223,4,223,2,223,1
         DEFB   253,1,253,2,253,4,253,8,253,16
         DEFB   191,16,191,8,191,4,191,2,191,1
         DEFB   254,1,254,2,254,4,254,8,254,16
         DEFB   127,16,127,8,127,4,127,2,127,1


SCROLL   LD     A,(VELO)
         CP     0
         RET    Z
         LD     HL,51709         ; [?]
         LD     C,64
         LD     A,0
S_BU1    LD     B,4
         EX     DE,HL
         RLD                     ; [?]
S_BU2    DEC    HL
         DJNZ   S_BU2
         EX     DE,HL
         LD     B,32

; --- [PÁGINA 4] S_BU3 + DATO/DATO1 + VOLCA1 (+VO_B1 LDI block) + IMPRE/CONT

         LD     B,A              ; [?] (S_BU3)
S_BU3    DEC    HL
         DJNZ   S_BU3
         JR     NZ,S_BU1         ; [?]
         LD     A,(DATO)
         CALL   VOLCA1
         RET


DATO     DEFB   1
DATO1    DEFB   2,1


VOLCA1   LD     HL,49662
         LD     DE,20480
         EXX
         LD     B,64
         HALT


VO_B1    EXX
         LDI                     ; (×N — bloque desenrollado de LDI)
         LDI                     ; ... el listado original repite LDI muchas veces
         LDI                     ; en lugar de hacer LDIR + DJNZ.
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
         DJNZ   VO_B1
         EXX
         RET


VEPO     LD     A,(DATO1)
         JP     CONT
IMPRE    LD     A,(DATO)
         CP     0
         JP     Z,VEPO
         RET    NZ               ; [?]
         LD     A,16
         LD     (DATO),A         ; [?]

; --- [PÁGINA 5] CONT (continúa GRAF) + GRAF + ESCRIB + B_ESC + PCOLOR ----
;                + P1 + P3 + TEXT2 + TEXT1 + FONT2 + CAMBIO ---------------

CONT     ADD    A,A              ; [?]
         LD     IX,GRAF-2
         LD     B,0
         LD     C,A
         ADD    IX,BC
         LD     L,(IX)
         LD     H,(IX+1)
         LD     DE,25
         ADD    HL,DE
         LD     DE,51966         ; [?]
         LD     B,64
BEVOL1   PUSH   BC
         LDD                     ; [?]
         LDD
         LDD
         LDD
         POP    BC
         DJNZ   BEVOL1
         RET


GRAF     DEFW   51966,52222,52478,52734,49117  ; [?] (5 palabras)


ESCRIB   PUSH   HL
         LD     A,2
         CALL   #1601            ; [?]
         POP    HL
B_ESC    LD     A,(HL)
         CP     255
         RET    Z
         RST    #10
         INC    HL
         JR     B_ESC


HL_      LD     HL,10            ; [?] (label)
         LD     DE,50
         CALL   949              ; [?]
         POP    HL
         HALT
         JR     B_ESC            ; [?]


PCOLOR   LD     HL,23040         ; [?]
         LD     B,64+128
         LD     A,%00000011
P1       LD     (HL),A
         INC    HL
         DJNZ   P1
         LD     A,%00000101
P3       LD     (HL),A
         INC    HL
         DJNZ   P3
         RET


TEXT2    DEFB   22,7,9,16,5,19,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,25
TEXT1    DEFB   33,34,35,36,32,34,37,38,39,35,39
         DEFB   33,34,35,36,32,34,37,38,39,35,39
FONT2    DEFB   0,0,0,0,0,0,0,0,62,125,240,192,192,114,126,126
         DEFB   0,0,60,124,98,114,114,144,114,114,98,98,66,68
         DEFB   0,0,60,124,98,114,114,144,114,114,98,98,66,68
         DEFB   0,0,64,98,98,114,144,144,114,114,114,98,98,66,66,66
         DEFB   0,0,64,98,98,114,114,144,114,98,28,56,48,0,96,96


CAMBIO   LD     A,(DATO)
         CP     0

; --- [PÁGINA 6] B_CAM2 + B_CAM + INICIO + INICI2 + IMPRE2 (LDI block) + TEB1

B_CAM2   LD     HL,(MAPA)        ; [?]
         LD     A,(HL)
         INC    HL
         LD     (MAPA),HL
         CP     0
         JP     Z,B_CAM2
         CP     2
         JP     Z,B_CAM2
         LD     A,2
         LD     (DATO1+1),A
         LD     A,1
         LD     (DATO1+1),A      ; [?] (segunda escritura)
         RET


B_CAM    LD     A,2
         LD     (DK),A           ; [?]
         DEC    HL
         LD     (MAPA),HL
         RET


INICIO   LD     HL,33088
         LD     DE,16384
         LD     BC,6912
         LDIR


INICI2   LD     A,29
         CALL   COMPR
         JR     NZ,INICI2


IMPRE2   CALL   3435             ; [?]
         CALL   SELO
         CALL   LUNA
         LD     A,0
         LD     (FALTA),A        ; [?]
         LD     (DK),A
         LD     (HOH),A
         LD     A,3
         LD     (D_REL),A
         LD     A,5
         LD     (SALGO),A
         LD     HL,FONT2
         DEC    A
         LD     (236063),A       ; [?] coordenadas/dirección
         LD     HL,TEXT1
         CALL   ESCRIB
         LD     H,60
         LD     L,0
         LD     (236063),HL      ; [?]
         CALL   IMPRE
         LD     A,2
         LD     (DATO1),A
         LD     A,1
         LD     (DATO1+1),A      ; [?]
         LD     A,0
         CALL   IMPRE             ; [?]
         LD     B,64

TEB1     PUSH   BC
         CALL   SCROLL
         CALL   IMPRE

; --- [PÁGINA 7] TEB1 cont + TEB2 + FIN/SALGO/MAPO/MAPP1 + VDRA + VDRA1 ----

         POP    BC               ; [?]
         DJNZ   TEB1
         LD     HL,TEXT2
         CALL   ESCRIB
         LD     HL,MAPO
         LD     (MAPA),HL


TEB2     CALL   SCROLL
         CALL   ABRIRS           ; [?]
         CALL   FUEGOS
         CALL   VOLTA
         CALL   ANDA
         CALL   SALTOS
         CALL   SALTMO
         CALL   IMPRES
         CALL   CAMBIO
         CALL   IMPRE
         CALL   MOVI
         CALL   RELOJ
         CALL   VDRA
         CALL   VER
         CALL   ESPERA
         CALL   OKS
         LD     A,(FIN)
         CP     1
         JP     Z,END
         JR     TEB2


FIN      DEFB   0
SALGO    DEFB   0
MAPO     DEFB   0
MAPP1    DEFB   1,1,1,2,1,1,1,1,2,1,1,1,1,2,1,1,1,1,2,1,1
         DEFB   2,1,1,1,2,1,1,1,1,1,1,1,1,1,2,1,1,1,1,2,1,1,1,2,1,2
         DEFB   1,1,2,1,2,1,1,1,1,2,1,1,1,1,2,1,1,1,1,2,1,1,1,2,1,1
         DEFB   1,1,2,2,1,1,2,2,1,1,2,2,2,1,1,2,1,1
         DEFB   1,1,2,1,0,0,0,0
         DEFB   0


VDRA     LD     HL,52991+64
         LD     A,(D_DRAC)
         AND    A
         RR     A
         LD     B,0
         LD     C,A
         ADD    HL,BC
         LD     DE,16384
         LD     B,128

VDRA1    LDI                      ; (×N — bloque desenrollado)
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

; --- [PÁGINA 8] VDRA1 cont + MAAS/D_DRAC/VER + MASS + SIGUE+ESPE1+SIG2-4

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
         LD     BC,80
         ADD    HL,BC
         LD     BC,16
         EX     DE,HL
         ADD    HL,BC
         EX     DE,HL
         DJNZ   VDRA1
         RET


MAAS     DEFB   12
D_DRAC   DEFB   32


VER      LD     A,(SALGO)
         CP     0
         RET    Z
         LD     A,(VELO)
         LD     C,MASS           ; [?]
         LD     A,(VELO)
         LD     A,11             ; [?]
         CP     0
         RET    Z
         LD     A,(MAAS)
         CP     0
         DEC    A
         LD     (MAAS),A
         CP     0
         RET    NZ
         LD     A,32
         LD     (D_DRAC),A
         LD     A,(MAAS)         ; [?]
         CP     0
         JP     Z,SIGUE2         ; [?]


MASS     LD     A,(D_DRAC)
         JP     Z,SIGUE2
         CALL   CFIN
         LD     A,(D_DRAC)
         DEC    A
         LD     A,(D_DRAC)       ; [?]
         CP     255
         CALL   FINAL
         LD     A,1
         LD     (FIN),A
         CALL   CA
         RET


SIGUE5   LD     A,0              ; [?]
         LD     (VELO),A
         LD     A,1
         LD     (FBOCA),A        ; [?]
         CALL   BOCA
         CALL   MOVE
         LD     HL,53054         ; [?]
         LD     B,128
         PUSH   HL
ESPE1    LD     HL,850
         HALT

; --- [PÁGINA 9] LDI massive block + CPASO + SIGUE2 + TERMI + TEB11 -------

         LD     DE,850           ; [?]
         DEC    DE
         LD     A,D
         OR     E
         JR     NZ,ESPE1         ; [?]
         POP    HL


SIGUE1   LDI                      ; (bloque grande de LDI desenrollados)
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
         LD     BC,64
         ADD    HL,BC
         EXX                     ; [?]
         DJNZ   SIGUE1
         CALL   COME
         LD     A,(DATCOL)
         INC    A
         LD     (DATCOL),A
         POP    DE
         POP    BC
         POP    HL


SIGUE2   CALL   CPASO
         LD     A,32
         LD     (D_DRAC),A
         RET                     ; [?]


CPASO    DEC    DE
         LD     A,D
         OR     E
         RET    Z
         JR     CPASO


TEB11    PUSH   BC
         LD     B,128
         LD     DE,16400         ; [?]

; --- [PÁGINA 10] TEB22 + ESPE5 + COME + CFIN + DATCOL/DASCOS + RELOJ etc.

ESPE5    LDI                      ; (otro bloque grande de LDI)
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
         LD     BC,80
         ADD    HL,BC
         EX     DE,HL
         LD     BC,16
         ADD    HL,BC
         EX     DE,HL
         DJNZ   TEB22            ; [?]
         POP    BC
         CALL   CFIN
         RET


TEB22    PUSH   BC
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
         LD     BC,80
         ADD    HL,BC
         EX     DE,HL
         LD     BC,16
         ADD    HL,BC
         EX     DE,HL
         POP    BC
         DJNZ   TEB22
         RET


CFIN     LD     A,(DASCOS)
         INC    A
         CP     255
         JP     Z,FINAL          ; [?]
         LD     (DASCOS),A
         RET


DATCOL   DEFB   0
DASCOS   DEFB   0


RELOJ    LD     A,(D_REL)
         INC    A
         CP     255
         JP     Z,PONDRA
         LD     (D_REL),A
         RET


D_REL    DEFB   0


PONDRA   LD     A,1
         LD     (SALGO),A
         LD     A,0
         LD     (D_REL),A
         RET


ESPERA   LD     A,(VELO)
         CP     0

; --- [PÁGINA 11] ESPE5 + LUNA + BLU1 + LU2 + OK/HOH/OKS1 + tablas TABLAR ---

         RET    Z
         HALT
         LD     A,A              ; [?]
         JR     NZ,ESPE5         ; [?] (ESPE5/ESPE1)


ESPE5_   HALT
         LD     DR,L             ; [?]
         JR     NZ,ESPE5_


LUNA     LD     DE,49373
         LD     B,4
         LD     HL,16439
BLU1     PUSH   BC
         PUSH   HL
         LD     B,8
LU2      PUSH   HL
         PUSH   BC
         LD     C,9              ; [?]
         EX     DE,HL
         LDIR
         POP    BC
         POP    HL
         INC    H
         DJNZ   LU2
         POP    HL
         LD     BC,32
         ADD    HL,BC
         POP    BC
         DJNZ   BLU1
         RET


OK       DEFB   0
HOH      DEFB   0


OKS      LD     A,(OK)
         CP     0
         RET    Z
         LD     A,1
         LD     (HOH),A
         LD     A,(D_DRAC)
         CP     32
         RET    NZ
         LD     A,5
         LD     (DATO1),A
         LD     A,0
         LD     (FALTA),A
OKS1     LD     A,1
         LD     (FIN),A
         JP     Z,OKS1           ; [?]
         LD     A,100
         JP     Z,OKS1           ; [?]
         LD     (FALTA),A
         LD     RET              ; [?] RET


FALTA    DEFB   0,1
TABLA1   DEFB   1
FASE     DEFB   7,4
TABLAR   DEFB   4
COORS    DEFW   17,17
         DEFW   47792,47796,48220,48224,48648,48652,48668,48892
         DEFW   17                ; [?]

; --- [PÁGINA 12] IMPRES + BIO/BI1/BI2/BI3 + DIRE + ROM + SALTO/SUBE/BAJA --

IMPRES   LD     A,(FASE)
         LD     B,A
         LD     DE,TABLA2-2      ; [?]
         INC    DE
         INC    DE
         DJNZ   BIO
         LD     L,A              ; [?]
         INC    DE
         INC    DE
         EX     DE,HL
         LD     HL,(COORS)       ; [?]
         INC    DE
         LD     HL,B,7           ; [?]
BI1      PUSH   BC
         PUSH   DE
         CALL   DIRE
         POP    DE
         POP    BC
         EX     DE,HL
         INC    DE
         INC    DE
         INC    DE
         DEC    C
         JR     NZ,BI2           ; [?]
         JR     NZ,BI1           ; [?]


BI2      LD     A,(HL)
         PUSH   HL
         INC    HL
         INC    HL
         LD     B,8
BI3      LD     A,(HL)
         INC    HL
         DEC    C
         JR     NZ,BI3
         RET


DIRE     LD     A,D
         SBC    A,16
         AND    7
         OR     7+128            ; [?]
         LD     D,A
         RET


ROM      LD     HL,0
         LD     A,(SALTO)
         CP     0
         RET    Z
         LD     L,A
         LD     A,4
         CP     0
         RET    Z
         JR     SUBIR            ; [?]
         INC    A
         LD     (SUBE),A         ; [?]
         CALL   SUBIR
         RET


SALTO    DEFB   0
SUBE     DEFB   0
BAJA     DEFB   0


CONT1    LD     A,(SUBE)
         CP     0
         JR     Z,PONA
         LD     A,(BAJA)
         DEC    A
         JP     Z,FINI
         LD     A,(BAJA)
         INC    A
         LD     (BAJA),A
         JP     Z,SUBIR
         LD     A,3              ; [?]
         RET                     ; [?]

; --- [PÁGINA 13] CONT1 + PONA + BAJ + FAS + PUPA + SALTOS + SALTMO -------

         RET    NZ               ; [?]
         LD     A,(VOL)          ; [?]
         CP     0
         RET    NZ
         LD     A,(FASE)
         CP     4
         CALL   Z,FAS
         LD     A,(FASE)
         JR     Z,BAJ
         LD     A,(FAS)
         CP     1
         JR     Z,BAJ
         LD     A,A              ; [?]
         CALL   Z,FAS
         INC    A
         LD     (FAS),A
         JR     A,2
         RET


FAS      DEFB   0


PONA     LD     A,0
         LD     (FAS),A
         LD     A,2
         LD     (BAJ),A
         RET


BAJ      LD     A,(FASE)
         DEC    A
         CP     0
         CALL   Z,FONA           ; [?]
         LD     (FASE),A
         RET


FAS_     LD     A,(SALTO)        ; [?]
         CP     0
         JR     Z,FAS1           ; [?]
         INC    A
         LD     (FASE),A
         RET


FAS1     LD     A,(FASE)
         RET    Z
         CP     0
         RET    Z
         RET                     ; [?]


PUPA     LD     A,(SALTO)
         CP     1
         RET    Z
         LD     A,1
         LD     (FASE),A
         LD     A,4
         LD     (FASE),A         ; [?]
         CALL   FBOCA            ; [?]
         RET


SALTOS   LD     A,(21265)        ; [?]
         CP     0
         JP     Z,PUPA
         LD     A,(T_SAL)
         CALL   COMPR
         RET    NZ
         LD     A,1
         LD     (SALTO),A
         CP     A,(FASE)         ; [?]
         LD     A,1              ; [?]
         RET    Z
         CP     2
         RET    Z
         CP     5
         RET    Z
         LD     A,2
         LD     (FASE),A         ; [?]
         RET                     ; [?]


SALTMO   LD     A,(SALTO)
         CP     0
         RET    Z

; --- [PÁGINA 14] SUBIR + BAJAR + FINI + BOCAS + BOCA1/2 + FUEGO ----------

         LD     A,(SUBE)         ; [?]
         CP     2
         JP     Z,FUE2
         JP     A,2              ; [?]


SUBIR    LD     A,(BAJA)
         INC    A
         LD     (BAJA),A
         CP     A,3
         JP     Z,BAJAR
         LD     A,(COORS+1)      ; [?]
         CP     0
         CALL   NZ,SUBE
         LD     A,1
         LD     (COORS+1),A      ; [?]
         RET


BAJAR    LD     A,(BAJA)
         DEC    A
         LD     (BAJA),A
         CP     0
         JR     Z,FINI
         LD     A,(COORS+1)
         CP     0
         CALL   NZ,BAJA          ; [?]
         RET


FINI     LD     A,0
         LD     (SALTO),A
         LD     A,7
         LD     (BAJA),A
         LD     A,2
         LD     (FAS),A
         LD     A,4
         LD     (BAJ),A
         LD     A,7
         LD     (FAS),A          ; [?]
         RET


BOCAS    DEFW   45668,46044,46420,46796,48008,48892   ; [?]
         DEFW   5                ; [?]


BOCA     LD     A,(FBOCA)
         LD     B,A
         LD     DE,BOCAS-2
BOCA1    INC    DE
         INC    DE
         DJNZ   BOCA1
         LD     A,(DE)
         LD     L,A
         INC    DE
         LD     A,(DE)
         LD     H,A
         LD     DE,59206
         LD     B,64
BOCA2    LDI
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
         EX     DE,HL
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
         POP    BC
         DJNZ   BOCA2
         RET


FUEGO    LD     A,(F1)

; --- [PÁGINA 15] F1 + FUE2 + FUEGOS + NOFUE + JIJI + COME ----------------

         CP     2
         JP     Z,FUE2
         JP     A,2              ; [?]
         LD     A,2
         LD     (FBOCA),A
         CALL   BOCA
         RET


F1       DEFB   0
FUE2     LD     A,0              ; [?]
         LD     (FBOCA),A
         CALL   BOCA
         RET


FUEGOS   CALL   JIJI
         RET    NC
         CALL   FUEGO
         RET


NOFUE    LD     A,(FBOCA)
         CP     1
         RET    Z
         LD     A,1
         LD     (FBOCA),A
         CALL   BOCA
         RET


JIJI     LD     A,(FBOCA)
         CP     1
         RET    Z
         LD     A,1
         LD     (FBOCA),A
         CALL   BOCA
         RET


JIJI2    LD     A,(FBOCA)        ; [?]
         CP     1
         RET    Z
         LD     A,(FASE)         ; [?]
         CP     5
         RET    Z
         CP     5                ; [?]
         RET    Z
         CP     2                ; [?]
         RET    Z
         LD     A,(JNO)
         CP     0
         RET    Z
         RET                     ; [?]


COME     LD     A,(JNO)
         CP     0
         RET    NZ
         LD     A,(VOL)
         CP     0
         RET    NZ
         CALL   COME             ; [?] recursión
         CP     1
         JP     Z,COME
         RET


; --- [PÁGINA 16] VOLTA/VOLTA1 + FINAL + JND + ABRIR/SENE + AB1/AB2 + VOL --

         CALL   SCROLL
         CALL   IMPRE
         CALL   CAMBIO
         POP    BC
         DJNZ   COME1            ; [?]


VOL      LD     A,5              ; [?]
FINAL    LD     A,(FBOCA)
         CALL   BOCA
         LD     A,10
         LD     (COORS+1),A
         LD     A,1
         LD     (JNO),A
         LD     A,7
         LD     (BAJA),A
         LD     A,2
         LD     (FASE),A
         LD     A,4
         LD     (FASE),A         ; [?] (segunda escritura)


JND      DEFB   1


ABRIR    LD     A,(D_DRAC)       ; [?]
         SBC    A,A              ; [?]
         RET    C                ; [?]


SENE     LD     DE,16384
         LD     HL,49117
         LD     C,A
         LD     B,8
ABRIR2   PUSH   HL
         PUSH   BC
         LD     C,A
         JP     Z,AB1            ; [?]
         LD     L,A
         LD     B,0
         JR     AB2
AB1      LD     A,(BOCA)         ; [?]
         CP     0
         JR     NZ,AB2
AB2      LD     A,(FBOCA)        ; [?]
         CP     0
         JP     Z,AB1
         LD     A,5
         LD     (FBOCA),A
         CALL   BOCA
         POP    BC               ; [?]
         POP    HL


VOLTA    LD     A,(VOL)
         CP     0
         JR     Z,COME           ; [?]
         CALL   COME
         RET


COME_    LD     A,(VOL)          ; [?]
         CP     2
         JR     Z,VOLE2          ; [?]
         INC    A
         LD     A,2
         LD     (VOL),A
         RET                     ; [?]


VOLE2    LD     A,4              ; [?]
         CP     0
         RET    Z
         LD     A,(FASE)
         CP     4
         RET    Z
         LD     A,(FASE)
         CP     5
         RET    Z


; --- [PÁGINA 17] SELO + SELO1 + SELO2 + ;PART 2 COLORES + CPASO + CP1 + CA

SELO     LD     HL,49117
         LD     DE,49662
         LD     B,64
         LD     C,8
SELO1    PUSH   HL
         PUSH   BC
         LD     BC,4
SELO2    LDIR                    ; [?]
         POP    BC
         POP    HL
         DEC    C
         JR     NZ,NZ,SELO2      ; [?]
         INC    HL
         INC    HL
         INC    HL
         INC    HL
         DJNZ   SELO1
         RET


         ;PART 2 COLORES


CFB      RET                      ; [?]


CPASO    LD     DE,22528
         LD     HL,43355+63       ; [?]
         LD     A,(DATCOL)
         LD     C,A
         LD     B,0
         AND    A
         SBC    HL,BC
         LD     B,16
CP1      PUSH   HL
         LD     BC,32
         LDIR
         POP    HL
         LD     BC,64
         ADD    HL,BC
         POP    BC
         DJNZ   CP1
         RET


CA       LD     DE,22528
         LD     HL,43355+63
         LD     A,(D_DRAC)
         AND    A
         RR     A                ; [?]
         LD     B,0
         RR     A                ; [?]
CA1      PUSH   HL
         LDIR
         LD     BC,32
         LDIR
         LD     BC,32             ; [?]
         LD     EX,HL,DE          ; [?]
         LDI                      ; [?]
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

; --- [PÁGINA 18] CFIN + CF1 ---------------------------------------------

CFIN     LD     DE,22544          ; [?] (probablemente 22528+16)
         LD     HL,43355+16
         LD     A,(DASCOS)
         LD     C,A
         LD     B,0
         AND    A
         SBC    HL,BC
         LD     B,16
CF1      PUSH   BC
         LD     BC,16
         LDIR
         LD     BC,16
         EX     DE,HL
         ADD    HL,BC
         EX     DE,HL
         LD     BC,80
         ADD    HL,BC
         POP    BC
         DJNZ   CF1
         RET


; =============================================================================
; FIN — dark3-dragon
; -----------------------------------------------------------------------------
; Fase Dragon — última fase del juego (escenario "puente con dragón").
;
; Estructura:
;   - INICIO       arranque + cargador de fase (CALL 1366 = ROM LD-BYTES)
;   - MOVI/MOVE    bucle principal de input/movimiento
;   - SCROLL       scroll horizontal del fondo (S_BU1/2/3)
;   - VOLCA1+VO_B1 transferencia masiva desenrollada (LDI×N) buffer→pantalla
;   - IMPRE/CAMBIO selecciona y dibuja siguiente sprite (DATO/MAPA)
;   - GRAF, ESCRIB rutinas de impresión de texto/colores
;   - PCOLOR/P1/P3 inicialización de atributos
;   - INICI2       espera teclas
;   - IMPRE2       inicializa pantalla (incluye SELO/LUNA, FONT2, TEXT1/TEXT2)
;   - TEB1         bucle scroll inicial
;   - TEB2         bucle de juego principal:
;                  SCROLL → ABRIRS → FUEGOS → VOLTA → ANDA → SALTOS →
;                  SALTMO → IMPRES → CAMBIO → IMPRE → MOVI → RELOJ →
;                  VDRA → VER → ESPERA → OKS
;   - VDRA/VDRA1   dibuja al dragón (sprite enorme), bloque LDI desenrollado
;   - SIGUE1..5    bloques masivos de LDI (frames de animación)
;   - CFIN/CPASO   avance del dragón hacia el jugador
;   - LUNA/BLU1    dibuja la luna en el cielo
;   - SALTOS/SALTMO/SUBIR/BAJAR/FINI lógica de saltos del personaje
;   - BOCAS/BOCA1/2 6 frames de la boca del dragón (FBOCA)
;   - FUEGO/FUE2/FUEGOS/JIJI/NOFUE animación del aliento de fuego
;   - VOLTA/COME/FINAL fin del juego
;   - SELO/SELO1/2 efecto de selección de colores
;   - CPASO/CP1/CA/CA1 actualización de atributos sobre 43355+63
;   - CFIN/CF1     scroll de la columna del dragón (43355+16)
;
; Bloque masivo:
;   - 43355 (= dirección base) corresponde al fichero `dragon/src/43355.asm`
;     en el repo `sagadark` importado.
;
; Pendiente:
; - Cotejar línea-a-línea con `dragon/src/game.asm` y `dragon/src/43355.asm`.
;   Las versiones del repo `sagadark` pueden ser una recreación posterior:
;   muchos labels coinciden (FRASE, MOVI, MOVE, VEL1, TDO, VELO, FILA…) pero
;   la organización en módulos puede no ser fiel al original.
; - Validar todas las líneas marcadas '; [?]' (lecturas dudosas del OCR).
; =============================================================================
