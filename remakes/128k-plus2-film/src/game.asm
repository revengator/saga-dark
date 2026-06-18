;******************************************************************
;*** TRITON SOFTWARE **** SAGA FILM *******************************
;******************************************************************


; CONSTANTES
SCREEN  EQU 16384       ; Inicio del area de pantalla
PILA    EQU 23999       ; Pila del sistema
INICIO  EQU 24000       ; 24000 Inicio del codigo

VAR     EQU 23728       

; INICIO DEL PROGRMA

        ORG INICIO

        LD  A,0
        OUT (254),A     ; Color del borde

        ; 128k-plus2-film fork: skip the original PAUSE-1 (any-key wait).
        ; The menu below acts as the wait-for-key — user must choose
        ; 1 or 2 to continue, which is more discoverable.

MAIN    CALL POKSET     ; Activamos set de caracteres
        CALL CLS        ; Limpiamos pantalla
        LD HL,TEXTO
        CALL IMPREC     ; Imprimirmos Copyright
        CALL BORDE      ; Efecto sonido y color de borde
        LD HL,DARKT
        CALL IMPREC     ; Imprime DARK

        ; --- 128k-plus2-film FORK: language menu --------------------------
        ; Show "1=ESPANOL 2=ENGLISH" below the copyright and wait for key.
        ; '1' (or default after the wait): keep Spanish.
        ; '2': page bank 1 (English-strings stash) and LDIR over the ES
        ;      strings in place. Then continue with the original flow.
        LD   HL,LANG_MENU
        CALL IMPREC
LANG_WAIT:
        HALT                    ; let interrupts fire (allows future EI)
        LD   BC,0xF7FE          ; keyboard row 1 2 3 4 5
        IN   A,(C)
        CPL                     ; invert: now 1 = pressed
        AND  0x03               ; isolate bits 0 (key '1') and 1 (key '2')
        JR   Z,LANG_WAIT
        CP   0x01
        JP   Z,LANG_DONE        ; '1' pressed → ES default, no overlay
        ; '2' pressed → page bank 1 and call its overlay routine, then
        ; restore bank 0. The loop+table itself lives in bank 1 to save
        ; bytes inside the film's main code area (which is bumping into
        ; the IM2 vector at 0xFDFD).
        ;
        ; CRITICAL: DI around the bank-1 swap. The IM2 vector trampoline
        ; (`JP master_im2`) lives in bank 0 at 0xFDFD. While bank 1 is paged
        ; into slot 3, 0xFDFD holds whatever bank 1 has there (zeros). An
        ; interrupt firing then would JP to NOPs and crash → reset to BASIC.
        ; The pre-music film didn't have this issue because it ran in IM 1
        ; until RAINM2 below; we now arm IM 2 at boot so the overlay must
        ; run with interrupts disabled.
        DI
        LD   BC,0x7FFD
        LD   A,0x11             ; 48K ROM in slot 0, bank 1 in slot 3
        OUT  (C),A
        CALL 0xCB00             ; bank 1 LANG_OVERLAY: overlays ES→EN strings, stages TEXTOFIN_EN to 0x5B14
        CALL lang_final         ; bank 5 helper: pages bank 0 back + LDIRs staged TEXTOFIN_EN to 0xFFB5
        EI                      ; bank 0 is back in slot 3 → 0xFDFD trampoline is live again
LANG_DONE:
        CALL wipe_menu  ; blank "1 - ESPANOL / 2 - ENGLISH" now that a choice is made
        ; Music refactor: the original `CALL RAINM2` armed IM 2 with whatever
        ; was at 0xFDFE/FF (which was `JP GOTAS` from the trampoline). With
        ; master_im2 permanent we have to set `current_anim` to GOTAS
        ; explicitly.
        LD HL,GOTAS
        LD (current_anim),HL
        CALL RAINM2     ; Pone gotas IM2 en marcha (RAINM2 is now a no-op)
        LD B,100
        
NUBE    HALT
        DJNZ NUBE
        CALL BO
        CALL TONI
        LD A,0
        LD (23560),A

ESPERA  LD  HL,$5C3B
        RES 5,(HL)
GUSANO  LD  HL,$5C3B
        BIT 5,(HL)
        JR  NZ,CONT8
        LD  A,(DAT9)
        DEC A
        CP  0
        JR  Z,CONT8
        LD  A,(DAT8)
        DEC A
        LD  (DAT8),A
        CP  0
        CALL Z,RALLAS
        HALT
        JR  GUSANO
CONT8   CALL IMPRE3
        LD  B,50
TURURU  HALT
        DJNZ TURURU
        CALL CLS
        CALL OUTM2
        CALL IMPRE3
        CALL CLS
ESTASS  CALL AMPLI_E     ; E AMPLIADA        
        LD  HL,NUBO      
        CALL IMPRE4      ; ESTAS SON LA PERSONAS ...
        LD  B,100
LLUVIA  HALT
        DJNZ LLUVIA
        CALL IMPRE3
        CALL CLS
        CALL PIJAMA      ; SCROLL ARRIBA PIJAMA
YLAHIS  CALL CLS
PATCH_Y CALL AMPLI_Y     ; Y AMPLIADA — patched to NOPs by lang_final in EN mode
        LD  HL,HIST
        CALL IMPRE4      ; Y LA HISTORIA COMIENZA
        LD  B,50
ASASA   HALT
        DJNZ ASASA
        CALL IMPRE3
        CALL CLS
        CALL LAJACA      ; 2 PARTE JACA
        CALL PELICULA    ; 3 PARTE LA PELICULA
        
        JP  FINPELI

HIST    DEFB 22,11,6 ; POS Y,X
        DEFB 16,9 ; COLOR (9:)
        DEFB 17,0
        DEFM 'LA HISTORIA COMIENZA ...'
        DEFB 255
        
NUBO    DEFB 16,7 ; COLOR (7:BLA)
        DEFB 22,10,6 ; POS Y,X
        DEFM 'STAS SON LAS PERSONAS'
        DEFB 22,12,3 ; POS Y,X
        DEFM 'QUE HAN HECHO POSIBLE QUE'
        DEFB 22,14,3 ; POS Y,X
        DEFM 'PUEDAS PASAR UN BUEN RATO'
        DEFB 255
        

; --- 128K-plus2-film MUSIC REFACTOR -----------------------------------------
; Originally these toggled IM 1/IM 2 to enable/disable per-scene animation
; handlers (GOTAS, FUEGO, IM23, BOMBA…). With the AY music subversion, IM 2
; is permanent (the master_im2 handler in bank 2 calls music_tick every
; frame); per-scene animation is now selected by writing the handler address
; into `current_anim` (in bank 2). RAINM2 / OUTM2 keep their names and arity
; (zero-arg, RET) for source-level compatibility, but no longer touch IM.
;
; - RAINM2: NO-OP. Callers used to "arm IM 2 with whatever handler was already
;   in 0xFDFE/FF". Today, callers also write `current_anim` directly (or use
;   FUEGO_ON / inline `LD HL,handler / LD (current_anim),HL`) so RAINM2 has
;   nothing left to do.
; - OUTM2: clears current_anim → "no animation, music keeps playing".
RAINM2  RET

OUTM2   JP anim_off
                
; COPYRIGHT

TEXTO   DEFB 22,21,2 ; POS Y,X
        DEFB 16,6 ; COLOR (6:AMA)
        DEFB 19,1,17,0
        DEFB 91 ; (C)
        DEFM ' 1987-2026 TRITON SOFTWARE'
        DEFB 255

; lOGOTIPO SAGA DARK INICIO

DARKT   DEFB 16,7 ; COLOR (7:BLA)
        DEFB 19,1
        DEFB 22,2,10 ; POS Y,X
        DEFB 92,19,0,93,94
        DEFB 22,3,10 ; POS Y,X
        DEFB 19,1,95,19,0,96,97,19,1
        DEFB 22,4,10 ; POS Y,X
        DEFB 19,1,98,19,0,99,100
        DEFB 22,3,13 ; POS Y,X
        DEFB 101,102,103,107,108,114,115
        DEFB 22,4,13 ; POS Y,X
        DEFB 104,105,106,109,110,116,117
        DEFB 22,2,17 ; POS Y,X
        DEFB 19,1,111,19,0,112,113
        ; SAGA SUPERIOR
        DEFB 16,4 ; COLOR (4:VER)
        DEFB 19,1
        DEFB 22,1,11 ; POS Y,X
        DEFB 118,119,120,121
        DEFB 255

PRESA   DEFM 'PULSE  UNA  TECLA              '
        DEFB 255

; 128k-plus2-film FORK: language menu shown after the SAGA DARK logo.
LANG_MENU
        DEFB 22,14,10           ; POS Y=14, X=10
        DEFB 16,7               ; INK 7 (white)
        DEFB 19,1,17,0          ; bright 1, paper 0
        DEFM '1 - ESPA&OL'   ; & maps to Ñ in the custom charset (charset.asm idx 38)
        DEFB 22,16,10           ; POS Y=16, X=10
        DEFB 16,7
        DEFM '2 - ENGLISH'
        DEFB 255


; INCLUDES

        INCLUDE libreria.asm    ; Libreria de funciones
        INCLUDE charset.asm     ; tabla de caracteres
        INCLUDE pijama.asm      ; pijama cine   
        INCLUDE jaca.asm        ; la jaca   
        INCLUDE pelicula.asm    ; la pelicula
        INCLUDE final.asm        
        INCLUDE pantallas-zx0.asm  ; screens — PPANT1..4 ZX0-stashed in bank 6

FINCODIGO   DEFB    0

; INTERRUPCION ENMASCARABLE 2

        DEFS 65021-$,0   ; padding hasta IM2 vector
        ORG 65021
        JP master_im2   ; was: JP GOTAS — now routes through the music handler
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253        
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253,253,253,253,253,253,253,253
        DEFB 253                                                                                                                                                                                                                                                        
          

; esto tiene que ir aqui detras
; hemos ocupado toda la memoria disponible !!!!

; 33730 2x10 x9 = 180 bytes — IMGSOL is now an alias of SCREEN_BUF
; (see pantallas-zx0.asm). Decompressed on-demand by show_pantalla.
        
TEXTOFIN    DEFB    22,12,2 ; COORD Y, X
            DEFB    19,1,16,5,17,0
            DEFM    'STE ES EL FINAL DE LA HISTORIA'
            DEFB    22,14,5 ; COORD Y,X
            DEFM    'LO DEMAS ES COSA TUYA.'
            DEFB    255
                                          
; FIN DEL CODIGO

FINCODIGO2  DEFB    0

; (END INICIO removed in 128k-plus2-film fork — main.asm wraps this and needs
; to continue processing past here for SAVESNA. The original cassette used
; the END to set the autostart address; in our +2 build the bootstrap
; explicitly JPs to ENTRY=INICIO.)
        
        

