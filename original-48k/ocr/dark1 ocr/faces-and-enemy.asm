; =============================================================================
; RUTINA DE LAS CARAS DEL PERSONAJE Y DEL ENEMIGO/BLOQUE2
; Módulo: dark1-faces-and-enemy
; Páginas escaneadas: 2 (dark1-faces-and-enemy-{1..2}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        Dibuja las "caras" (retratos/iconos) en el panel: una para el personaje
;        y otra para el malo. MUERE/VIVE animan el progreso de daño.
; =============================================================================

         *D+
         *C-
         ORG    54790

CPERSO   EQU    58670
CMALO    EQU    58742


; --- [PÁGINA 1] DPERSO + DMALO + DIBUS + MMUR1 + MUERE ----------------------

DPERSO   LD     HL,CPERSO
         LD     DE,20610
         CALL   DIBUS
         LD     A,0
         LD     (BY1),A
         LD     HL,20610
         LD     (BYHL),HL
         RET


DMALO    LD     HL,CMALO
         LD     DE,20625
         CALL   DIBUS
         LD     A,0
         LD     (BY2),A
         LD     HL,20625
         LD     (BYDE),HL
         RET


DIBUS    LD     B,3
DIBU1    LD     C,8
DIBU2    PUSH   BC
         PUSH   DE
         LD     BC,3
         LDIR
         POP    DE
         INC    D
         POP    BC
         DEC    C
         JR     NZ,DIBU2
         CALL   MMUR1
         DJNZ   DIBU1
         RET


MMUR1    PUSH   HL
         LD     HL,2016
         EX     DE,HL
         AND    A
         SBC    HL,DE
         EX     DE,HL
         POP    HL
         RET


BY1      DEFB   0
BYHL     DEFW   20610


MUERE    LD     DE,(BYHL)
         LD     A,(BY1)
         INC    A
         LD     (BY1),A
         CP     9
         CALL   Z,MUERE1
         PUSH   DE

; --- [PÁGINA 2] MUERE2 + MUERE1 + VIVE3 + VIVE1 + VIVE ----------------------

         LD     B,3
         LD     A,0
MUERE2   LD     (DE),A
         INC    DE
         DJNZ   MUERE2
         POP    DE
         INC    DE
         LD     (BYHL),DE
         LD     BC,(BYHL)
         RET


MUERE1   LD     A,1
         LD     (BY1),A
VIVE3    LD     HL,2016
         EX     DE,HL
         AND    A
         SBC    HL,DE
         EX     DE,HL
         RET


VIVE1    LD     A,1
         LD     (BY2),A
         JP     VIVE3


BY2      DEFB   0
BYDE     DEFW   20635


VIVE     LD     DE,(BYDE)        ; [?]
         LD     A,(BY2)
         INC    A
         LD     (BY2),A
         CP     9
         CALL   Z,VIVE1
         PUSH   DE
         LD     B,3
         LD     A,0
VIVE2    LD     (DE),A
         INC    DE
         DJNZ   VIVE2
         POP    DE
         INC    DE
         LD     (BYDE),DE
         RET


; =============================================================================
; FIN — dark1-faces-and-enemy
; -----------------------------------------------------------------------------
; Caras (retratos) en el panel del juego:
;   DPERSO  → dibuja la cara del personaje (CPERSO=58670 → 20610)
;   DMALO   → dibuja la cara del enemigo   (CMALO=58742 → 20625)
;   DIBUS   → blitter 3×8 con saltos de fila (MMUR1)
;   MUERE   → borra una columna de la cara del personaje (daño recibido)
;   VIVE    → borra una columna de la cara del enemigo (daño infligido)
;   MUERE1/VIVE1 → reinician contador BY1/BY2 al llegar a 9
; BY1/BY2 = contadores 0..8, BYHL/BYDE = punteros actuales en pantalla.
; =============================================================================
