
; Final de la pelicula

FINPELI     CALL    CLS

            LD      A,SP_IMGSOL
            CALL    show_pantalla
            LD      IX,TXTSOL
            LD      DE,IMGSOL
            CALL    IMPRE5

            LD      A,SP_IMGJACA
            CALL    show_pantalla
            LD      IX,TXTJACA
            LD      DE,IMGJACA
            CALL    IMPRE5
            
            CALL    CHARS1  
          
            LD      HL,EX2      ; E ampliada
            CALL    IMPREX2
            
            LD      HL,TEXTOFIN
            CALL    IMPREFIN
            
            LD      HL,TONII    ; como set de caracteres
            DEC     H           ; las caras del pijama
            LD      (23606),HL
            
            LD      HL,CARASFIN
            CALL    IMPREX2     ; 24861 Caras ampliadas
            
            CALL    POKSET
            
            LD      A,1         ; pokeamos IMPREFIN
            LD      (IMPREFIN+1),A
            LD      HL,RESETEA 
            CALL    IMPREFIN           

BUFIN       HALT    
            JR      BUFIN       ; BUCLE SIN FIN FINAL


; 25156 print especial

IMPREFIN    LD      A,2
            PUSH    HL
            CALL    5633
            POP     HL
BUCIMPREX   LD      A,(HL)
            CP      255
            RET     Z
            
            INC     HL
            PUSH    HL
            RST     16
            POP     HL
            PUSH    HL
            LD      HL,1
            LD      DE,10
            CALL    $3B5
            LD      B,3
ESPERA1     HALT
            DJNZ    ESPERA1
            POP     HL
            JR      BUCIMPREX
            
; E AMPLIADA            
EX2         DEFB    $16,$0B,$00,$13,$00,$11,$01,$7A
            DEFB    $7C,$16,$0C,$00,$13,$01,$7B,$7D
            DEFB    255    

TXTSOL      DEFB    2,10,0,18,0 ; 2x10 x9 = 180 bytes 

TXTJACA     DEFB    8,10,0,0,0  ; 8x10 x9 = 720 bytes

RESETEA     DEFB    $16,$01,$04,$10,$06,$13,$01
            DEFM    'RESETEA Y CARGA EL JUEGO'
            DEFB    255
            
CARASFIN    DEFB 22,19,2,16,7,17,0,19,0
            DEFB 33,34,35,57,57,57,45,46,47
            DEFB 57,57,57,57,58,59,57,57,57
            DEFB 69,70,71,57,57,57,81,82,83
            DEFB 22,20,2,37,38,39,57,57,57
            DEFB 49,50,51,57,57,57,61,62,63
            DEFB 57,57,57,73,74,75,57,57,57
            DEFB 85,86,87,22,21,2,41,42,43
            DEFB 57,57,57,53,54,55,57,57,57
            DEFB 65,66,67,57,57,57,77,78,79
            DEFB 57,57,57,89,90,91,255,62,1
            DEFB 50,69,98,33,251,132,205,68,98
            DEFB 201,22,1,4,16,6,19,1,82
            DEFB 69,83,69,84,69,65,32,89,32
            DEFB 67,65,82,71,65,32,69,76,32
            DEFB 74,85,69,71,79,255
		
; 33010 8x10 x9 = 720 bytes — IMGJACA is now an alias of SCREEN_BUF
; (see pantallas-zx0.asm). Decompressed on-demand by show_pantalla.
