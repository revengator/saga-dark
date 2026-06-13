; =============================================================================
; RUTINA DE CONTROL DEL GLOBMAN — M.F2
; Módulo: dark2-globman
; Páginas escaneadas: 3 (dark2-globman-{1..3}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        GLOBMAN = enemigo "blob" grande de Fase 2 (jefe del pantano).
; =============================================================================

ENEMI1   EQU    56310
TEF2     EQU    54016


POSDAT   DEFW   TEF2

VARMA    DEFB   0
VMALO    DEFB   0


; --- [PÁGINA 1] GLOBO + STARUP + DAMA*/MALOMU + MAL11 + DAMA1 -------------

GLOBO    CALL   CAMBIO
         LD     A,(VARMA)
         CP     0
         JP     Z,STARUP
         CP     255
         JP     Z,MALOMU
         CALL   MOVACT
         CALL   MATA
         CALL   MATA2            ; [?]
         RET


STARUP   LD     A,1
         LD     (DAMA4),A
         LD     (VARMA),A
         LD     HL,TEF2
         LD     (POSDAT),HL
         LD     A,0
         LD     (VMALO),A
         LD     A,14
         LD     (POKEI+1),A      ; [?]
         LD     DE,ENEMI1
         LD     HL,ENEMI1+8
         CALL   MUPP
         LD     DMALO            ; [?] (CALL DMALO)
         LD     A,128
         LD     (ENEMI1+1),A     ; [?]
         RET


DAMA3    DEFB   0
DAMA4    DEFB   1


MALOMU   LD     A,(DAMA2)
         INC    A
         LD     (DAMA2),A
         CP     2
         RET    NZ
         LD     A,0
         LD     (DAMA2),A
         CALL   Z,MUPP           ; [?]
         JP     MUERTE           ; [?]


NUTD     LD     IX,TEF2
         LD     IY,POSDAT
         JP     MOVACT


GLOPIE   PUSH   AF
         LD     A,1
         LD     (ENEMI1+8),A
         POP    AF
         RET


MATA     LD     IY,ENEMI1
         LD     H,56
         LD     L,56
         CALL   CHOQUE
         RET    NC
         CALL   MUERTE
         JP     MUERTE           ; [?]


DAMA2    DEFB   0


MATA2    LD     IY,ENEMI1
         LD     H,56
         LD     L,56
         CALL   PALO
         RET    NC
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(DAMA2)
         INC    A
         LD     (DAMA2),A
         CP     6
         RET    NZ
         LD     A,0
         LD     (DAMA2),A
         LD     A,(VARB)
         LD     B,A

; --- [PÁGINA 2] DAMA1 + MOVACT + NUTD + GLOPIE + MATA + DAMA2 + MATA2 ----

DAMA1    DEFB   0


MOVACT   LD     A,(DAMA1)
         INC    A
         LD     (DAMA1),A
         CP     2
         RET    NZ
         LD     A,0
         LD     (DAMA1),A
         LD     A,2
         LD     (ENEMI1+8),A
         LD     A,(POSDAT)
         LD     A,(IX)
         CP     128
         JP     Z,NUTD
         LD     A,(ENEMI1+1)
         LD     A,(IX+1)
         INC    IX
         INC    IX
         LD     (POSDAT),IX
         RET


NUTD_    LD     IX,TEF2          ; [?] (NUTD definido arriba)
         LD     (POSDAT),IX
         JP     MOVACT


GLOPIE_  PUSH   AF
         LD     A,1
         LD     (ENEMI1+8),A
         POP    AF
         RET


MATA_    LD     IY,ENEMI1        ; [?] (MATA definido arriba)
         LD     H,56
         LD     L,56
         CALL   CHOQUE
         RET    NC
         CALL   MUERTE
         JP     MUERTE


DAMA2_   DEFB   0                ; [?]


MATA2_   LD     IY,ENEMI1        ; [?] (MATA2 definido arriba)
         LD     H,56
         LD     L,56
         CALL   PALO
         RET    NC
         LD     A,(DAT2)
         CP     1
         RET    NZ
         LD     A,(DAMA2)
         INC    A
         LD     (DAMA2),A
         CP     6
         RET    NZ
         LD     A,0
         LD     (DAMA2),A
         LD     A,(VARB)
         LD     B,A
         CP     2
         JR     Z,SININ          ; [?] (continúa abajo)

; --- [PÁGINA 3] SINON/SININ + DADA flag -----------------------------------

         INC    A
         LD     (DADA),A
         CP     2
         JR     Z,SINON
         LD     A,(VMALO)
         ADD    A,B
         LD     (VMALO),A
         RET


SINON    LD     A,0
         LD     (DADA),A


SININ    PUSH   BC
         CALL   VIVE
         CALL   SONI1
         CALL   SONI2
         CALL   SONI3
         POP    BC
         LD     A,(VMALO)
         ADD    A,B
         LD     (VMALO),A
         AND    A
         SBC    A,47             ; [?]
         RET    C
         LD     A,255
         LD     (VARMA),A
         RET


DADA     DEFB   0


; =============================================================================
; FIN — dark2-globman
; -----------------------------------------------------------------------------
; GLOBMAN — boss del pantano de Fase 2 ("La Viscosa del Pantano").
;   Sprite ENEMI1 (EQU 56310, 1816 bytes); datos de movimiento TEF2 (EQU 54016).
;
;   GLOBO    → entrada principal (despacho según VARMA)
;   STARUP   → spawn (pone POSDAT al inicio de TEF2, MUPP, DMALO, posición Y=128)
;   MALOMU   → muere (DAMA2 cuenta los frames de explosión)
;   NUTD     → reset puntero TEF2 cuando llega al final (byte 128 = fin de tabla)
;   GLOPIE   → frame "pie" (sprite +8 = 1)
;   MATA     → choque con personaje (H=56 L=56 — sprite grande)
;   MATA2    → recibe palo (umbral DAMA2=6 frames + acumular 47 daño en VMALO)
;   MOVACT   → mueve siguiendo la tabla TEF2 (cada 2 frames lee siguiente Y,X)
;   SININ/SINON → animación al recibir daño (VIVE + 3 sonidos SONI1/2/3)
;   DADA     → flag interno de SININ
;
; TEF2 (54016, 554 bytes) = tabla de movimiento (pares Y,X terminada en 128).
; ENEMI1 (56310, 1816 bytes) = datos gráficos del sprite GLOBMAN.
; =============================================================================
