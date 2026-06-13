; =============================================================================
; RUTINA DE CONTROL DEL ENEMIGO FINAL F1
; Módulo: MF1
; Páginas escaneadas: 3 (dark1-final-boss-{1,2,3}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo original. Marcas '; [?]' indican lecturas dudosas
;        de la imagen — pendientes de revisión por el autor original.
; =============================================================================

; --- [PÁGINA 1] -------------------------------------------------------------

ENEMI1   EQU    53795
ENEMI2   EQU    53807
POSDAT   DEFW   TEF1
TEF1     EQU    59030
VARMAL   DEFB   0
VMALO    DEFB   0


NINJA    CALL   CAMBIO
         LD     A,(VARMAL)
         CP     0
         JP     Z,STARUP
         CP     255
         JP     Z,MALOMU
         CALL   MOVACT
         CALL   MATA
         CALL   MATA2
         RET


STARUP   LD     A,1
         LD     (DAMA4),A
         LD     (VARMAL),A
         LD     HL,TEF1
         LD     (POSDAT),HL
         LD     A,0
         LD     (VMALO),A
         LD     A,14
         LD     (POKEI+1),A
         LD     DE,ENEMI1
         CALL   MUPP
         LD     DE,ENEMI2
         CALL   MUPP
         CALL   DMALO
         LD     A,192
         LD     (ENEMI1),A
         LD     (ENEMI2),A
         RET


DAMA3    DEFB   0
DAMA4    DEFB   1


MALOMU   LD     A,(DAMA3)
         INC    A
         LD     (DAMA3),A
         CP     2
         JP     Z,MDOWN        ; [?] mnemónico/condición algo borrosa
         LD     A,(DAMA4)
         INC    A
         LD     (DAMA4),A
         CP     2
         JP     Z,SININ        ; [?]
         LD     A,(DAMA4)
         CP     113            ; [?]
         CALL   Z,SUP1         ; [?]
         CP     0
         JP     Z,NUTD
         LD     (ENEMI1),A
         ADD    A,64
         LD     (ENEMI2),A
         LD     A,(IX+1)
         LD     (ENEMI1+1),A
         LD     (ENEMI2+1),A
         INC    IX
         INC    IX
         LD     (POSDAT),IX

         RET                   ; [?] cierre estimado de bloque

; --- [PÁGINA 2] -------------------------------------------------------------

         CALL   0              ; [?] OCR no transcribió destino - stub provisional
         RET

DAMA1    DEFB   0


MOVACT   LD     A,(DAMA1)
         INC    A
         LD     (DAMA1),A
         CP     2
         RET    NZ
         LD     A,0
         LD     (DAMA1),A

         LD     IX,(POSDAT)
         LD     A,(IX)
         CP     113
         CALL   Z,SUP1
         CP     0
         JP     Z,NUTD
         LD     (ENEMI1),A
         ADD    A,64
         LD     (ENEMI2),A
         LD     A,(IX+1)
         LD     (ENEMI1+1),A
         LD     (ENEMI2+1),A
         INC    IX
         INC    IX
         LD     (POSDAT),IX

NUTD     LD     IX,TEF1
         LD     (POSDAT),IX
         JP     MOVACT


SUP1     PUSH   AF
         LD     A,(TABLA2)
         AND    A
         SBC    A,144
         POP    AF
         RET

         LD     A,(TABLA1)     ; [?] continúa rutina anexa
         SUB    16
         LD     (TABLA1),A
         SUB    16
         LD     (TABLA2),A
SONI2    EQU    $              ; etiqueta local (= dirección actual)
         POP    AF
         RET

SUP      LD     A,(TABLA1)     ; [?]
         ADD    A,16
         LD     (TABLA1),A
         ADD    A,16
         LD     (TABLA2),A
SONI1    EQU    $              ; etiqueta local (= dirección actual)


MATA     LD     IY,ENEMI1
         LD     H,72
         LD     L,40
         CALL   CHOQUE
         RET    NC
         JP     MUERTE


MATA2    LD     IY,ENEMI2
         LD     H,72
         LD     L,40
         CALL   CHOQUE
         RET    NC
         JP     MUERTE         ; [?]

; --- [PÁGINA 3] -------------------------------------------------------------

         RET                   ; [?] cierre

         LD     A,(DAMA2)
         INC    A
         LD     (DAMA2),A
         CP     2
         RET    NZ
         LD     A,0
         LD     (DAMA2),A

         LD     A,(VARB)       ; [?]
         CP     2
         JP     Z,SININ
         LD     A,(DADA)       ; [?]
         CP     2
         JR     Z,SINON        ; [?]

         LD     A,B            ; [?]
         CP     2
         JP     Z,SININ
         LD     A,(VMALO)
         ADD    A,B            ; [?]
         RET                   ; [?]

SINON    LD     A,0            ; [?]
         LD     (DADA),A       ; [?]


SININ    CALL   VIVE
         CALL   SONI1
         CALL   SONI2
         LD     A,(VMALO)
         ADD    A,B
         AND    255            ; (era 'AND A,255' por OCR)
         RET                   ; [?]
         LD     A,0
         LD     (VARMAL),A     ; [?]


DADA     DEFB   0


; =============================================================================
; FIN DE LA TRANSCRIPCIÓN
; -----------------------------------------------------------------------------
; Etiquetas referenciadas (a definir en otros módulos):
;   CAMBIO, MOVACT, MATA, MATA2, MUPP, DMALO, CHOQUE, MUERTE, VIVE,
;   POKEI, TABLA1, TABLA2, VARB
;
; Etiquetas locales definidas:
;   ENEMI1, ENEMI2, POSDAT, TEF1, VARMAL, VMALO,
;   NINJA, STARUP, DAMA1, DAMA2, DAMA3, DAMA4, DADA,
;   MALOMU, MOVACT, NUTD, SUP, SUP1, SONI1, SONI2,
;   SINON, SININ, MATA, MATA2
; =============================================================================
