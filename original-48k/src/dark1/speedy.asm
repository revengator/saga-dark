; =============================================================================
; SPEDY — enemigo nivel 1 (veloz)
; -----------------------------------------------------------------------------
; Entry:   SPEDY (0xA2A9). DEREB (0xA2A8) — variable de estado dirección.
; Sprite:  SPE1 (0xDD5E = 56670) — ya en memoria de sistema.
; Estado:  E1 (0xA84B). Si E1=0: spawn aleatorio. Si E1=1: activo.
; Mecánica: scrolla de un lado a otro. Pasos de 8 (más rápido que piranha).
;          Desaparece al borde (FINIS8 → MDOWN).
; Externos: E1, T0, CHOQUE, MUERTE, MUP, MDOWN, PON1, SIZQUI, SDERE.
; =============================================================================

SPE1     EQU    56670     ; sprite del speedy (en RAM de sistema)
DEREB    DEFB   0         ; variable de dirección (debe ir antes del entry)


SPEDY    LD     A,(E1)
         CP     0
         JP     Z,RENO8
         LD     IY,SPE1
         CALL   MOVSPE
         CALL   CHOSPE
         RET


MOVSPE   CALL   CAMFA8
         LD     A,(DEREB)
         CP     0
         JP     NZ,DE8
         LD     A,(IY+1)
         CP     0
         JR     Z,FINIS8
         SUB    8
         LD     (IY+1),A
         RET


DE8      LD     A,(IY+1)
         CP     200
         JR     Z,FINIS8
         ADD    A,8
         LD     (IY+1),A
         RET


CAMFA8   LD     A,(IY+8)
         INC    A
         CP     3
         CALL   Z,PON1
         LD     (IY+8),A
         RET


FINIS8   CALL   MDOWN
         LD     A,0
         LD     (E1),A
         RET


CHOSPE   LD     IY,SPE1
         LD     H,40
         LD     L,48
         CALL   CHOQUE
         JP     C,MUERTE
         RET


RENO8    LD     A,R
         AND    %00011111
         CP     0
         RET    NZ
         LD     A,R              ; [?]
         AND    %00100000
         CP     0
         JR     NZ,IZS1
         LD     IX,SPE1
         CALL   SIZQUI
         LD     A,1
         LD     (DEREB),A        ; [?] DERE8/DEREB
         LD     (E1),A
         LD     A,0
         LD     (SPE1+1),A
         LD     A,144
         LD     (SPE1),A

; --- [PÁGINA 2] SSPE1 + IZS1 -----------------------------------------------

SSPE1    CALL   MUP
         LD     HL,SPE1
         LD     (T0+1),HL
         RET


IZS1     LD     IX,SPE1
         CALL   SDERE
         LD     A,0
         LD     (DEREB),A
         LD     A,1
         LD     (E1),A
         LD     A,200
         LD     (SPE1+1),A
         LD     A,92
         LD     (SPE1),A
         JP     SSPE1


; =============================================================================
; FIN — dark1-speedy
; -----------------------------------------------------------------------------
; SPEDY (sprite SPE1=56670 ya en memoria):
;   SPEDY   → entrada
;   MOVSPE  → mueve horizontal: si DEREB=0 va a izquierda, si !=0 a derecha
;   IZ8/DE8 → topes (X=0 izquierda, X=200 derecha) → FINIS8 (cae)
;   CAMFA8  → animación de frames (3 frames)
;   FINIS8  → muere, desaparece
;   CHOSPE  → choque con personaje (40,40)
;   RENO8   → respawn aleatorio: %00011111 y luego R&%00100000 decide lado
;   SSPE1   → encola SPE1 en T0
;   IZS1    → respawn en lado opuesto (X=200, va a izquierda)
; =============================================================================
