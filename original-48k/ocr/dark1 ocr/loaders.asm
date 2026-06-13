; =============================================================================
; CARGADORES (BLOQUE 4)
; Módulo: dark1-loaders
; Páginas escaneadas: 1 (dark1-loaders-1.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;        Dos cargadores en código máquina:
;          - CARGADORP (CARGA F2)   en 64606  → carga el bloque siguiente
;          - TRITONCODE (CARGA FASE1) en 65279 → cargador del juego completo
;        Llaman a la rutina ROM 1366 (LD-BYTES) con SCF y A=255 (datos).
; =============================================================================

; --- [PÁGINA 1 — parte 1] CARGADORP (CARGA F2) -----------------------------
;
; Arranca en 64606. Llama a la ROM (LD-BYTES en $0556 = 1366) para leer un
; bloque de 256 bytes a $FEFF (65279) y salta allí.

         *D+
         *C-

         ORG    64606

         LD     IX,65279
         LD     DE,256
         LD     A,255
         EI
         SCF
         CALL   1366
         DI
         JP     65279


; --- [PÁGINA 1 — parte 2] TRITONCODE (CARGA FASE1) -------------------------
;
; CARGADOR JUEGO — arranca en 65279.

         *D+
         *C-

         ORG    65279

         LD     A,0
         OUT    (254),A
         LD     A,7
         LD     (23693),A         ; ATTR_P (color de fondo)
         CALL   #0D6B             ; ROM 0D6Bh = CL-ALL (clear screen)

         LD     HL,16384+6144     ; inicio área de atributos
         LD     BC,768
BU2      LD     A,0
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,BU2

         LD     DE,28116          ; primera carga: 28116 bytes a 16384
         LD     IX,16384
         LD     A,255
         SCF
         CALL   1366

         LD     DE,20879          ; segunda carga: 20879 bytes a 45000
         LD     IX,45000
         LD     A,255
         SCF
         CALL   1366

         LD     A,0
         OUT    (254),A
         LD     HL,16384+6144
         LD     BC,512+96
BU1      LD     A,0
         LD     (HL),A
         INC    HL
         DEC    BC
         LD     A,B
         OR     C
         JR     NZ,BU1

         JP     43756             ; [?] (43756 ó 43166) — punto de entrada del juego


; =============================================================================
; FIN — dark1-loaders
; -----------------------------------------------------------------------------
; Dos cargadores en cinta:
;   1) CARGADORP @ 64606 — pequeño bootstrap que carga 256 bytes a 65279
;   2) TRITONCODE @ 65279 — el cargador real del juego:
;      - pone borde y attrs a negro
;      - limpia atributos
;      - carga 28116 bytes a 16384 (pantalla SCREEN$)
;      - carga 20879 bytes a 45000 (programa)
;      - limpia parte del área de atributos
;      - JP a la entrada del juego (~43756 — verificar)
; ROM 1366 ($0556) = LD-BYTES, ROM 0D6B = CL-ALL.
; =============================================================================
