; =============================================================================
; SAGA DARK — FASE 1 — MAIN F1 / BLOQUE 1
; Módulo: dark1-main
; Páginas escaneadas: 10 (dark1-main-{01..10}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo original. Muchas líneas con OCR dudoso (escaneo
;        con bajo contraste). Marcas '; [?]' indican lecturas inseguras.
;        Las páginas 8-10 contienen tablas y código de carga muy borroso.
; =============================================================================

; --- [PÁGINA 1] DIRECCIONES DE MEMORIA --------------------------------------
;
; SAGA DARK
; FASE 1
; DIRECCIONES DE MEMORIA
;
; 23850  GRAFICOS PERSONAJE          3423 BYTES
; 27275  PROGRAMA C/M    ENTRADA: 47558  ; [?] dígito final dudoso
; 44000  DATOS GRAFICOS DECORADOS    255 BYTES
; 44999  PILA C/M                    235 BYTES
; 45000  GRAFICOS DECORADOS         8792 BYTES
; 53795  ENEMI1 (PARTE 1 DEL NINJA)
; 53807  ENEMI2 (PARTE 2 DEL NINJA)
; 54790  DPERSO (PONE LA CARA DEL PERSONAJE)
; 54811  DMALO  (PONE LA CARA DEL NINJA)
; 54869  MUERE  (VACIA LA CARA DEL PERSONAJE)
; 54930  VIVE   (VACIA LA CARA DEL NINJA)
; 55000  DATOS PANTALLAS             1169 BYTES
; 56670  SPE1   (GRAFICO DEL SPEDY)
; 56684  DRA1   (GRAFICO DEL DRAGON DE LAVA)
; 56708  EXP1   (FASE 1 DE LAS EXPLOSIONES)
; 56722  EXP2   (FASE 2 DE LAS EXPLOSIONES)
; 56736  EXP3   (FASE 3 DE LAS EXPLOSIONES)
; 58670  CARA DEL PERSONAJE          72 BYTES
; 58742  CARA DEL NINJA              72 BYTES
; 58934  GRAFICO DEL FIN
; 59030  PASOS (MOV. DEFINIDO DEL NINJA)  104 BYTES
; 59134  2 PANTALLA  4096 BYTES   DIFE=42750
;        (DIRECCION DEL MENU ANTES DE EMPEZAR)
;        (DIRECC. PANTALLA CARGA F2  5672 BYTES — EMPIEZA EN 64606)
; 63240  BUFFER                      2048 BYTES
; 65279  TABLA DE ESPEJO              256 BYTES
;        (-TRITONCODE- RUTINA DE CARGA F1)
;        (CARGADOR F2 DESPUES DE PANTALLA)


; --- [PÁGINA 2] CABECERA + INCLUDES + DATOS ---------------------------------

         #D+
         #C-

         ORG    27275

         #F CPANT
         #F COLAS
         #F ABUELO
         #F IMPRESION
         #F PERSO
         #F PODERES
         #F CHOQUES
         #F PIRANA
         #F GASEO
         #F VISCOSA
         #F CHICLE
         #F PIEDRA
         #F SPEDY
         #F DRAGON
         #F EXPLOSION
         #F NINJA


POD4     DEFB   0
VAR21    DEFB   14
VAR22    DEFB   255
VAR23    DEFB   1
VAR24    DEFB   0
VAR12    DEFB   0
VAR10    DEFB   0
VAR1     DEFB   0
VAR13    DEFB   0
VAR16    EQU    27269
VAR17    EQU    27270
VAR18    EQU    27271
VAR19    EQU    27272
VAR20    EQU    27273
VAR14    EQU    27274
VAR7     DEFB   0
VARB     DEFB   0
VAR6     DEFB   15
VAR2     DEFB   0
VAR45    DEFB   0
VAR46    DEFB   1
VAR47    DEFB   0
VAR30    DEFB   0
VAR49    DEFB   0
VAR25    DEFB   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


DIFE     EQU    42750
BUFFER   EQU    63220
PANTA    EQU    59134
TAS1     EQU    0
TABLA1   EQU    23850
TABLA2   EQU    23807         ; [?] valor dudoso
SIDE1    EQU    23890
SIDE2    EQU    23910
WIND1    EQU    23930
WIND2    EQU    23942
DPERSO   EQU    54790
DMALO    EQU    54811
MUERE    EQU    54869
VIVE     EQU    54930


; --- [PÁGINA 3] DECORADOS + SUELO + PODERES ---------------------------------

         ;DECORADOS
VAR0     DEFB   0
PAN      DEFW   HAY,HAY+130,HAY+288,HAY+433,HAY+598,HAY+753
         DEFW   HAY+870,HAY+984,HAY+1093,HAY+1162,HAY+1251
         DEFW   HAY+1318,HAY+1363,HAY+1470,HAY+1592

HAY      EQU    55000
T0       DEFB   0
         DEFB   0,0,0,0,0,0,0,0,0

         ;SUELO FASE 1
SUEL     DEFB   PANT1
         DEFB   PANT2,PANT3,PANT4,PANT5,PANT6,PANT7,PANT8,PANT9
         DEFB   PANT10,PANT11,PANT12,PANT13,PANT14,PANT15
PANT1    DEFB   1
         DEFB   192,0,40,255
PANT2    DEFB   2
         DEFB   192,0,40,255
PANT3    DEFB   2
         DEFB   192,0,40,255
         DEFB   152,110,48,16
PANT4    DEFB   1
         DEFB   192,0,20,255
PANT5    DEFB   2
         DEFB   192,0,40,156
PEDD1    DEFB   180,224,40,40
PANT6    DEFB   2
PEDD2    DEFB   180,24,40,40
PEDD3    DEFB   180,128,40,40
PANT7    DEFB   2
PEDD4    DEFB   180,16,40,40
         DEFB   192,103,40,151
PANT8    DEFB   2
         DEFB   192,0,40,24
         DEFB   204,0,40,255
PANT9    DEFB   1
         DEFB   204,0,40,255
PANT10   DEFB   1
         DEFB   204,0,40,255
PANT11   DEFB   1
         DEFB   204,0,40,255
PANT12   DEFB   1
         DEFB   204,0,40,255
PANT13   DEFB   2
         DEFB   204,0,40,255
         DEFB   192,90,40,165
PANT14   DEFB   1
         DEFB   192,0,40,255
PANT15   DEFB   1
         DEFB   192,0,40,255

         ;TABLA DE PODERES
TP0      DEFB   0,0,0,0,0,0
         DEFB   0,0,0
         DEFB   0,0,0,0,0,0
         DEFB   0,0,0
         DEFB   0,0,0
         DEFB   0,0,0,0,0,0
         DEFB   0,0,0,0,0,0,0,0,0
         DEFB   2,72,200
         DEFB   0,0,0,0,0,0

         ;DARK
         #L+
TART     LD     A,2
         CALL   B1601         ; [?] destino
         LD     A,0
         LD     (VAR14),A
         CALL   59134
         DI
         CALL   PONLIS
         LD     A,0
         CALL   PONCO
         CALL   DPERSO
         CALL   DMALO

; --- [PÁGINA 4] BUCLE PRINCIPAL + MORTE -------------------------------------

STAR     CALL   NEGRO
         CALL   BORRA
         CALL   RESET
         CALL   SPRIPE        ; [?]
         CALL   PANTALL       ; [?] etiqueta '1' antes — quizá 'PANTAL'
         CALL   VUELCA
         CALL   BBBBBB        ; [?]

MAIN     CALL   AAAAAA        ; [?]
         CALL   PODER
         CALL   PODERS        ; [?]
         CALL   ABUELO
         CALL   MOVI
         CALL   SALIR
         LD     A,(DAMA3)
         CP     20
         JP     Z,CARGA
         CALL   BICHOS
         LD     A,(MUER)
         CP     1
         JP     Z,MORTE
         LD     A,(TABLA2)
         CP     192
         JP     Z,MORTE
         JP     MAIN


MORTE    LD     A,0
         LD     (DAMA5),A
         LD     (POKEI+1),A
         LD     (VARMAL),A
         LD     (MUER),A
         LD     (VAR0),A
         LD     (PALOS5),A    ; [?]
         LD     A,(BAJAR5)    ; [?]
         LD     A,160
         LD     (TABLA2),A
         LD     (TABLA2+1),A
         LD     A,60
         LD     (TABLA2+1),A
         LD     (TABLA2+2),A
         LD     A,129
         LD     (TABLA1),A
         LD     (TABLA1+2),A
         LD     A,60
         LD     (TABLA1+1),A
         LD     A,176
         LD     (TABLA2+1),A
         LD     (TABLA2+2),A
         LD     A,2
         LD     (TABLA1+8),A
         LD     (TABLA2+8),A
         LD     A,96
         LD     (NU1),A
         LD     A,0

; --- [PÁGINA 5] MUERTE + NUEVO ----------------------------------------------

         LD     (NU2),A
         CALL   FMA
         CALL   DMALO
         LD     HL,VAR25
BABU1    LD     (HL),A
         INC    HL
         DJNZ   BABU1
         LD     (VAR7),A
         JP     NUEVO


MUER     DEFB   0
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
         LD     A,0
         LD     (NU2),A
         CALL   MUERE
         CALL   SONI2
         LD     A,(NU1)
         CP     0
         JP     Z,CASIRA
         LD     A,96
         LD     (MUER),A      ; [?]


NU1      DEFB   0
NU2      DEFB   0


         LD     A,96
         LD     (NU1),A
         LD     A,1
         LD     (MUER),A      ; [?]
         RET


NUEVO    LD     A,0
         LD     (E1),A
         LD     (E2),A
         LD     (E3),A
         LD     (EXP),A
         LD     (SUB1R9),A    ; [?]
         LD     (VAR45),A
         LD     (SUB10),A     ; [?]
         LD     (VARA9),A     ; [?]
         LD     (SUBI10),A    ; [?]
         LD     (VAR8),A      ; [?]
         LD     (VAR13),A
         LD     (VAR12),A
         LD     A,25
         LD     (DASO),A      ; [?]
         JP     STAR


E1       DEFB   0
E2       DEFB   0
E3       DEFB   0


; --- [PÁGINA 6] BICHOS + DESPACHO POR PANTALLA ------------------------------

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
         JP     Z,PA03        ; [?] ¿debería ser PA07?
         CP     8
         JP     Z,PA08
         CP     9
         JP     Z,PA09
         CP     10
         JP     Z,PA010
         CP     12
         JP     Z,CHICLE
         CP     14
         JP     Z,NINJA


PA00     JP     GASEO
PA01     CALL   GASEO
         CALL   SPEDY
         RET


PA02     JP     CHICLE
PA03     CALL   PIEDRA
         CALL   GASEO
         CALL   DRAGON
         RET


PA04     CALL   PIEDRA
         CALL   GASEO
         CALL   DRAGON
         RET


PA05     CALL   PIEDRA
         CALL   DRAGON
         RET


PA06     CALL   PIEDRA
         CALL   GASEO
         CALL   SPEDY
         RET


PA08     CALL   PEZ
         CALL   GASEO
         LD     A,(DAMA5)
         CP     255
         CALL   Z,POUP
PA09     CALL   VISCO
         CALL   EXPO

; --- [PÁGINA 7] PUUP + PAD + TRANSICIONES -----------------------------------

PUUP     CALL   ???           ; [?] mnemónico ilegible
         LD     A,0
         LD     (NU2),A
         LD     A,96
         LD     (NU1),A
         LD     A,1
         LD     (MUER),A
         RET


DAMA5    DEFB   0


PAD      LD     A,(VAR0)
         CP     9
         JP     Z,PAOO9       ; [?]
         CP     2
         JP     Z,PA02
         RET    Z             ; [?]
         LD     A,(VAR0)
         CP     4
         JP     Z,PAA1
         CP     5
         JP     Z,PA02
         JP     Z,PAA2        ; [?]
         CP     6
         RET    NZ
         LD     DE,PED4
         CALL   MUPP
         RET

PAA1     LD     A,1           ; [?]
         LD     DE,PED4       ; [?]
PAA2     LD     DE,PED4       ; [?]


PAA1B    LD     DE,PED1       ; [?] segundo PAA1 — quizá renombrar
         CALL   MUPP
         LD     DE,PED2
         CALL   PEDD1
         CALL   PEDD2
         CALL   PEDD3
         CALL   PEDD4
         LD     A,176
         CALL   PEDD1
         CALL   PEDD2
         CALL   PEDD3
         CALL   PEDD4
PAA2B    LD     DE,PED1       ; [?] segundo PAA2
         CALL   PEDD1
         LD     DE,PED2
         CALL   PEDD2
         LD     DE,PED3
         CALL   PEDD3
         LD     DE,PED4
         CALL   PEDD4
         LD     A,176
         CALL   PEDD4         ; [?]
         LD     DE,PED1       ; [?]
         CALL   PEDD1


SONI1    LD     B,10
         JP     SONI

; --- [PÁGINA 8] SONIDO + FMA (rutinas borrosas) -----------------------------

         JR     NZ,FMA3
         DJNZ   FMA2
         LD     A,3*16384+2048+14   ; [?] expresión aritmética dudosa
         LD     HL,58754+58454      ; [?]
         LD     B,3
FMA4     PUSH   BC
         PUSH   DE
FMA5     PUSH   BC
         PUSH   DE
         LD     B,8
FMA6     LDIR
         POP    DE
         INC    DE
         POP    BC
         DJNZ   FMA5
         LDIR
         POP    DE
         INC    DE
         POP    BC
         DJNZ   FMA4
         RET


SONI     LD     A,(VAR12)
         DEC    A
         LD     (VAR12),A
         LD     B,32
         LD     A,1
         XOR    DE,HL         ; [?] mnemónico inválido
         POP    DE
         DJNZ   FMA5
         LDIR
         POP    DE
         INC    DE
         POP    BC
         DJNZ   FMA4
         RET


PICHO1   DEFB   168,48
PICHO2   DEFB   168,176


PA0D9    LD     A,(E1)
         CP     0
         RET    NZ
         LD     A,1
         LD     (E1),A
         LD     A,(BAJAR5)    ; [?]
         PUSH   AF
         CP     1             ; [?] línea 04380 mal estructurada
         JP     Z,VISC2
         CALL   MUPP
VISC2    LD     DE,BOCA1      ; [?]
         CALL   MUPP
         LD     A,1
         LD     (DJ01+8),A
         LD     A,120
         LD     (DJ01+1),A
         RET


FMA      LD     BC,608
FMA1     LD     A,0
         LD     HL,16384+2048+14
         LD     (HL),A        ; [?] 'LD (HL,L),A' parece error
         DEC    HL
         POP    DE
         DJNZ   FMA5          ; [?]
         LD     A,B

; --- [PÁGINA 9] FMA continuación + CARGA NUEVA FASE -------------------------

         JR     NZ,FMA3
         DJNZ   FMA2
         LD     HL,58754+58454+14   ; [?]
         LD     B,3
FMA4B    PUSH   BC            ; [?] etiqueta duplicada en original
         PUSH   DE
         LD     B,8
FMA5B    PUSH   BC            ; [?] etiqueta duplicada
         PUSH   DE
FMA5C    PUSH   BC            ; [?] tercera duplicada — error de listado
         PUSH   DE
FMA6B    LDIR
         POP    DE
         INC    DE
         POP    BC
         DJNZ   FMA5
         LDIR
         POP    DE
         INC    DE
         POP    BC
         DJNZ   FMA4
         RET


FMA10    LD     A,(VAR20)
         INC    A
         LD     (VAR20),A

         #D+
         #C-

         ; CARGA NUEVA FASE

CARGA    LD     HL,28528+256+64+11
         LD     B,10
         LD     A,%11111010
CARGA1   LD     (HL),A
         INC    HL
         DJNZ   CARGA1
         LD     HL,16384+2048+11+64
         LD     C,0
CARGA2   PUSH   HL
         LD     B,10
CARGA3   LD     A,(DE)
         INC    HL
         INC    HL
         DEC    DE

; --- [PÁGINA 10] FIN CARGA + DATOS PLAY -------------------------------------

         DJNZ   CARGA3
         POP    HL
         INC    H
         DEC    C
         JR     NZ,CARGA2

         LD     DE,5672
         LD     IX,59134
         SCF
         EI
         CALL   1366
         DI
         LD     HL,59134
         LD     DE,16384
         LD     BC,255
         LDIR
         LD     C,8
         LDIR

CARGAS   PUSH   DE            ; [?]
         LD     B,96
CARGA4   LD     A,(HL)
         LD     (DE),A
         INC    HL
         INC    DE
         DJNZ   CARGA4
         LD     DE,59134
         CALL   CARGAS

CARGA5   LD     BC,1638+96+96 ; [?]
         LD     BC,5184+96
         LDIR
         JP     64606


PLAY     DEFB   0,0,0,0,1,64,0,0,0,160
         DEFB   124,2,0,0,1,95,32,60,194,160
         DEFB   98,128,28,112,0,24,160,98,100,0
         DEFB   64,138,28,8,0,0,160,64,0
         DEFB   124,138,28,8,0,31,160,68,126,16,0
         DEFB   64,203,2,152,0,16,63,68,16,0,64
         DEFB   113,108,128,0,18,63,68,16,0
         DEFB   0,0,0,0,0,0
         ; ... (resto ilegible / continúa) — [?]


; =============================================================================
; FIN DE LA TRANSCRIPCIÓN — dark1-main
; -----------------------------------------------------------------------------
; Etiquetas externas referenciadas (otros módulos):
;   CPANT, COLAS, ABUELO, IMPRESION, PERSO, PODERES, CHOQUES, PIRANA,
;   GASEO, VISCOSA, CHICLE, PIEDRA, SPEDY, DRAGON, EXPLOSION, NINJA,
;   PONLIS, PONCO, NEGRO, BORRA, RESET, PANTAL, VUELCA, PODER, MOVI,
;   SALIR, BICHOS->PEZ, POUP, VISCO, EXPO, MUPP, CHOQUE, SONI2,
;   BAJAR5, BOCA1, DJ01
;
; Páginas 8-10: muchas líneas con OCR muy dudoso (FMA*, SONI, CARGA*).
; ESPECIAL ATENCIÓN: el bucle principal MAIN→BICHOS→PA0x es la lógica
; central y está más limpia que las rutinas de carga.
; =============================================================================
