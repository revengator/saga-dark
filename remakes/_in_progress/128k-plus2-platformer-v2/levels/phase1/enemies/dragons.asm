; =============================================================================
; DRAGONES DE LAVA — enemigos nivel 1
; -----------------------------------------------------------------------------
; Entry:   DRAGON (0xA358). SUBI10/SUBIR9 (0xA356-7) — variables que van antes.
; Sprite:  DRA1 (0xDD6C = 56684), DRA2 (0xDD78 = 56696). Ya en RAM de sistema.
; Estado:  VAR0 (tipo de pantalla; CP 5 activa la 2ª variante DRAGO2).
; Mecánica: dos dragones de fuego que asoman desde los bordes (MDRA1, MDRA2).
;          Cada uno tiene su rutina de movimiento + colisión (CHDRA).
; Externos: VAR0, CHOQUE, MUERTE.
; =============================================================================

DRA1     EQU    56684     ; sprite dragón 1 (RAM sistema)
DRA2     EQU    56696     ; sprite dragón 2

SUBI10   DEFB   0         ; variable estado fase de subida 10
SUBIR9   DEFB   0         ; variable estado subida 9


DRAGON   LD     A,(VAR0)
         CP     5
         JP     Z,DRAGO2
DRAGO1   CALL   MDRA1
         LD     IY,DRA1
         CALL   CHDRA
         RET


MDRA1    LD     A,(SUBIR9)
         CP     0
         JP     Z,PSUB9
         CP     2
         JR     Z,BAJAR9
         LD     A,(DRA1)
         SUB    8
         LD     (DRA1),A
         CP     80
         RET    NZ
         LD     A,2
         LD     (SUBIR9),A
         RET


BAJAR9   LD     A,(DRA1)
         ADD    A,8
         LD     (DRA1),A
         CP     192
         RET    NZ
         LD     A,0
         LD     (SUBIR9),A
         RET


CHDRA    LD     H,24
         LD     L,24
         CALL   CHOQUE
         JP     C,MUERTE
         RET


BAJA10   LD     A,(DRA2)
         ADD    A,8
         LD     (DRA2),A
         CP     192
         RET    NZ
         LD     A,0
         LD     (SUBI10),A
         RET


PSUB10   LD     A,192
         LD     (DRA2),A
         LD     (DRA2+1),A
         LD     A,R
         AND    %00011100
         CP     0
         RET    NZ
         LD     A,1
         LD     (SUBI10),A
         RET


; --- [PÁGINA 2] PSUB9 + PPSUB9 + DRAGO2 + MDRA2 -----------------------------

PSUB9    LD     A,192
         LD     (DRA1),A
         LD     A,R
         AND    %00000111
         CP     0
         RET    NZ
         LD     A,1
         LD     (SUBIR9),A
         LD     A,(VAR0)
         CP     4
         JR     Z,PPSUB9
         LD     A,80
         LD     (DRA1+1),A
         RET


PPSUB9   LD     A,176
         LD     (DRA1+1),A
         RET


DRAGO2   CALL   MDRA1
         LD     IY,DRA1
         CALL   CHDRA
         CALL   MDRA2
         LD     IY,DRA2
         CALL   CHDRA
         RET


MDRA2    LD     A,(SUBI10)
         CP     0
         JP     Z,PSUB10
         CP     2
         JP     Z,BAJA10
         LD     A,(DRA2)
         SUB    8
         LD     (DRA2),A
         CP     80
         RET    NZ
         LD     A,2
         LD     (SUBI10),A
         RET


; =============================================================================
; FIN — dark1-dragons
; -----------------------------------------------------------------------------
; Dos dragones de lava DRA1 (56684) y DRA2 (56696) con sprite ya en memoria.
;   DRAGON  → entrada (1 ó 2 dragones según VAR0=5)
;   MDRA1   → mueve dragón 1 (sube/baja entre 80 y 192)
;   MDRA2   → mueve dragón 2 (mismo patrón)
;   CHDRA   → choque con personaje (H=24, L=24)
;   PSUB9   → reset dragón 1 (aleatorio: %00000111)
;   PSUB10  → reset dragón 2 (aleatorio: %00011100)
;   BAJAR9 / BAJA10 → cuando llega arriba (80) o abajo (192) cambia dirección
;   PPSUB9  → ajusta posición X cuando VAR0=4 (pantalla específica)
; SUBIR9/SUBI10 son las flags de dirección (0=subiendo, 2=bajando).
; =============================================================================
