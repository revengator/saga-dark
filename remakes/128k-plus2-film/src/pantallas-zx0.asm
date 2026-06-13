; =============================================================================
; pantallas-zx0.asm — B+ pass: SCREEN_BUF shared + on-demand decompression.
;
; All PPANTn / COLORn / IMGSOL / IMGJACA are aliases of a SINGLE 4609-B buffer
; (= max(PPANTn) = PPANT7). Each pantalla decompresses its blob to SCREEN_BUF
; just before display via `show_pantalla(id)` (see main.asm — wrapper in bank 5
; fixed; core + blob table + dzx0 in bank 6 paged in slot 3).
;
; Audit (pelicula.asm + final.asm) confirms aliasing is safe:
;   - 9 PPANTs are single-load (VOLQ/VOLQ1/VOLQ2 or MITAD+BYTE+ATTR); IM2
;     animations (IM23 naves, BOMBA scroll, GOTAS rain) operate on the
;     framebuffer (16384), not on PPANT buffers.
;   - Single exception: FUEGO4 re-VOLQ's PPANT1 from inside the IM2 handler
;     during pantallas 1 + 10 (ABUELO + ABU2). The handler is disabled with
;     `IM 1` before each pantalla change, so the buffer is free to be reused
;     across transitions; PPANT1 simply gets re-decompressed at the start of
;     pantalla 10.
;   - BOOM (pantalla 3) reuses PPANT2 as a scratch buffer; with the alias
;     scheme that's the same SCREEN_BUF — works identically.
;   - IMGSOL (180 B) and IMGJACA (720 B) are only used in FINPELI, sequentially,
;     once each, via IMPRE5 (single-read tilemap blit).
;
; This pass dissolves the in-place backwards ZX0 layout that caused the
; PPANT5..9 + sunset visual bug — every blob is now forward, decompressed to
; a destination separate from its source.
; =============================================================================

SCREEN_BUF:     DEFS 4609, 0    ; max(PPANT) = PPANT7 (4609 B). Lives wherever
                                ; the assembler is at the time of INCLUDE
                                ; (banks 5/2/0 mid-stream — see MEMORY-MAP.md).

; --- Image aliases ----------------------------------------------------------
PPANT1          EQU SCREEN_BUF
PPANT2          EQU SCREEN_BUF
COLOR2          EQU SCREEN_BUF + 2048   ; PPANT2 = 2048 B pixels + 256 B attrs
PPANT3          EQU SCREEN_BUF
COLOR3          EQU SCREEN_BUF + 1024   ; PPANT3 = 1024 B pixels + 128 B attrs
PPANT4          EQU SCREEN_BUF
PPANT5          EQU SCREEN_BUF
PPANT6          EQU SCREEN_BUF
PPANT7          EQU SCREEN_BUF
PPANT8          EQU SCREEN_BUF
COLOR8          EQU SCREEN_BUF + 0x400  ; PPANT8 = 1024 B pixels + 128 B attrs
PPANT9          EQU SCREEN_BUF
IMGSOL          EQU SCREEN_BUF
IMGJACA         EQU SCREEN_BUF

; show_pantalla IDs — keep these in sync with the .blob_table in main.asm.
SP_PPANT1       EQU 0
SP_PPANT2       EQU 1
SP_PPANT3       EQU 2
SP_PPANT4       EQU 3
SP_PPANT5       EQU 4
SP_PPANT6       EQU 5
SP_PPANT7       EQU 6
SP_PPANT8       EQU 7
SP_PPANT9       EQU 8
SP_IMGSOL       EQU 9
SP_IMGJACA      EQU 10
