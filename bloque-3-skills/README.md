# Bloque 3 — Skills de Claude paso a paso

> ⏱ **Duración**: 15 minutos
> 🎯 **Objetivo**: Conocer qué son las skills, dónde se instalan y cómo se usan.

---

## 🤔 ¿Qué es una Skill?

Una **Skill** es una **carpeta** con instrucciones especializadas y, opcionalmente, scripts auxiliares. Cuando Claude detecta que tu pedido encaja con la skill, **la carga automáticamente**.

```
Prompt = una orden suelta
Skill  = un manual + herramientas que Claude consulta cuando las necesita
MCP    = una conexión con servicios externos
```

---

## 📁 Anatomía de una Skill

```
nombre-de-la-skill/
├── SKILL.md           ← obligatorio: instrucciones + metadatos
├── scripts/           ← opcional: scripts Python, JS, bash
│   └── helper.py
├── references/        ← opcional: documentación técnica
│   └── guia.md
└── assets/            ← opcional: plantillas, imágenes
    └── plantilla.docx
```

### Contenido típico de SKILL.md

```markdown
---
name: pdf-tools
description: Use this skill whenever the user wants to read, create, split or merge PDF files.
---

# PDF Tools

## Overview
Esta skill manipula archivos PDF...

## Cómo usarla
1. Si el usuario sube un PDF: usar pandoc para extraer texto.
2. Si pide crear un PDF: usar reportlab.
```

> 💡 El campo `description` en el frontmatter es **clave**: Claude lo lee para decidir si activa la skill.

---

## 📂 ¿Dónde se instalan las Skills?

| Nivel | Ruta (Windows) | Ruta (Linux/Mac) | Alcance |
|-------|----------------|-------------------|---------|
| **Personal** | `C:\Users\<TU_USUARIO>\.claude\skills\` | `~/.claude/skills/` | Todas tus sesiones |
| **Proyecto** | `<proyecto>\.claude\skills\` | `<proyecto>/.claude/skills/` | Solo ese proyecto |
| **Plugin** | Instaladas desde marketplace | — | Compartidas con equipo |

---

## ⚠️ Si no tienes la carpeta `.claude/skills/`

**Es completamente normal.** Las skills **NO vienen preinstaladas**. Tienes que descargarlas tú mismo desde GitHub.

### Verifica si existe:

```powershell
# Windows
ls "$env:USERPROFILE\.claude\skills\"
```

```bash
# Linux/Mac
ls ~/.claude/skills/
```

Si dice **"no se encuentra"** o **"No such file or directory"**, sigue los pasos de abajo.

---

## 🚀 Instalación paso a paso desde GitHub

### Opción 1 — Script automático (RECOMENDADO)

Desde la raíz del repo:

```powershell
# Windows
.\scripts\instalar-skills.ps1
```

```bash
# Linux/Mac
bash scripts/instalar-skills.sh
```

### Opción 2 — Manual con git clone

```powershell
# Windows PowerShell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills"
cd "$env:USERPROFILE\.claude\skills"
git clone https://github.com/anthropics/skills.git anthropic-skills
```

```bash
# Linux/Mac
mkdir -p ~/.claude/skills
cd ~/.claude/skills
git clone https://github.com/anthropics/skills.git anthropic-skills
```

### Opción 3 — Descargar solo una skill (sin git)

1. Entra a https://github.com/anthropics/skills
2. Navega a la carpeta de la skill (ej. `pdf/`)
3. Pega la URL en https://download-directory.github.io/
4. Descomprime el ZIP en `~/.claude/skills/pdf/`

### Opción 4 — Sparse checkout (avanzado)

```bash
cd ~/.claude/skills
git clone --filter=blob:none --sparse https://github.com/anthropics/skills.git
cd skills
git sparse-checkout set pdf docx xlsx
```

Solo descarga `pdf`, `docx` y `xlsx`. Útil si tienes poco espacio o internet lento.

---

## ✅ Verificación tras la instalación

### 1. Estructura correcta

```powershell
# Windows
ls "$env:USERPROFILE\.claude\skills\anthropic-skills\"
```

Deberías ver:
```
pdf/
docx/
xlsx/
pptx/
init/
review/
skill-creator/
...
```

### 2. Reiniciar Claude Code

Cierra Claude Code Desktop **completamente** y vuelve a abrirlo. Esto fuerza un escaneo de skills.

### 3. Confirmar en Claude

```
Lista todas las skills que tienes instaladas en ~/.claude/skills/
y describe brevemente qué hace cada una.
```

---

## 📦 Skills imprescindibles para el curso

| Skill | Repositorio | Uso en el curso |
|-------|-------------|-----------------|
| `pdf` | anthropics/skills | Importar productos desde catálogos PDF |
| `xlsx` | anthropics/skills | Cargar inventario desde Excel |
| `docx` | anthropics/skills | Generar manuales del proyecto |
| `pptx` | anthropics/skills | Crear pitch deck del curso |
| `skill-creator` | anthropics/skills | Crear nuestras propias skills |

---

## 🎬 Demostración en vivo (3 min)

**Caso**: extraer productos desde un Excel y meterlos en la tienda.

1. Tener archivo `productos.xlsx` con: nombre, precio, descripción, imagen.
2. Subir el archivo a Claude (arrastrar al chat).
3. Prompt:
   ```
   Lee productos.xlsx y genera el SQL INSERT correspondiente para la tabla
   "productos" de mi BD MySQL "tienda_ia".
   ```
4. Claude detecta automáticamente la skill `xlsx` y la activa.
5. Recibes SQL listo para ejecutar.

---

## 🛠 Crear tu propia Skill

```bash
mkdir -p ~/.claude/skills/mi-skill
cd ~/.claude/skills/mi-skill
```

Crea `SKILL.md`:

```markdown
---
name: tienda-helper
description: Use this skill cuando el usuario quiera generar productos de prueba para la tienda online del curso.
---

# Tienda Helper

## Overview
Skill auxiliar para tareas de la tienda online.

## Cómo usar
- Generar productos: `python scripts/seed.py`
- Validar precios: regex `^\d+\.\d{2}$`
- Formato de moneda: `S/ 0.00`
```

Reinicia Claude Code y ya está disponible.

---

## ❌ Errores comunes

| Error | Causa | Solución |
|-------|-------|----------|
| Claude no detecta la skill | Ruta incorrecta | Verifica que esté en `~/.claude/skills/` |
| `SKILL.md` no se interpreta | Frontmatter mal formado | Revisa los `---` y el campo `description` |
| Skill duplicada | Está en personal y proyecto | Elimina una de las dos |
| Scripts no corren | Falta dependencia | Lee `SKILL.md` e instala lo que pide |
| Carpeta anidada extra | ZIP mal descomprimido | Mueve archivos al nivel correcto |

---

## ➡️ Siguiente

Ve a [Bloque 4 — Tienda con MySQL](../bloque-4-tienda-mysql/README.md)
