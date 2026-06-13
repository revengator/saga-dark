; =============================================================================
; SAGA DARK — DARK3 (FASE DEL DRAGÓN)
; =============================================================================
; Master build file para sjasmplus 1.23.0+. Objetivo: byte-a-byte idéntico al
; rango 0x9C40-0xFFFF (25536 bytes) de dark3.sna.
;
; Memoria (per docs/dark3-memory-map.md):
;   33088 (0x8140) — pantalla bitmap (6912B; NO incluida en este build)
;   40000 (0x9C40) — programa (2995B + datos)
;   42995 (0xA7B3) — atributos bocas (360B)
;   43355 (0xA8FB) — atributos dragón (1536B)
;   44892 (0xAEFC) — frames boca (576B)
;   47772 (0xBA9C) — animación personaje (1345B)
;   49117 (0xBFDD) — puente final (256B)
;   49373 (0xC0DD) — luna (288B)
;   51966 (0xCAFE) — puente 4 frames (1024B)
;   52991 (0xCEFF) — dragón sprite (12288B, ¡el más grande!)
;   65279 (0xFEFF) — cargador (256B)
;
; Build: cd src/dark3 && sjasmplus --raw=../../build/dark3.bin dark3.asm
; =============================================================================

         ORG 0x9C40
         INCLUDE "dragon.asm"

; =============================================================================
; FIN — dark3 termina en 0xFFFF. Total: 25536 bytes.
; =============================================================================
