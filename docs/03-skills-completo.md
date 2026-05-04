# 🛠 Guía completa de Skills de Claude

> Todo lo que necesitas saber para instalar, usar y crear Skills.

---

## ¿Qué es una Skill?

Una **Skill** es una **carpeta** que contiene instrucciones especializadas y, opcionalmente, scripts auxiliares. Cuando Claude detecta que tu pedido encaja con la skill, **la carga automáticamente**.

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

### Contenido de SKILL.md

```markdown
---
name: pdf-tools
description: Use this skill whenever the user wants to read, create, split or merge PDF files.
---

# PDF Tools

## Overview
Esta skill te permite manipular archivos PDF...

## Cómo usarla
1. Si el usuario sube un PDF: usar pandoc para extraer texto.
2. Si pide crear un PDF: usar reportlab.
```

> 💡 El `description` del frontmatter es **clave**: Claude lo usa para decidir si activa la skill.

---

## 📂 Dónde se instalan las Skills

| Nivel | Ruta (Windows) | Alcance |
|-------|----------------|---------|
| **Personal** | `C:\Users\<TU_USUARIO>\.claude\skills\` | Todas tus sesiones |
| **Proyecto** | `<proyecto>\.claude\skills\` | Solo ese proyecto |
| **Plugin** | Marketplace | Compartidas con equipo |

| Nivel | Ruta (Linux/Mac) |
|-------|-------------------|
| **Personal** | `~/.claude/skills/` |
| **Proyecto** | `<proyecto>/.claude/skills/` |

---

## ⚠️ Si no tienes la carpeta `.claude/skills/`

**Es completamente normal.** Las skills **NO vienen preinstaladas**.

### Verificar si existe

```powershell
# Windows
Test-Path "$env:USERPROFILE\.claude\skills"
```

```bash
# Linux/Mac
[ -d ~/.claude/skills ] && echo "Existe" || echo "No existe"
```

---

## 🚀 Instalación paso a paso desde GitHub

### Opción 1 — Script automático (RECOMENDADO)

Desde la raíz del repo del curso:

```powershell
# Windows
.\scripts\instalar-skills.ps1
```

```bash
# Linux/Mac
bash scripts/instalar-skills.sh
```

### Opción 2 — Manual con `git clone`

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

1. Entrar a https://github.com/anthropics/skills
2. Navegar a la carpeta de la skill (ej. `pdf/`)
3. Pegar la URL en https://download-directory.github.io/
4. Descomprimir el ZIP en `~/.claude/skills/pdf/`

### Opción 4 — Sparse checkout (avanzado)

Solo descarga las skills que quieras:

```bash
cd ~/.claude/skills
git clone --filter=blob:none --sparse https://github.com/anthropics/skills.git
cd skills
git sparse-checkout set pdf docx xlsx
```

### Opción 5 — Curl + tar (Linux/Mac)

```bash
curl -L https://github.com/anthropics/skills/archive/refs/heads/main.tar.gz | tar xz -C ~/.claude/skills
```

---

## ✅ Instalar dependencias

Lee el `SKILL.md` de cada skill. Algunas requieren herramientas externas:

```bash
# Skills de documentos
pip install python-docx openpyxl pypdf
npm install -g docx

# PDFs avanzados
choco install pandoc          # Windows
brew install pandoc           # macOS
sudo apt install pandoc       # Linux

# Conversión a imágenes
choco install poppler         # Windows
brew install poppler          # macOS
```

---

## 🔄 Reiniciar Claude Code

Cierra **completamente** Claude Code Desktop y vuelve a abrirlo. Esto fuerza un nuevo escaneo de skills.

```powershell
# Windows: matar proceso si quedó colgado
Get-Process -Name "Claude*" | Stop-Process -Force
```

---

## ✅ Verificar que están activas

En Claude Code escribe:

```
Lista todas las skills que tienes instaladas en ~/.claude/skills/
y describe brevemente qué hace cada una.
```

Si no aparecen, revisa:

| Posible causa | Solución |
|---------------|----------|
| Ruta incorrecta | Verifica con `ls ~/.claude/skills/` |
| `SKILL.md` mal formado | Revisa el frontmatter YAML |
| No reiniciaste | Cierra y abre Claude Code |
| Carpeta anidada extra | Mueve archivos al nivel correcto |

---

## 🧰 3 formas de invocar una Skill

### 1. Automática (la habitual)

```
Lee este productos.pdf y dame los 5 más caros.
```

Claude detecta `.pdf` → activa la skill `pdf`.

### 2. Mención explícita

```
Usa la skill pdf para leer este archivo y darme su tabla de contenidos.
```

### 3. Slash command

Algunas skills se exponen como comandos:

```
/init               ← genera CLAUDE.md
/review             ← revisa el código
/security-review    ← audita seguridad
```

---

## 📦 Skills imprescindibles

| Skill | Repositorio | Para qué |
|-------|-------------|----------|
| `pdf` | anthropics/skills | Leer, crear, dividir PDFs |
| `docx` | anthropics/skills | Generar Word |
| `xlsx` | anthropics/skills | Crear/leer Excel |
| `pptx` | anthropics/skills | Crear PowerPoint |
| `init` | anthropics/skills | Documentar proyectos |
| `review` | anthropics/skills | Revisar código |
| `skill-creator` | anthropics/skills | Crear nuevas skills |

---

## 🎨 Crear tu propia Skill

### Estructura mínima

```bash
mkdir -p ~/.claude/skills/mi-skill
cd ~/.claude/skills/mi-skill
```

Crea `SKILL.md`:

```markdown
---
name: tienda-helper
description: Use this skill cuando el usuario quiera generar productos de prueba, validar precios o crear consultas para la tienda online del curso.
---

# Tienda Helper

## Overview
Skill auxiliar para acelerar tareas comunes de la tienda online.

## Cómo usar
- Para generar productos: ejecutar `python scripts/seed.py`
- Para validar precios: aplicar regex `^\d+\.\d{2}$`
- Formato de moneda siempre: `S/ 0.00`

## Reglas
- Las imágenes deben pesar < 200 KB
- Los nombres de productos en español
```

### Con scripts auxiliares

```bash
mkdir scripts
cat > scripts/seed.py <<'EOF'
import random
productos = [f"Producto {i}" for i in range(1, 11)]
for p in productos:
    print(f"INSERT INTO productos (nombre, precio) VALUES ('{p}', {random.uniform(10, 500):.2f});")
EOF
```

Reinicia Claude Code y ya está disponible.

---

## ❌ Errores comunes

| Error | Causa | Solución |
|-------|-------|----------|
| Claude no detecta la skill | Ruta incorrecta | `ls ~/.claude/skills/` |
| `SKILL.md` no se interpreta | Frontmatter mal formado | Revisa los `---` y `description` |
| Skill duplicada | Está en personal y proyecto | Elimina una |
| Scripts no corren | Falta dependencia | Lee `SKILL.md` |
| Carpeta anidada | ZIP mal extraído | Mueve archivos al nivel correcto |

---

## 🔗 Recursos

- [Skills oficiales de Anthropic](https://github.com/anthropics/skills)
- [Documentación oficial](https://docs.claude.com/skills)
- [Ejemplos de la comunidad](https://github.com/topics/claude-skill)
