; =============================================================================
; SAGA DARK — engine — CARA_PERSO (player face sprite, HUD)
; -----------------------------------------------------------------------------
; 72 B sprite, byte-identical between Dark 1 and Dark 2 (verified 2026-04-30).
; In Dark 1 it lives at 0xE52E; in Dark 2 at 0xE60C — same content, different
; absolute address. Engine-shared data: lives in engine/.
; =============================================================================

CARA_PERSO:
         INCBIN "data/cara-perso.bin"   ; 72 B
