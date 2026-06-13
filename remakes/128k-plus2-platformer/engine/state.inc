; =============================================================================
; SAGA DARK — engine — canonical shared state-var block (E4)
; -----------------------------------------------------------------------------
; The unified engine is ONE motor in fixed banks, so the game-state variables it
; reads/writes must live at ONE fixed address each, shared by every level. This
; file is the single source of truth for those addresses.
;
; Anchor: the common-free zone at 0xA6A1+ — forced by the hardware map. The
; largest level's enemy code (Phase 2) ends at 0xA6A0, so the shared state must
; sit above it. The canonical addresses therefore coincide with Dark 2's layout
; (Phase 2 already lives here); convergence work is moving **Phase 1**'s vars up
; from its scattered Dark 1 layout (0xA60C+) to these addresses. Because the
; anchor == Dark 2, the dark2-v2 wrapper stays byte-perfect; dark1-v2 (already a
; smoke test) is the one that diverges. See UNIFIED-ENGINE.md §"Convergence".
;
; Two kinds of symbol:
;   - EQU here:   vars with no DEFB of their own (they index into the VAR_PRE /
;                 T01 data blocks). Defined actively below.
;   - label vars: vars that own a DEFB initial value (VAR0/VAR7/E1/…). Defined as
;                 labels in the per-level data modules (levels/phaseN/{data,e123}),
;                 placed AT these canonical addresses. Documented in the map below
;                 but not EQU'd here (would clash with the labels).
;
; NOTE: T0 (0xA6E7) is intentionally NOT defined here — it stays in
; levels/phase2/defines.inc so the byte-perfect dark2-v2/v1 nets keep resolving
; it without pulling in this file. Its canonical address is in the map below.
; =============================================================================

; --- EQU vars (no own DEFB; offsets into VAR_PRE / T01) ---------------------
POD4_VAR    EQU 0xA6A2      ; POD4 power-up counter
ABUELO_OFF  EQU 0xA6A7      ; VAR12 — abuelo (grandfather) state offset
VAR10       EQU 0xA6A8
VAR1        EQU 0xA6A9      ; power-up phase (PODERS dispatch)
PEDD1       EQU 0xA6FA      ; into T01 block
TP0         EQU 0xA77D      ; into T01 block

; --- Canonical address map (label vars defined in levels/phaseN/{data,e123}) -
; Keep this table in sync with the per-level data modules. Dark 1 column is the
; pre-convergence Phase 1 address (where Phase 1 still puts the var today).
;
;   var      canonical(=D2)   Dark1(pre-conv)   owner module
;   VAR13    0xA6AA           0xA615            phaseN/data.asm
;   VAR7     0xA6AB           0xA616            phaseN/data.asm
;   VARB     0xA6AC           0xA617            phaseN/data.asm
;   VAR2     0xA6AE           0xA619            phaseN/data.asm
;   VAR47    0xA6AF           0xA61A            phaseN/data.asm
;   VAR49    0xA6B3           0xA61E            phaseN/data.asm
;   VAR25    0xA6B4           0xA61F            phaseN/data.asm   (20-byte block)
;   VAR0     0xA6C8           0xA633            phaseN/data.asm   (+PAN_PAD per-level)
;   T0       0xA6E7           0xA652            phase2/defines.inc EQU
;   E1       0xA8F7           0xA84B            phaseN/e123.asm
;   E2       0xA8F8           0xA84C            phaseN/e123.asm
;   E3       0xA8F9           0xA84D            phaseN/e123.asm
;   VARMA    0xA8FA           (Phase 2 only)    phase2/e123.asm
; =============================================================================
