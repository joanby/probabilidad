# Cambios de la rama `update-2026`

> Esta rama es el mismo curso —Probabilidad para Machine Learning y Big Data—, con el código adaptado a R y
> los paquetes de hoy (R 4.5.3, rmarkdown 2.32, knitr 1.52, reticulate 1.47; para los bloques de Python,
> matplotlib 3.11 y pandas 3; octubre de 2026). La rama principal sigue exactamente como en el vídeo.

> **Cómo se ha comprobado.** Se han renderizado los 57 documentos del curso (`.Rmd` de teoría, ejercicios y
> talleres) dos veces: con R y paquetes de finales de 2019 y con los de hoy. Lo que solo fallaba hoy se ha
> arreglado: **56 de 57 se generan sin errores** y no queda nada que funcionara entonces y falle hoy.
> **No comprobado:** `Tema_5_Varias_Variables.Rmd` usa el paquete `bivariate`, que no estaba disponible en el
> entorno de prueba (se instala desde CRAN con `install.packages("bivariate")`).

## Qué ha cambiado y por qué

- **matplotlib 3.8** quitó `Tick.label` (tema 3, distribuciones notables, en los bloques de Python):
  `tick.label.set_fontsize(5)` → `tick.label1.set_fontsize(5)`, que es la misma etiqueta del eje.
- **Caché de knitr subida al repositorio** (`ejercicios/Resueltos/Tema-0---Combinatoria_SOLUCIONES_cache`):
  se ha borrado. Guardaba resultados de los paquetes de entonces; RStudio la vuelve a crear al generar el
  documento.

## Para generar los documentos

- Las presentaciones de los temas 3.1 y 3.2 (`Tema_3_1_Notables.Rmd`, `Tema_3_2_Notables.Rmd`) son
  interactivas (`runtime: shiny`): en RStudio se abren con **Run Document**, no con *Knit*. Las versiones
  `_html` son las estáticas.
- Los bloques de Python necesitan un Python con `numpy`, `scipy`, `matplotlib` y `pandas`; `reticulate` usa
  el que encuentre (o el que le digas con `reticulate::use_python("ruta")`).
