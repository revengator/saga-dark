; =============================================================================
; EXPLOSIÓN — animación de muerte del boss VISCOSA
; -----------------------------------------------------------------------------
; Entry:   EXPO (0xA425). Variables NEXP/DIEXP/EXP en 0xA421-0xA424.
; Sprite:  EXP1 (0xDD84), EXP2 (0xDD92), EXP3 (0xDDA0). Ya en RAM sistema.
; Mecánica: avanza 7 fotogramas por tabla TDE leyendo posiciones (Y,X).
;          PON1 al final del ciclo de animación (frame counter wrap).
;          FINEXP retira los 3 sprites de la cola (3× T0DEC = MDOWNN).
; Externos: PON1, MDOWNN (=T0DEC), SONI2.
; =============================================================================

EXP1     EQU    56708     ; sprite explosión fase 1
EXP2     EQU    56722     ; fase 2
EXP3     EQU    56736     ; fase 3

NEXP     DEFB   0         ; contador 0..6 (7 fotogramas)
DIEXP    DEFW   0         ; puntero al fotograma actual dentro de TDE
EXP      DEFB   0         ; estado: 0=inactivo, 1=activo, 2=terminando


; --- EXPO + FINEXP + TDE ----------------------------------------------------

EXPO     LD     A,(EXP)
         CP     1
         RET    NZ
         LD     A,(EXP1+8)
         INC    A
         CP     3
         CALL   Z,PON1           ; (era 'JR Z,FINEXP' por OCR)
         LD     (EXP1+8),A
         LD     (EXP2+8),A
         LD     (EXP3+8),A
         LD     A,(NEXP)
         INC    A
         CP     7
         JR     Z,FINEXP
         LD     (NEXP),A
         LD     IX,(DIEXP)
         LD     A,(IX)
         LD     (EXP1),A
         LD     A,(IX+1)
         LD     (EXP1+1),A
         LD     A,(IX+2)
         LD     (EXP2),A
         LD     A,(IX+3)
         LD     (EXP2+1),A
         LD     A,(IX+4)
         LD     (EXP3),A
         LD     A,(IX+5)
         LD     (EXP3+1),A
         LD     BC,6
         ADD    IX,BC
         LD     (DIEXP),IX
         CALL   SONI2
         RET


FINEXP   LD     A,2
         LD     (EXP),A
         CALL   MDOWNN           ; [?] MDOWN/MDOWNN
         CALL   MDOWNN
         CALL   MDOWNN
         RET


; Tabla de posiciones de la explosión (7 fotogramas × 6 bytes: 3 pares Y,X)
TDE      DEFB   152,128,180,100,140,100
         DEFB   160,150,115,135,130,145
         DEFB   169,125,130,112,170,145
         DEFB   175,125,130,140,120,130
         DEFB   160,120,120,170,140,167
         DEFB   125,156,163,143,153,120
; (eliminado DEFB 0 final — el OCR añadió un byte extra; binario tiene 36B exactos)


; =============================================================================
; FIN — dark1-explosion
; -----------------------------------------------------------------------------
; EXPO controla la animación de explosión del boss:
;   - Avanza 7 fotogramas (NEXP cuenta) leyendo posiciones de TDE
;   - Cada fotograma reposiciona EXP1, EXP2, EXP3 (3 sprites de explosión)
;   - Con sonido SONI2 en cada cambio
;   - FINEXP retira los 3 sprites de la cola (3× MDOWNN) y deja EXP=2
; EXP: 0=inactivo, 1=animando, 2=acabado
; DIEXP: puntero al fotograma actual dentro de TDE
; =============================================================================
