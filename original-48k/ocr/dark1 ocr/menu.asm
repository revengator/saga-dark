; =============================================================================
; MENU — BLOQUE 3
; Módulo: dark1-menu
; Páginas escaneadas: 5 (dark1-menu-{1..5}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa. Este módulo está
;        muchísimo más limpio que los anteriores — bastantes pocas dudas.
; =============================================================================

         #D+
         #C-

         ORG    59134

MENU     LD     HL,TEXT1
         CALL   IMPRO
         CALL   DOUBLE
         CALL   DOUBLE
         JP     TECLAS

VAR16    EQU    27269
VAR14    EQU    27274

DOUBLE   LD     HL,16384
         LD     BC,4096
DOUUU1   LD     A,(HL)
         AND    A
         RR     A
         OR     D                ; [?]
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,DOUUU1
         RET


IMPRO    LD     A,2
         PUSH   HL
         CALL   M1601           ; [?]
         POP    HL


IMPRU    LD     A,(HL)
         CP     255
         RET    Z
         RST    10H              ; [?] o RST $10
         INC    HL
         JR     IMPRU


; --- Mensajes / textos -----------------------------------------------------

TEXT1    DEFB   22,13,1
         DEFB   16,6
         DEFM   "ANTONIO JUAN HERNANDEZ CUELLAR"
         DEFB   22,12,11
         DEFM   "MIGUEL ANGEL ESTEVE MARCO"
         DEFB   22,10,11,16,4
         DEFM   "PROGRAMA"
         DEFB   22,6,8,16,6
         DEFM   "...REDEFINIR"
         DEFB   22,5,8,16,6
         DEFM   "2...SINCLAIR"
         DEFB   22,4,8,16,6
         DEFM   "2...KEMPSTON"
         DEFB   22,3,8,16,3
         DEFM   "1...TECLADO"
         DEFB   22,2,8,16,2
         DEFM   "0...EMPEZAR"
         DEFB   22,0,10,16,7
         DEFM   "SAGA—-DARK"
         DEFB   22,15,0,16,2,17,1,127
         DEFM   " COPYRIGHT TRITON SOFTWARE 1990"
         DEFB   255

; --- [PÁGINA 2] COMPR + TABLA + TECLAS + PROGRAMA -------------------------

COMPR    LD     DE,TABLA
         LD     H,O
         LD     L,A
         ADD    HL,HL
         ADD    HL,DE
         LD     A,(HL)
         INC    HL
         LD     H,(HL)
         LD     L,A
         IN     A,(254)
         AND    (HL)
         RET


TABLA    DEFB   247,1,247,2,247,4,247,8,247,16,239,16,239,8,239,4
         DEFB   239,2,239,1,251,1,251,2,251,8,251,16,251,1
         DEFB   223,16,223,8,223,4,223,2,223,1,253,1,253,2,253,4,253,16
         DEFB   253,4,254,1,254,2,254,4,254,16,127,16,127,8,127,2,127,4
         DEFB   127,1


TECLAS   LD     A,9
         CALL   COMPR
         RET    Z

         LD     A,3
         CALL   COMPR
         JR     Z,TEMP

         CALL   COMPR
         JR     Z,TECLAD

         LD     A,O
         CALL   COMPR
         JR     Z,TECLAD

         LD     A,2
         CALL   COMPR
         JR     Z,SINCLA

         JP     TECLAS


KEMP     LD     A,2255          ; [?] valor raro
         LD     HL,DASIN        ; [?]
         LD     DE,VAR16
         LD     BC,5
         LDIR
         RET


SINCLA   LD     A,O
         LD     (VAR14),A
         LDIR
         RET


DASIN    DEFB   8,7,6,5,9


REDE     LD     A,O
         LD     (VAR14),A
         CALL   IMPRO
         CALL   DOU
         CALL   DATEL          ; [?]
         CP     3
         JR     Z,REDE1
         LD     (VAR16),A
         CALL   SONO
         CALL   DOU

REDE1    LD     A,(VAR16)
         JR     Z,REDE2
         LD     A,(VAR16+1),A
         CALL   SONO
         CALL   DOU

REDE2    LD     A,(VAR16+1)
         CP     0
         JR     Z,REDE3
         LD     (VAR16+2),A
         CALL   SONO
         CALL   DOU

REDE3    PUSH   DE
         LD     HL,TEX3
         CALL   IMPRO
         CALL   DOU
         CALL   DATECL          ; [?]

; --- [PÁGINA 4] REDE4 + REDE5 + DOU + DOU1 + DOU2 + SONO + SONO1 -------

REDE4    POP    DE
         CALL   DATECL
         LD     (VAR16+3),A
         CALL   SONO
         CALL   DOU

REDE5    PUSH   DE
         LD     HL,TEX5
         CALL   IMPRO
         CALL   DOU
         CALL   DATECL
         LD     (VAR16+4),A
         CALL   SONO
         CALL   DE,BUTE
         CALL   BC,5            ; [?]
         LDIR
         RET


DOU      LD     B,8
DOU1     PUSH   BC
         LD     C,32
DOU2     LD     A,(HL)
         AND    A
         RR     A
         OR     D
         DEC    HL
         POP    HL
         POP    BC
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,DOU1
         RET


SONO     LD     B,30
SONO1    PUSH   BC
         LD     A,DE,DOU2       ; [?]
         PUSH   BC


; --- [PÁGINA 5] SONO continuación + DATECL + DATTE1 + FIDATE -------------

         POP    DE
         POP    HL
         POP    BC
         INC    HL
         INC    HL
         INC    HL
         INC    HL
         DJNZ   SONO1
         RET


DATECL   LD     B,40
         LD     A,O
DATTE1   PUSH   BC
         PUSH   AF
         CALL   COMPR
         JR     Z,FIDATE
         POP    AF
         POP    BC
         INC    A
         DJNZ   DATTE1
         JR     DATECL
FIDATE   POP    AF
         POP    BC
         RET


; =============================================================================
; FIN — dark1-menu (BLOQUE 3)
; -----------------------------------------------------------------------------
; Rutinas:
;   MENU     → entrada principal
;   IMPRO/IMPRU → impresión de cadena terminada en 255
;   DOUBLE   → ¿double-buffer / desplazamiento de pantalla?
;   COMPR    → comprueba tecla A
;   TECLAS   → bucle de selección
;   KEMP / SINCLA / REDE → opciones del menú
;   REDE/REDE1..REDE5 → flujo de redefinir teclas
;   DOU/DOU1/DOU2 → bucle de pintado
;   SONO/SONO1 → sonido beeper
;   DATECL/DATTE1/FIDATE → lectura de tecla con barrido
;
; Strings con copyright "TRITON SOFTWARE 1990" y créditos:
;   ANTONIO JUAN HERNANDEZ CUELLAR
;   MIGUEL ANGEL ESTEVE MARCO
; =============================================================================
