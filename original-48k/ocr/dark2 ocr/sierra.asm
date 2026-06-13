; =============================================================================
; RUTINA DE CONTROL DE LA SIERRA — M.F2
; Módulo: dark2-sierra (parte de dark2-varios.pdf, páginas 2-4)
; Páginas escaneadas: 3 (dark2-varios-{02..04}.png — secciones inferiores)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 2/3] SIERRA + SIUP + SIMOV/SIMATA + COPS1 ---------------------

SIERRA   LD     A,(E2)
         CP     0
         JP     Z,SIUP
         CALL   SIFASE
         CALL   SIMOV
         CALL   SIMATA
         CALL   COPS1
         RET


SIUP     LD     A,1
         LD     (E2),A
         LD     DE,SIE1
         CALL   MUPP
         LD     DE,SIE2
         CALL   MUPP
         LD     A,64
         LD     (SIE1),A
         LD     A,128
         LD     (SIE2),A
         LD     A,2
         LD     (SIE1+1),A
         LD     A,(SIE2+1),A     ; [?]
         JP     A,0              ; [?]
         LD     (SIMOV1),A
         LD     (SIMOV2),A
         RET


SIFASE   LD     A,(SIE2+8)
         INC    A
         LD     (SIE2+8),A
         CP     3
         RET    NZ
         LD     A,1
         LD     (SIE2+8),A
         RET


SIMATA   LD     IY,SIE2
         LD     H,32
         LD     L,24
         CALL   CHOQUE
         RET    NC
         CALL   MUERTE
         JP     MUERTE           ; [?]


SIMOV    CALL   ARIBA
         LD     A,(SIMOV1)
         CP     1
         JR     Z,SIDERE
         LD     A,(SIE1+1)
         SUB    4
         LD     (SIE1+1),A
         RET    NZ
         LD     A,1
         LD     (SIMOV1),A
         RET


SIDERE   LD     A,(SIE1+1)
         ADD    A,4
         LD     (SIE1),A         ; [?]
         CP     224
         RET    NZ
         LD     A,0
         LD     (SIMOV1),A
         RET


ARIBA    LD     A,(SIMOV2)
         CP     1
         JR     Z,SIABAJ         ; [?]
         LD     A,(SIE1)
         ADD    A,1              ; [?]
         LD     (SIE1),A
         CP     16
         RET    NZ
         LD     A,1
         LD     (SIMOV2),A
         RET


SIABAJ   LD     A,(SIE1)
         SUB    A,1              ; [?]
         LD     (SIE1),A
         CP     64
         RET    NZ
         LD     A,0
         LD     (SIMOV2),A
         RET


COPS1    LD     A,(SIE1)
         ADD    A,4
         LD     (SIE2),A
         LD     A,(SIE1+1)
         SUB    8
         LD     (SIE2+1),A
         RET


SIE1     DEFB   0,0,0,0,0,0,0,1,1,0
         DEFW   SSIE1
SIE2     DEFB   0,0,0,0,0,0,0,2,1,0
         DEFW   SSIE2,SSIE3


; --- [PÁGINA 4] SSIE2 datos + SIFIN2 ---------------------------------------

SSIE2    DEFB   5,4,0
SIFIN2   DEFB   255,000,224,000,224,127,000,255,000,255,000
         DEFB   255,000,224,000,255,000,255,000,255,000
         DEFB   255,000,224,127,000,255,000,255,000,255,000
         DEFB   255,000,224,127,000,255,000,255,000,255,000
         DEFB   255,000,224,127,000,255,000,255,000,255,000


; =============================================================================
; FIN — dark2-sierra
; -----------------------------------------------------------------------------
; SIERRA — trampa de sierra circular en Fase 2.
;   SIERRA → entrada (despacho según E2)
;   SIUP   → spawn (E2=1, MUPP de SIE1+SIE2, posiciones)
;   SIFASE → animación 3 fases del frame +8
;   SIMATA → choque con personaje (32×24 — sierra grande)
;   SIMOV  → movimiento horizontal entre X=2 y X=224
;   ARIBA/SIABAJ → movimiento vertical entre Y=16 y Y=64
;   COPS1  → SIE2 sigue a SIE1 con offset (+4 Y, -8 X)
; SIE1/SIE2 = dos sprites coordinados (la sierra aparece doble en pantalla).
; =============================================================================
