; =============================================================================
; SAGA DARK — FASE 2 — MAIN (BLOQUE 1)
; Módulo: dark2-main
; Páginas escaneadas: 12 (dark2-main-{01..12}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        Las páginas 11-12 ya empiezan el módulo TRIMONSTER (control del
;        enemigo); se incluyen aquí porque están en el mismo PDF.
; =============================================================================

; --- [PÁGINA 1] DIRECCIONES DE MEMORIA — SAGA DARK FASE 2 ------------------
;
;   23850  GRAFICOS PERSONAJE      3423 BYTES
;   27275  PROGRAMA  ENTRADA:43976
;   44000  DATOS GRAFICOS PANTALLAS 255 BYTES
;   44999  PILA
;   45000  GRAFICOS PANTALLA  9016 BYTES
;   54016  DATOS MOV GLOBMAN (GLOMOV)  554 BYTES
;   54790  DPERSO  (PONE LA CARA DEL PERSONAJE)
;   54811  DMALO    ( "    "    "    "   GLOBMAN)
;   54869  MUERE   (BORRA CARA DEL PERSONAJE)
;   54930  VIVE    ( "     "     "    GLOBMAN)
;   55000  DATOS PANTALLAS DECORADO  1304 BYTES
;   56310  ENEMI1  (GRAF. GLOBMAN)  1816 BYTES
;   58892  CARA DEL PERSONAJE  72 BYTES  3#3
;   58964  CARA DEL GLOBMAN    72 BYTES  3#3
;   59037  GRAFICO DEL "FIN"  96 BYTES
;   59134  PANTALLA N.2 DIFE:42750  4096 BYTES
;   62230  BUFFER  2048 BYTES
;   65279  TABLA DE ESPEJO  256 BYTES
;          CARGADOR FASE 2
;
;   CARGA PANTALLA FIN  58167,7112
;   CARGADOR DEL CARGADOR FASE 3  58167+6912


; --- [PÁGINA 2] MAIN.F2 BLOQUE 1 — cabecera + CALLs + EQUs + tablas -------

         *D+
         *C-

         ORG    27275


         *F     CPANT
         *F     COLAS
         *F     ABUELO
         *F     IMPRESION
         *F     PERSO
         *F     PODERES
         *F     CHOQUES
         *L+
         *L-
         *F     ARMADURA
         *F     TRIMONSTER
         *F     FUEGO
         *F     SIERRA
         *F     DEMONIO
         *F     PINCHO
         *F     SALTARON
         *F     LLAMARON
         *F     GLOBO


         DEFB   0


POD4     DEFB   14
VAR21    DEFB   255
VAR22    DEFB   1
VAR23    DEFB   0
VAR24    DEFB   0
VAR12    DEFB   0
VAR10    DEFB   0
VAR1     DEFB   0
VAR13    DEFB   0
VAR16    EQU    27269            ; [?]
VAR17    EQU    27270
VAR18    EQU    27271
VAR19    EQU    27272
VAR20    EQU    27273
VAR4     EQU    27274
VAR45    EQU    27275            ; [?]
VAR46    EQU    27276            ; [?]
VAR7     DEFB   0
VAR8     DEFB   0
VAR9     DEFB   0
VAR25    DEFB   15               ; [?]
VAR2     DEFB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


DIFE     EQU    42750
BUFFER   EQU    63220
PANTA    EQU    59134
TAS1     EQU    0                ; [?]
TABLA1   EQU    23850            ; [?]
TABLA2   EQU    23878
SIDE1    EQU    23890
SIDE2    EQU    23911
WIND1    EQU    23930
WIND2    EQU    23942
DPERSO   EQU    54790
DMALO    EQU    54811

; --- [PÁGINA 3] MUERE/VIVE EQUs + VAR0 + PAN + HAY + SUELO FASE 1 + TPO ---

MUERE    EQU    54869
VIVE     EQU    54930
VAR0     DEFB   0


         ;DECORADOS

PAN      DEFW   HAY,HAY+100,HAY+195,HAY+282,HAY+367
         DEFW   HAY+462,HAY+559,HAY+674,HAY+788,HAY+890,HAY+959
         DEFW   HAY+1024,HAY+1121,HAY+1216,HAY+1261

HAY      EQU    55000
T0       DEFB   0,0,0,0,0,0,0,0


         ;SUELO FASE 1

SUEL     DEFW   PANT1
         DEFW   PANT2,PANT3,PANT4,PANT5,PANT6,PANT7,PANT8,PANT9
         DEFW   PANT10,PANT11,PANT12,PANT13,PANT14,PANT15

PANT1    DEFB   1
         DEFB   192,0,40,255
PANT2    DEFB   2
         DEFB   192,0,40,104
         DEFB   192,160,40,87
PANT3    DEFB   1
         DEFB   192,40,40,207
PANT4    DEFB   1
         DEFB   192,0,40,255
PANT5    DEFB   1
         DEFB   192,0,40,255
PANT6    DEFB   2
         DEFB   192,0,40,80
         DEFB   192,136,40,119
PANT7    DEFB   4
         DEFB   192,0,40,16
         DEFB   192,64,40,24
         DEFB   192,138,40,24
         DEFB   192,208,40,47
PANT8    DEFB   1
         DEFB   192,0,40,255
PANT9    DEFB   1
         DEFB   192,0,40,255
PANT10   DEFB   1
         DEFB   192,0,40,255
PANT11   DEFB   1
         DEFB   192,0,40,255
PANT12   DEFB   1
         DEFB   192,0,40,255
PANT13   DEFB   1
         DEFB   192,0,40,255
PANT14   DEFB   1
         DEFB   192,0,40,255
PANT15   DEFB   1
         DEFB   192,0,40,255


         ;TABLA DE PODERES

TP0      DEFB   0,0,0,0,0
         DEFB   0,0,0,0,0,0,0,0,0
         DEFB   0,0
         DEFB   3,72,200
         DEFB   0,0,0,0,0,0
         DEFB   0,0,0,0,0,0,0,0,0
         DEFB   0,0
         DEFB   5,72,200
         DEFB   0,0,0,0,0,0

; --- [PÁGINA 4] ;DARK + TART + NEGRO + INICIO + STAR + TABLA2 + MAIN loop --

         ;DARK

         *L+
TART     CALL   NEGRO
         *L-

         LD     A,0
         LD     HL,16384
         LD     (HL),A
         LD     DE,16385
         LD     BC,4095
         LDIR
         CALL   INICIO
         DI
         LD     HL,(VAR14)+A     ; [?]
         CALL   PONLIS
         LD     A,0

STAR     CALL   PONCO            ; [?]
         CALL   DPERSO
         CALL   DMALO
         CALL   NEGRO
         CALL   BORRA
         CALL   VUELCA
         CALL   BBBBBB

         LD     A,(VAR16)
         CP     255
         JR     NZ,MAIN
         LD     A,(TRUCOD)
         CP     0
         JR     Z,MAIN
         CALL   TRUCO            ; [?]


MAIN     CALL   AAAAAA
         CALL   PODER
         CALL   PODERES
         CALL   ABUELO
         CALL   MOVI             ; [?]
         CALL   SALIR
         CALL   BICHOS
         LD     A,(TABLA2)
         CP     224              ; [?]
         JP     Z,MORTE
         CP     164
         JP     Z,MORTE          ; [?]
         CP     1
         CALL   A,(MUER)         ; [?]
         CALL   A,(DAMA2)        ; [?]
         CP     20
         JP     Z,CARGA
         CALL   BBBBBB
         CALL   CCCCCC
         CALL   DDDDDD
         JP     MAIN


TRUCO    LD     A,(VAR16)
         LD     (TRUCOD),A
         LD     A,255
         LD     (VAR16),A
         RET


TRUCOD   DEFB   0


MORTE    LD     A,0
         LD     (PERSO+1),A      ; [?]

; --- [PÁGINA 5] MORTE/MUER + VARMA + BABU1 + CASIRA + MUERTE + BICHOS -----

         LD     (VARMA),A
         LD     (MUER),A
         LD     (VAR0),A
         LD     A,160
         LD     (TABLA2),A
         LD     A,(TABLA2+1),A   ; [?]
         LD     A,60
         LD     (TABLA2+2),A
         LD     A,(TABLA2+3),A   ; [?]
         LD     A,129
         LD     (TABLA1),A
         LD     A,(TABLA1+1),A   ; [?]
         LD     A,3
         LD     (TABLA1+2),A
         LD     A,(TABLA1+3),A   ; [?]
         LD     (TABLA1+8),A
         LD     A,96
         LD     (NU1),A
         LD     A,0
         LD     (NU2),A
         LD     HL,VAR2
         LD     B,20
         LD     A,0
BABU1    LD     (HL),A
         INC    HL
         DJNZ   BABU1
         LD     DE,VAR2
         JP     NUEVO


CASIRA   CALL   DPERSO
         LD     A,0
         LD     (NU2),A
         LD     A,96
         LD     (NU1),A
         RET


MUERTE   LD     A,(NU1)
         DEC    A
         LD     (NU1),A
         LD     A,(NU2)
         INC    A
         LD     (NU2),A
         CP     4
         RET    NZ
         CALL   MUERE
         LD     A,0
         LD     (NU2),A
         LD     A,(NU1)
         CP     0
         RET    NZ
         LD     A,1
         LD     (MUER),A
         RET


NU1      DEFB   96
NU2      DEFB   0
NUEVO    LD     A,(VAR0)         ; [?]

; --- [PÁGINA 6] NUEVO + BICHOS dispatcher + PA00..PA04 dispatch -----------

         LD     (E1),A
         LD     (E2),A
         LD     (E3),A
         LD     (VAR48),A        ; [?]
         LD     (VAR49),A        ; [?]
         LD     (VAR12),A
         LD     (VAR8),A
         JP     STAR


E1       DEFB   0
E2       DEFB   0
E3       DEFB   0
E4       DEFB   0


BICHOS   LD     A,(TABLA1+8)
         CP     5
         CALL   Z,SONI1


         LD     A,(VAR0)
         CP     0
         JP     Z,PA00
         CP     1
         JP     Z,PA01
         CP     2
         JP     Z,PA02
         CP     3
         JP     Z,PA03
         CP     4
         JP     Z,PA04
         CP     5
         JP     Z,PA05
         CP     6
         JP     Z,PA06
         CP     7
         JP     Z,PA07
         CP     8
         JP     Z,PA08
         CP     9
         JP     Z,PA09
         CP     10
         JP     Z,PA10
         CP     11
         JP     Z,PA11
         CP     12
         JP     Z,PA12
         CP     13
         JP     Z,PA13


PA00     JP     TRIVI            ; (Fase 0: TRIMONSTER)
PA01     CALL   DEMON
         JP     SALTA
PA02     JP     DEMON
PA03     CALL   ARMADU
         JP     TRIVI

; --- [PÁGINA 7] PA04..PA13 dispatch + SONI* sonidos -----------------------

PA04     CALL   DEMON
         JP     LLAMAS           ; [?]
PA05     CALL   DEMON
         JP     SALTA
PA06     JP     DEMON
PA07     CALL   ARMADU
         JP     TRIVI
PA08     CALL   FUEGO
         JP     SIERRA
PA09     CALL   FUEGO
         JP     PINCHO
         JP     SIERRA           ; [?]
PA10     CALL   FUEGO
         JP     PINCHO
         JP     SIERRA
PA11     CALL   ARMADU
         JP     LLAMAS
PA12     CALL   FUEGO
         JP     SALTA
         JP     ARMADU           ; [?]
PA13     JP     PINCHO
PA14     JP     GLOBO


SONI1    LD     B,16
         JP     SONI


SONI2    LD     B,20
         JP     SONI


SONI3    LD     B,8
         JP     SONI


SONI4    LD     B,40
         JP     SONI


SONI     LD     C,B
         LD     A,%11111000
         OUT    (254),A
         LD     B,C
SONIM4   PUSH   BC
         DJNZ   $
         LD     A,B,C            ; [?]
         POP    BC
         OUT    (254),A
         LD     B,C
SONIM3   PUSH   BC
         DJNZ   $
         POP    BC
         RET

; --- [PÁGINA 8] FMA*/FMA10 + CARGA + CARGA1 -------------------------------

FMA      LD     BC,608
         LD     HL,22528
FMA1     LD     A,(HL)
         INC    HL
         DEC    BC
         CP     0
         RET    Z
         LD     A,B
         OR     C
         JR     NZ,FMA1
         RET


FMA2     LD     DE,65535         ; [?]
         DEC    DE
         LD     A,D
         OR     C
         JP     NZ,FMA1          ; [?]
         LD     B,3
FMA3     LD     HL,16284+2048+14 ; [?]
FMA4     PUSH   BC
         PUSH   DE
         LD     B,8
FMA5     PUSH   BC
         PUSH   DE
         LD     BC,4
         LDIR
         POP    DE
         INC    POP             ; [?] (POP DE)
         POP    BC
         DJNZ   FMA5
         POP    DE
         INC    DE
         POP    BC
         LD     HL,22791         ; [?]
FMA6     ADD    HL,DE
         LD     BC,32
         EX     DE,HL
         ADD    HL,BC
         EX     DE,HL
         POP    BC
         DJNZ   FMA4
         RET


FMA7     LD     HL,22791         ; [?]
         INC    HL
         DJNZ   FMA7
         LD     (HL),A
         RET


FMA8     LD     HL,22791
         LD     C,8
         OR     D
         RET    NZ               ; [?]


FMA9     PUSH   HL
         LD     B,3
FMA10    PUSH   BC
         CALL   COMPR
         JP     NZ,FMA10
         POP    BC
         RET


CARGA    LD     HL,(22528+256+64+11)  ; [?]
         LD     B,10

; --- [PÁGINA 9] CARGA1/CARGA2/CARGA3 + PLAY data + SCEND + INICIO --------

CARGA1   LD     HL,16384+2048+11+64
         LD     DE,A,255         ; [?]
         LD     C,8
CARGA2   PUSH   HL
         LD     B,10
CARGA3   LD     A,(HL)
         INC    HL
         INC    DE
         DJNZ   CARGA3
         POP    HL
         INC    H
         DEC    C
         JR     NZ,CARGA2
         LD     DE,7112
         LD     IX,58167
         LD     A,255
         SCF
         EI
         CALL   1366
         DI
         LD     HL,58167
         LD     DE,16384
         LD     BC,6912
         LDIR
         JP     58167+6912


PLAY     DEFB   0,0,0,0,1,64,0,0,0,160
         DEFB   124,2,0,1,95,32,160,194,160
         DEFB   98,138,28,112,0,24,160,98,100,0
         DEFB   66,138,40,8,0,16,160,66,56,0
         DEFB   124,138,28,120,0,31,32,128,126,16,0,64
         DEFB   64,202,2,152,0,16,48,160,16,16,64
         DEFB   113,188,120,0,16,63,66,16,0
         DEFB   0,0,0,0,0,0,0,0


SCEND    POP    DE
         RET


INICIO   LD     HL,COLOIN
         LD     DE,16384+6144+256+10
         LD     BC,22
         LDIR
         LD     HL,COLOON
         LD     DE,16384+6144+256+42
         LD     BC,22
         LDIR


         LD     HL,16384+2048+21
         LD     DE,GRAFIN
         LD     B,8
BUINI0   PUSH   BC
         LD     C,4
BUINI1   PUSH   HL
         LD     A,(DE)
         LD     (HL),A
         INC    HL
         INC    DE
BUINI2   DJNZ   BUINI2           ; [?]

; --- [PÁGINA 10] SCROLL/SCROL0/SCRDOO/SCROL1/2/3 + COLOON + COLDIN -------

         POP    HL
         INC    H
         DEC    C
         JR     NZ,BUINI1        ; [?]
         LD     BC,2016
         AND    A
         SBC    HL,BC
         POP    BC
         DJNZ   BUINI0


SCROLL   LD     D,112
SCROL0   LD     BC,2160          ; [?]
SCRDOO   DEC    BC
         LD     A,B,C            ; [?]
         OR     C
         JR     NZ,SCROL0
         PUSH   DE
         LD     A,D
         AND    A
         JP     Z,SCEND
         DEC    DE
         CALL   COMPR
         JP     Z,SCEND
         POP    DE
         JP     SCROLL


SCROL3   LD     E,2
         LD     HL,16384+2048+32


SCROL1   LD     C,8
         AND    A
SCROL2   RL     (HL)
         INC    H
         DJNZ   SCROL2
         LD     DE,22
         INC    H
         ADD    HL,DE
         JR     NZ,SCROL1
         LD     SBC    HL,BC     ; [?]
         POP    BC
         DEC    C
         JR     NZ,SCROL3
         JP     INICIO


COLDIN   DEFB   0,0,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0
COLOIN   DEFB   3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0
COLOON   DEFB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


GRAFIN   DEFB   252,198,192,254,254,0,254,198,254,254,252
         DEFB   254,198,192,254,254,0,254,198,254,254,254
         DEFB   198,198,192,192,198,0,198,198,198,198,198
         DEFB   198,198,192,192,198,0,198,198,198,198,198
         DEFB   254,254,254,254,254,0,198,254,254,222,254


; NOTA: las páginas 11-12 del PDF dark2-main empiezan ya el módulo TRIMONSTER.
; Se han movido a `src/sources_dark2/dark2-trimonster.asm` (módulo separado).


; =============================================================================
; FIN — dark2-main
; -----------------------------------------------------------------------------
; Estructura del módulo (12 páginas):
;
; 1. Mapa de memoria de Fase 2 (carga 27275 ENTRADA:43976, gráficos personaje
;    a 23850, datos pantallas a 44000, gráficos a 45000, etc.)
; 2-3. Cabecera con *F (INCLUDE) de los 16 sub-módulos: CPANT, COLAS, ABUELO,
;    IMPRESION, PERSO, PODERES, CHOQUES, ARMADURA, TRIMONSTER, FUEGO, SIERRA,
;    DEMONIO, PINCHO, SALTARON, LLAMARON, GLOBO + variables globales VAR0..VAR48
;    + EQUs (DPERSO/DMALO/MUERE/VIVE) + tabla SUEL/PANT1..PANT15 + TPO (poderes)
; 4. TART/STAR/MAIN + TRUCO + MORTE
; 5. MORTE cont + CASIRA + MUERTE + NUEVO + flags E1..E4
; 6. BICHOS dispatcher (15 entradas según VAR0=0..14) + PA00..PA04
; 7. PA05..PA14 + sonidos SONI1..SONI4/SONIM3/SONIM4
; 8. FMA/FMA1..FMA10 (rutinas de scroll/atributos) + CARGA
; 9. CARGA1/2/3 (cargador de fase siguiente, CALL 1366 ROM) + PLAY (data)
;    + SCEND + INICIO (config inicial: COLOIN/COLOON, GRAFIN)
; 10. BUINI0..BUINI2 + SCROLL/SCROL0..3/SCRDOO + COLDIN/COLOIN/COLOON/GRAFIN
; 11-12. Inicio del módulo TRIMONSTER (TRIVI/TRUP/TRDE/TRFASE/TRMOVI/TRMODI/
;    TRMUER/TRCHO/TRIMOT) — control del enemigo TRIMONSTER. Sigue en otro PDF.
;
; Direcciones clave:
;   ORG    = 27275 (programa)
;   TABLA1 = 23850, TABLA2 = 23878  (tabla de personajes)
;   PANTA  = 59134  (segunda pantalla)
;   BUFFER = 63220  (2048 bytes)
;   DPERSO = 54790, DMALO = 54811, MUERE = 54869, VIVE = 54930
;   HAY    = 55000  (datos pantallas decorado)
;   ENEMI1 = 56310  (gráficos GLOBMAN)
;   PANTA  = 59134  (pantalla 2 con DIFE = 42750)
;
; Nombres específicos de Fase 2 (vs Fase 1):
;   - GLOBMAN  = enemigo grande (¡el "blob"!)
;   - TRIMONSTER = enemigo "tri" (3 cuerpos? mascota Triton?)
;   - ARMADURA = caballero con armadura
;   - PINCHO/SIERRA/FUEGO = trampas
;   - SALTARON/LLAMARON   = enemigos saltadores/llameantes
;
; Nota: las páginas 11-12 deberían ir a un fichero `dark2-trimonster.asm`
; cuando se separe, pero como son parte del mismo PDF se incluyen aquí.
; =============================================================================
