# 🛠 Skills del curso

Skills personalizadas para Claude Code que automatizan tareas del curso.

## 📦 Skills incluidas

### `notebooklm-curso`

Permite generar contenido del curso usando el **Studio de NotebookLM** directamente desde Claude Code:
- 9 tipos de Studio: audio, video, slides, infografía, report, mind map, flashcards, quiz, data table
- 27 prompts maestros listos para los distintos casos de uso
- Refresh automático de cookies vía Chrome DevTools MCP
- Plantilla de focus prompt eficaz

**Requiere:**
- MCP `notebooklm-mcp-cli` instalado (https://github.com/jacob-bd/notebooklm-mcp-cli)
- MCP `chrome-devtools` instalado (para refresh de cookies)
- Cuenta gratuita o Pro de NotebookLM

## 🚀 Instalación

### Opción 1 — Copiar a tu carpeta de skills personal

```powershell
# Windows
Copy-Item -Recurse skills\notebooklm-curso "$env:USERPROFILE\.claude\skills\"
```

```bash
# Linux/Mac
cp -r skills/notebooklm-curso ~/.claude/skills/
```

### Opción 2 — Adaptarla a tu propio notebook

1. Edita `notebooklm-curso/SKILL.md`
2. Cambia el `notebook_id` por el de tu propio notebook
3. Cambia las URLs de las fuentes
4. Cambia el branding (paleta, contacto)

### Activar

Reinicia Claude Code Desktop y la skill se carga automáticamente.

## 🎯 Cómo invocarla

Triggers automáticos:
- "Genera podcast del curso"
- "Crea infografía del curso para Instagram"
- "Hazme un quiz del curso"
- "Refresca las cookies de NotebookLM"
- "Consulta el notebook OJB"

## 📝 Estructura

```
notebooklm-curso/
├── SKILL.md                       ← Instrucciones + 27 prompts maestros
└── scripts/
    └── refrescar-cookies.ps1      ← Auxiliar para abrir Chrome con CDP
```
