---
name: notebooklm-curso
description: Use this skill when the user wants to work with the "OJB - Curso Programando con Claude IA" NotebookLM notebook to generate course content using NotebookLM Studio (audio, video, slides, infographic, report, flashcards, quiz, mind map, data table), refresh expired NotebookLM cookies, query the course knowledge base, or any derived material. Triggers on phrases like "notebook del curso", "OJB curso", "genera podcast/slides/infografía/mind map del curso", "actualiza cookies de NotebookLM", "refresh notebooklm", "Studio del curso", "consulta el notebook del curso", "crea presentación notebook", "crea cuestionario del curso", "crea flashcards del curso".
---

# NotebookLM Studio — Curso Programando con Claude IA (OJB)

## 🎯 Propósito

Esta skill da contexto a Claude para trabajar con el notebook **"OJB - Curso Programando con Claude IA"** y generar **contenido directamente en el Studio de NotebookLM**. Los artefactos quedan en el cuaderno del usuario (no en archivos locales) y son visibles en `notebooklm.google.com`.

---

## 📋 Datos del notebook

| Campo | Valor |
|-------|-------|
| **Nombre** | `OJB - Curso Programando con Claude IA` |
| **ID** | `c6f0bbb3-0194-4324-afa0-617d87d38da0` |
| **Cuenta** | `jomarbp.20@gmail.com` |
| **Idioma default** | `es` (español) |
| **Versión NotebookLM** | Gratuita |

### Fuentes ya cargadas

- `4a611e52-d4e3-4fac-aee0-d8e48545ffa5` → Sitio web del curso
- `c199132d-f4ba-48ff-bfcf-2f02e6c5d679` → Repo GitHub

---

## 🔌 MCPs que usa esta skill

| MCP | Propósito |
|-----|-----------|
| **`notebooklm-mcp`** | Operaciones principales: queries, sources, **studio_create**, etc. |
| **`chrome-devtools`** | Solo para refresh de cookies expiradas |

---

## 🎨 Los 9 tipos de Studio de NotebookLM

| Tipo (artifact_type) | UI en español | Comando CLI | Nota |
|----------------------|---------------|-------------|------|
| `audio` | Resumen en audio | `nlm audio create` | Podcast 5-30min |
| `video` | Resumen en video | `nlm video create` | Video con narración |
| `slide_deck` | Presentación | `nlm slides create` | Google Slides |
| `infographic` | Infografía | `nlm infographic create` | PNG/SVG |
| `report` | Informes | `nlm report create` | Google Docs |
| `mind_map` | Mapa mental | `nlm mindmap create` | Diagrama |
| `flashcards` | Tarjetas | `nlm flashcards create` | Estudio espaciado |
| `quiz` | Cuestionario | `nlm quiz create` | Preguntas múltiples |
| `data_table` | Tabla de datos | `nlm data-table create` | Estructurado |

> ⏱ **Tiempos**: mind_map y data_table son instantáneos. Slides, infographic, report tardan 1-3 minutos. Audio y video tardan 10-30 minutos.

---

## 🎯 PROMPTS MAESTROS para cada tipo de Studio

### 🎙 1. AUDIO PODCAST (Resumen en audio)

**Formatos**: `deep_dive` (default), `brief`, `critique`, `debate`
**Duraciones**: `short`, `default`, `long`

#### Prompt maestro: Podcast promocional
```
nlm audio create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --format deep_dive \
  --length default \
  --language es \
  --focus "Genera un podcast promocional de 10 minutos para el curso 'Programando con Claude IA' de OJB. Tono: cercano, motivador, profesional. Audiencia: profesionales y emprendedores en LatAm que quieren aprender IA. Cubre: por qué Claude IA, qué construyen los alumnos, beneficios del curso, cómo inscribirse. Incluye llamadas a la acción al WhatsApp 970 779 871." \
  --confirm
```

#### Prompt maestro: Podcast educativo (módulo 1)
```
--focus "Crea un podcast educativo introductorio. Explica como conversación entre dos hosts: qué es Claude, qué es Claude Code, qué son las Skills y qué es MCP. Usa analogías cotidianas (cocina, taller). Termina invitando a tomar el curso. Duración objetivo: 12 minutos."
```

#### Prompt maestro: Debate Claude vs ChatGPT
```
--focus "Genera un podcast formato 'debate' donde dos hosts discuten honestamente las ventajas y desventajas de Claude vs ChatGPT vs Gemini. Cita los datos comparativos del curso. Termina con una recomendación práctica para profesionales."
```
> Para debate usar `--format debate`.

---

### 🎬 2. VIDEO OVERVIEW (Resumen en video)

**Formatos**: `explainer`, `brief`, `cinematic`
**Estilos visuales**: `auto_select`, `classic`, `whiteboard`, `kawaii`, `anime`, `watercolor`, etc.

#### Prompt maestro: Video promocional cinemático
```
nlm video create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --format cinematic \
  --visual-style classic \
  --language es \
  --focus "Video promocional del curso 'Programando con Claude IA'. Mostrar el viaje del alumno: desde 'no sé programar' hasta 'tengo proyectos reales corriendo'. Resaltar los 2 proyectos (landing page y tienda con MySQL). Cerrar con CTA al WhatsApp 970 779 871. Tono: aspiracional, profesional." \
  --confirm
```

#### Prompt maestro: Video tipo whiteboard explicativo
```
--format explainer --visual-style whiteboard \
--focus "Explica visualmente la diferencia entre Prompts, Skills y MCP usando dibujos en pizarra. Audiencia: principiantes."
```

---

### 📊 3. SLIDE DECK (Presentación)

**Formatos**: `detailed_deck` (default, más texto), `presenter_slides` (estilo conferencia)
**Longitudes**: `short`, `default`

#### Prompt maestro: Slides de pitch comercial
```
nlm slides create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --format presenter_slides \
  --length default \
  --language es \
  --focus "Slides para presentación comercial del curso ante una audiencia mixta. Estructura: 1) Problema (no sé usar IA), 2) Solución (curso de 3h), 3) Qué construyen, 4) Itinerario, 5) Beneficios, 6) Sorteo Claude Pro, 7) CTA WhatsApp 970 779 871. Paleta naranja y azul OJB." \
  --confirm
```

#### Prompt maestro: Slides de clase magistral
```
--format detailed_deck --length default \
--focus "Slides educativas detalladas que cubran los 7 bloques del curso, una sección por bloque. Incluir prompts maestros como ejemplos de código. Audiencia: alumnos del curso. Estilo: pedagógico y limpio."
```

#### Prompt maestro: Slides de demo técnico
```
--format presenter_slides --length short \
--focus "Slides ejecutivas de 8-10 láminas para demo técnico del MCP en vivo: cómo Claude consulta MySQL real, modifica datos y verifica el resultado."
```

---

### 🎨 4. INFOGRAPHIC (Infografía)

**Orientaciones**: `landscape`, `portrait`, `square`
**Detalle**: `concise`, `standard`, `detailed`
**Estilos**: `auto_select`, `sketch_note`, `professional`, `bento_grid`, `editorial`, `instructional`, `bricks`

#### Prompt maestro: Infografía del curso para Instagram
```
nlm infographic create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --orientation portrait \
  --detail standard \
  --style bento_grid \
  --language es \
  --focus "Infografía vertical para promocionar el curso en Instagram/Stories. Incluir: nombre del curso, duración (3h), 7 bloques, 2 proyectos, ahorro de tokens, sorteo Claude Pro, WhatsApp 970 779 871. Paleta naranja y azul. Tono: aspiracional pero profesional." \
  --confirm
```

#### Prompt maestro: Infografía técnica del temario
```
--orientation landscape --detail detailed --style instructional \
--focus "Infografía horizontal con el temario completo del curso. Una sección por bloque (0 al 6) con duración, objetivo y output. Estilo instructivo, clara jerarquía visual."
```

#### Prompt maestro: Infografía Prompts vs Skills vs MCP
```
--orientation square --detail concise --style sketch_note \
--focus "Infografía cuadrada que explique en una sola imagen la diferencia entre Prompts, Skills y MCP. Usar metáfora de la voz, las habilidades y las manos. Estilo sketch note dibujado a mano."
```

---

### 📄 5. REPORT (Informe)

**Formato**: texto descriptivo del tipo de informe que se quiere

#### Prompt maestro: Informe ejecutivo del curso
```
nlm report create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --format "executive-brief" \
  --custom-prompt "Informe ejecutivo de 1 página para directores de empresa que evalúan tomar el curso para sus equipos. Estructura: resumen, ROI esperado, contenido, requisitos, próximos pasos. Tono: corporativo, conciso." \
  --language es \
  --confirm
```

#### Prompt maestro: Manual del alumno
```
--custom-prompt "Genera un manual del alumno de 5-7 páginas: introducción, qué necesitas instalar, descripción de cada bloque, ejercicios prácticos, recursos adicionales, créditos."
```

#### Prompt maestro: Plan de estudio post-curso
```
--custom-prompt "Genera un plan de estudio de 30 días para que el alumno consolide lo aprendido después del curso. Día 1 al 30 con tareas concretas: practicar prompts, instalar skills, configurar MCPs, construir un proyecto propio."
```

---

### 🧠 6. MIND MAP (Mapa mental)

Es **instantáneo** — no requiere wait. NotebookLM genera el JSON directamente.

#### Prompt maestro: Mapa mental general
```
nlm mindmap create c6f0bbb3-0194-4324-afa0-617d87d38da0 --confirm
```

> El mapa mental se genera basándose en TODAS las fuentes del notebook. Si quieres enfocarlo, primero deja en el notebook **solo las fuentes del tema deseado**.

#### Prompt para mapa mental específico vía query primero
Si necesitas un mapa mental ENFOCADO en un sub-tema específico, primero genera una nota con el contexto:

```
nlm note create <notebook_id> "Tema: Skills de Claude" "Contenido detallado del tema..."
```

Luego crea el mind map (usará la nota como contexto adicional).

---

### 🃏 7. FLASHCARDS (Tarjetas de estudio)

**Dificultades**: `easy`, `medium`, `hard`

#### Prompt maestro: Flashcards de conceptos clave
```
nlm flashcards create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --difficulty medium \
  --focus "Genera 20 flashcards de conceptos clave del curso. Anverso: pregunta corta. Reverso: respuesta de 1-2 oraciones. Cubrir: qué es Claude, prompts, skills, MCP, modelos, ahorro de tokens, herramientas." \
  --confirm
```

#### Prompt maestro: Flashcards de preguntas técnicas avanzadas
```
--difficulty hard \
--focus "Genera 30 flashcards técnicas para alumnos avanzados. Cubrir: configuración MCP, creación de skills propias, optimización de tokens, integración con MySQL/PHP, troubleshooting."
```

---

### ❓ 8. QUIZ (Cuestionario)

**Dificultades**: `easy`, `medium`, `hard`
**Cantidad de preguntas**: parámetro `--question-count`

#### Prompt maestro: Quiz post-curso (evaluación)
```
nlm quiz create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --difficulty medium \
  --question-count 15 \
  --focus "Quiz de evaluación post-curso. 15 preguntas de opción múltiple cubriendo todos los bloques. Mezcla teoría y práctica. Incluir explicaciones en las respuestas correctas." \
  --confirm
```

#### Prompt maestro: Quiz pre-curso (diagnóstico)
```
--difficulty easy --question-count 10 \
--focus "Quiz diagnóstico para evaluar conocimiento previo del alumno antes del curso. 10 preguntas básicas sobre IA, programación y herramientas modernas."
```

---

### 📋 9. DATA TABLE (Tabla de datos)

Genera tablas estructuradas a partir de las fuentes. Se exporta a Google Sheets.

#### Prompt maestro: Tabla comparativa de modelos
```
nlm data-table create c6f0bbb3-0194-4324-afa0-617d87d38da0 \
  --focus "Tabla comparativa de los modelos Claude (Opus, Sonnet, Haiku) con columnas: nombre, velocidad, inteligencia, costo aprox, uso ideal, no recomendado para. Una fila por modelo." \
  --confirm
```

#### Prompt maestro: Tabla de prompts maestros
```
--focus "Tabla con los 11 prompts maestros del curso. Columnas: ID (PM-XX), bloque, propósito, longitud aprox, output esperado."
```

#### Prompt maestro: Tabla de skills
```
--focus "Tabla de las skills mencionadas en el curso. Columnas: nombre, propósito, ubicación de instalación, cuándo se activa automáticamente."
```

---

## 🎬 Flujos típicos

### Flujo "Quiero promocionar el curso en redes"

```
1. Audio podcast formato deep_dive (10 min) → para subir a Spotify
2. Video cinematic 1 min → para Instagram/TikTok
3. Infografía portrait bento_grid → para Stories
4. Infografía landscape professional → para post de LinkedIn
```

### Flujo "Quiero material para enseñar el curso"

```
1. Slide deck detailed_deck → presentación completa de 30+ láminas
2. Mind map → para mostrar la arquitectura mental
3. Flashcards medium → para que practiquen
4. Quiz medium 15 preguntas → para evaluar al final
```

### Flujo "Quiero documentación corporativa"

```
1. Report executive-brief → para directores
2. Report manual del alumno → para los participantes
3. Data table modelos + skills + prompts → referencia rápida
```

---

## 🔄 Refresh de cookies (cuando expiren)

Si una llamada falla con "Authentication expired":

### Paso 1 — Pedirle al usuario que abra Chrome con CDP

```powershell
& "C:\Program Files\Google\Chrome\Application\chrome.exe" --remote-debugging-port=9222 --user-data-dir="$env:USERPROFILE\chrome-nlm-profile"
```

Luego: ir a `https://notebooklm.google.com/` y loguearse.

### Paso 2 — Extraer cookies vía Chrome DevTools MCP

```
1. mcp__chrome-devtools__list_pages
2. mcp__chrome-devtools__select_page (la de notebooklm)
3. mcp__chrome-devtools__navigate_page (type=reload)
4. mcp__chrome-devtools__list_network_requests (resourceTypes=[xhr,fetch])
5. Encontrar el primer request con "batchexecute" en URL
6. mcp__chrome-devtools__get_network_request (reqid)
```

### Paso 3 — Guardar cookies

Extraer del response:
- Header `cookie:` completo
- `Request Body`
- `request URL`

Guardar en archivo y ejecutar:
```bash
nlm login --manual --file C:/temp/nlm-cookies.txt
```

O usar el MCP directamente:
```
mcp__notebooklm-mcp__save_auth_tokens(
  cookies="<cookie_header>",
  request_body="<body>",
  request_url="<url>"
)
```

### Paso 4 — Borrar archivo temporal

```bash
rm C:/temp/nlm-cookies.txt
```

---

## 📦 Comandos rápidos del CLI

```powershell
# Ver path
$env:PATH += ";$env:USERPROFILE\AppData\Roaming\Python\Python314\Scripts"

# Notebook del curso
$NB = "c6f0bbb3-0194-4324-afa0-617d87d38da0"

# Listar artefactos del Studio actual
nlm studio status $NB

# Crear cada tipo
nlm audio create $NB --confirm --language es --focus "..."
nlm video create $NB --confirm --language es --focus "..."
nlm slides create $NB --confirm --language es --focus "..."
nlm infographic create $NB --confirm --language es --focus "..."
nlm report create $NB --confirm --language es --custom-prompt "..."
nlm mindmap create $NB --confirm
nlm flashcards create $NB --confirm --focus "..."
nlm quiz create $NB --confirm --question-count 15 --focus "..."
nlm data-table create $NB --confirm --focus "..."

# Descargar
nlm download audio $NB <artifact-id>
nlm export <artifact-id> sheet  # data_table → Google Sheets
nlm export <artifact-id> doc    # report → Google Docs
```

---

## 📝 Reglas importantes

- ✅ **Confirmar antes de crear** — todos los Studio tienen `--confirm` o `confirm=True`
- ✅ **Cuotas gratuitas**: ~50 queries/día. Studio cuenta como query.
- ✅ **Todo queda en el notebook** del usuario, visible en `notebooklm.google.com`
- ✅ **Idioma siempre en español**: `--language es`
- ✅ **Mencionar tiempos**: audio/video 10-30min, slides/infographic/report 1-3min, mind_map/data_table instantáneos
- ❌ **NO crear sin focus específico** — el output será genérico
- ❌ **NO crear el mismo tipo varias veces** sin avisar al usuario (consume cuota)

---

## 💡 Plantilla de focus prompt eficaz

```
[OBJETIVO]: <qué se va a hacer con este artefacto>
[AUDIENCIA]: <quién lo va a consumir>
[TONO]: <profesional, cercano, divertido, técnico, etc.>
[ESTRUCTURA]: <secciones o capítulos esperados>
[CTA]: <a qué acción se invita al final>
[BRANDING]: <colores OJB, WhatsApp 970 779 871>
```

Ejemplo aplicado:
```
"Objetivo: convertir a alumnos del curso. Audiencia: profesionales 25-45 años en
LatAm. Tono: cercano y motivador. Estructura: problema, solución, prueba social,
CTA. CTA: 'Inscríbete por WhatsApp 970 779 871'. Branding: OJB Soluciones, paleta
naranja y azul oscuro."
```

---

## 🔗 Recursos

- **MCP**: https://github.com/jacob-bd/notebooklm-mcp-cli
- **Notebook web**: https://notebooklm.google.com/notebook/c6f0bbb3-0194-4324-afa0-617d87d38da0
- **Curso GitHub**: https://github.com/jomarbp/programando-con-claude-ia
- **Sitio web**: https://jomarbp.github.io/programando-con-claude-ia/
