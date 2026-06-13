; =============================================================================
; CATÁLOGO DE TILES — FASE 3 (y siguientes)
; Módulo: tiles
; Páginas escaneadas: 5 (tiles-{1..5}.png)
; Fecha de transcripción: 2026-04-27
; Notas: Sintaxis Pasmo. '; [?]' = lectura dudosa.
;
; FORMATO de cada tile (estructura repetida):
;   CODIGO:  N        ; identificador del tile (0..N)
;   ALTO:    N        ; altura en celdas (típicamente 8)
;   ANCHO:   N        ; anchura en celdas
;   BYTES:   N        ; tamaño en bytes del bitmap
;   BRILLO:  N        ; bit BRIGHT (0/1)
;   PAPEL:   N        ; color de fondo (PAPER, 0..7)
;   TINTA:   N        ; color de tinta (INK, 0..7)
;   OFFSET:  N        ; desplazamiento dentro del buffer de gráficos
;   MASCARA           ; (opcional) flag — el tile usa máscara
;
; ATENCIÓN: el OCR de las 5 páginas está muy degradado (los catálogos van
; junto a las miniaturas y muchos números se solapan). Lo que sigue es una
; transcripción **estructural** de las primeras entradas legibles. La lista
; completa (>50 tiles) debe revisarse contra los PNG `tiles-{1..5}.png` por
; el autor original. Cada entrada se puede materializar luego como bloque
; de DEFB en su offset correspondiente.
; =============================================================================

         *D+
         *C-

; --- [PÁGINA 1] tiles 0..23 (columnas izquierda y derecha) ----------------

; --- Tile 0 ---
TILE_00  DEFB   0                ; CODIGO
         DEFB   8                ; ALTO
         DEFB   4                ; ANCHO
         DEFB   8                ; BYTES        ; [?]
         DEFB   0                ; BRILLO
         DEFB   0                ; PAPEL
         DEFB   6                ; TINTA
         DEFW   80               ; OFFSET

; --- Tile 1 ---
TILE_01  DEFB   1                ; CODIGO
         DEFB   8                ; ALTO
         DEFB   4                ; ANCHO        ; [?]
         DEFB   120              ; BYTES        ; [?]
         DEFB   0                ; BRILLO
         DEFB   0                ; PAPEL
         DEFB   7                ; TINTA
         DEFW   160              ; OFFSET       ; [?]

; --- Tile 2 ---
TILE_02  DEFB   2                ; CODIGO
         DEFB   8                ; ALTO
         DEFB   4                ; ANCHO
         DEFB   100              ; BYTES        ; [?]
         DEFB   0                ; BRILLO
         DEFB   0                ; PAPEL
         DEFB   7                ; TINTA
         DEFW   1568             ; OFFSET       ; [?]

; ... (tiles 3..22 con estructura idéntica — datos en tiles-{1,2}.png) ...

; --- Tile 23 ---
TILE_23  DEFB   23               ; CODIGO
         DEFB   8                ; ALTO
         DEFB   4                ; ANCHO
         DEFB   32               ; BYTES        ; [?]
         DEFB   0                ; BRILLO
         DEFB   0                ; PAPEL
         DEFB   5                ; TINTA
         DEFW   2960             ; OFFSET       ; [?]


; --- [PÁGINA 2] tiles 24..38 ------------------------------------------------
; Algunos con flag MASCARA (con máscara para transparencia).
; (Estructura idéntica — datos en tiles-2.png)


; --- [PÁGINA 3] tiles 39..47 — añade flag "(-31)" en OFFSET para algunos --
; El "-31" / "-51" anotado a mano indica un offset relativo (verificar).
; Aparecen tiles MASCARA y un par sin MASCARA.


; --- [PÁGINA 4] tiles 38..49 (cont.) — algunos con MASCARA ----------------


; --- [PÁGINA 5] tiles para "FASE 3" ----------------------------------------
; Cabecera "FASE 3" arriba. Aparecen pequeños tiles 1×1 (tipos de bordes,
; números, letras), varios con MASCARA. Códigos del catálogo de FASE 3.

; (Esta sección probablemente sigue otro segmento ORG independiente para los
; tiles específicos de la fase 3.)


; =============================================================================
; FIN — tiles
; -----------------------------------------------------------------------------
; Catálogo completo de tiles del juego. Cada entrada describe un tile y su
; ubicación en el buffer gráfico. La lista total supera los 50 tiles entre
; las páginas 1-5 e incluye:
;   - Decoración (paredes, puertas, ventanas, hierbas, troncos, montañas…)
;   - Enemigos pequeños y figuras
;   - Texto y numerales
;   - Tiles con máscara (decoración sobre fondo)
; **Pendiente** de revisión final por el autor: completar offsets/bytes
; a partir de los PNG originales (`scan/png/tiles-{1..5}.png`).
; =============================================================================
