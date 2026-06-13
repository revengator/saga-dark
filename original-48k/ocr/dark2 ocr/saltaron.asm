; =============================================================================
; RUTINA DE CONTROL DEL SALTARON — M.F2
; Módulo: dark2-saltaron (parte de dark2-varios.pdf, páginas 8-10)
; Páginas escaneadas: 3 (dark2-varios-{08..10}.png — secciones inferiores)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
; =============================================================================

; --- [PÁGINA 8] SALTA + SALUP + SALMAT + SALMU + SALMOV ------------------

SALTA    LD     A,(E2)
         CP     0
         JP     Z,SALUP
         CP     255
         JP     Z,SALMUO         ; [?] (SALMU)
         CALL   SALMAT
         CALL   SALMU
         CALL   SALMOV
         RET


SALUP    LD     A,R
         AND    31
         RET    NZ
         LD     A,1
         LD     (E2),A
         LD     DE,SALTON
         CALL   MUPP

; --- [PÁGINA 9] SALMOV + SOPRE + SALMUO + SALAB + SALABA + SALTON datos --

         LD     A,(SALUD)
         CP     0
         JP     Z,SOPRE
         CALL   SALAB
         LD     A,(SALTON+1)
         SUB    4
         LD     (SALTON+1),A
         CP     0
         RET    NZ
         LD     A,0
         LD     (E2),A
         CALL   MDOWN
         RET


SOPRE    LD     A,(SALTON)
         ADD    A,B              ; [?]
         LD     (SALTON),A
         CP     192-40
         RET    NZ
         LD     A,1
         LD     (SALUD),A
         RET


SALMUO   CALL   SALAB             ; [?] alias?
         LD     A,(SALTON+1)
         SUB    4
         LD     (SALTON+1),A
         CP     0
         RET    NZ
         LD     A,0
         LD     (E2),A
         CALL   MDOWN
         RET


SALAB    LD     A,(SALSAL)
         CP     1
         JP     Z,SALABA
         LD     A,(SALTON)
         SUB    4
         LD     (SALTON),A
         CP     152-40            ; [?]
         RET    NZ
         LD     A,1
         LD     (SALSAL),A
         RET


SALABA   LD     A,(SALTON)
         ADD    A,4
         LD     (SALTON),A
         CP     152
         RET    NZ
         LD     A,0
         LD     (SALSAL),A
         RET


SALTON   DEFB   0,0,0,0,0,0,0,1,1,0
         DEFW   SAL001

SALUD    DEFB   0
SALOO1   DEFB   5,5,0
SALFIN   DEFB   231,000,063,000,255,000,255,000,255,000,
         DEFB   194,024,127,000,255,000,255,000,255,
         DEFB   ;...                                     ; [?]


; =============================================================================
; FIN — dark2-saltaron
; -----------------------------------------------------------------------------
; SALTARON — enemigo saltarín de Fase 2.
;   SALTA   → entrada (despacho según E2)
;   SALUP   → spawn aleatorio (R AND 31)
;   SALMOV  → movimiento (controla SALUD: persigue al jugador)
;   SOPRE   → al subir hasta Y=152
;   SALAB/SALABA → ciclo subir/bajar (SALSAL toggle)
;   SALMUO  → muere (sale por la izquierda con SUB 4 hasta X=0)
; SALTON = sprite header con un frame SAL001.
; =============================================================================
