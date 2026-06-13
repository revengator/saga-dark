; =============================================================================
; PANTALLAS DEL JUEGO — anexo visual
; Módulo: screens
; Páginas escaneadas: 1 (screens-1.png)
; Fecha de transcripción: 2026-04-27
; Notas: Este "módulo" del listado original NO contiene código fuente.
;        Es un anexo gráfico con las 10 pantallas del juego renderizadas
;        a partir de los tiles del catálogo (módulo 21).
;
;        Se incluye este fichero por completitud — la información real
;        está en `scan/png/screens-1.png`.
; =============================================================================

; --- Contenido de screens-1.png (10 pantallas) ------------------------------
;
; Columna izquierda (de arriba a abajo):
;   1. Portada con logo "DARK" — ilustración fija con monstruos y guerreros.
;   2. Pantalla 1 — exterior con palafitos, hierba en suelo (marcada "A").
;   3. Pantalla 2 — exterior similar, con figuras (NPC?).
;   4. Pantalla 3 — exterior con montaña al fondo, salientes y enemigos.
;   5. Pantalla 4 — interior oscuro con figuras pequeñas.
;
; Columna derecha (de arriba a abajo):
;   6. Pantalla 5 — exterior con palafitos y horizonte montañoso.
;   7. Pantalla 6 — variante de palafito con figura colgada (marcada "A").
;   8. Pantalla 7 — exterior con palmeras/plantas y cabaña al fondo.
;   9. Pantalla 8 — pasillo de columnas con braseros y figuras pequeñas
;                   (escena de fuego/lava).
;  10. Pantalla 9 — la guarida del boss (¿VISCOSA?) con muchos enemigos.
;
; Las pantallas se construyen a partir del catálogo de tiles (módulo 21)
; mediante el sistema CPANT (módulo 5 = `dark1-mapper.asm`), que pinta
; los tiles de cada pantalla en el orden indicado por una tabla de mapa.
; =============================================================================

; --- Datos de mapa (referencia) ---------------------------------------------
; Las tablas de mapa de cada pantalla están normalmente embebidas en otros
; módulos (mapper / cpant) o en el bloque de datos del juego. No aparecen
; impresas en el listado de screens.
; =============================================================================

; (Sin código)


; =============================================================================
; FIN — screens
; -----------------------------------------------------------------------------
; Anexo puramente gráfico — sin código. Ver `scan/png/screens-1.png`.
; =============================================================================
