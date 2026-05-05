# 📘 Introducción a los fundamentos: Claude Code, Skills y MCP

> **Objetivo de este módulo**: Antes de tocar código, entiende **qué es** cada herramienta, **cómo se relacionan entre sí** y **qué versión te conviene**.
>
> ⏱ **Lectura**: 15 minutos
> 🎯 **Audiencia**: desde principiantes hasta profesionales

---

## 🎬 Mapa mental rápido

```
                ┌──────────────────────┐
                │     Claude (LLM)     │  ← El cerebro: el modelo de IA
                └──────────┬───────────┘
                           │
            ┌──────────────┼──────────────┐
            ▼              ▼              ▼
       ┌────────┐    ┌──────────┐   ┌──────────┐
       │claude.ai│    │Claude Code│  │Claude API│
       │ (web)  │    │ (dev)    │   │ (devs)   │
       └────────┘    └────┬─────┘   └──────────┘
                          │
              ┌───────────┼───────────┐
              ▼           ▼           ▼
          ┌────────┐  ┌──────┐   ┌────────┐
          │Prompts │  │Skills│   │  MCP   │
          │ (tu   │  │(habi-│   │(conex.)│
          │ voz)  │  │lidades)  │externas│
          └────────┘  └──────┘   └────────┘
```

**Claude** es el modelo. **Claude Code, Claude.ai y la API** son tres formas de usarlo. **Prompts, Skills y MCP** son tres formas de potenciarlo.

---

## 1. 🤖 ¿Qué es Claude?

**Claude** es un asistente de IA creado por **Anthropic**. Es un **LLM** (modelo de lenguaje grande), como ChatGPT o Gemini, pero con un enfoque distinto: prioriza **respuestas honestas, útiles y seguras**, y está entrenado para razonar paso a paso.

### La familia Claude (modelos)

| Modelo | Velocidad | Inteligencia | Para qué |
|--------|-----------|--------------|----------|
| 🧠 **Claude Opus 4.7** | 🐢 Lenta | 🧠🧠🧠 Máxima | Arquitectura, refactor profundo, análisis complejo |
| ⚖️ **Claude Sonnet 4.6** | 🚶 Media | 🧠🧠 Alta | Día a día, programación, contenido (DEFAULT) |
| ⚡ **Claude Haiku 4.5** | 🐇 Muy rápida | 🧠 Buena | Tareas simples, alto volumen |

> 💡 **En este curso usamos Sonnet 4.6** porque es el que recibes en la versión gratuita y cubre el 95% de las necesidades.

---

## 2. 💻 ¿Qué es Claude Code?

**Claude Code** es la **herramienta para desarrolladores** de Anthropic. Es Claude conectado a tu computadora, capaz de leer archivos, escribir código, ejecutar comandos y automatizar tareas reales.

### Las 3 formas de usar Claude

| Producto | Para quién | Dónde se usa |
|----------|-----------|--------------|
| 🌐 **claude.ai** | Cualquier persona | Navegador web |
| 💻 **Claude Code** | Desarrolladores | Terminal + Editor |
| 🔌 **Claude API** | Programadores avanzados | Código propio |

### Claude Code vs claude.ai (lo importante)

| Característica | claude.ai | Claude Code |
|----------------|-----------|-------------|
| Dónde corre | Navegador | Tu computadora |
| Lee tus archivos | ❌ Solo si los subes | ✅ Acceso directo |
| Ejecuta comandos | ❌ | ✅ |
| Crea/modifica archivos | ❌ | ✅ |
| Skills | Limitadas | ✅ Completas |
| MCP | Limitado | ✅ Completo |
| Ideal para | Conversar, redactar | Programar, automatizar |

> 🎯 **En este curso usaremos Claude Code Desktop** porque es la versión más potente y necesaria para crear los proyectos reales.

### Instalación de Claude Code

**Windows:**
```powershell
winget install Anthropic.ClaudeCode
```

**macOS:**
```bash
brew install --cask claude-code
```

**Linux:**
```bash
curl -fsSL https://claude.com/install.sh | sh
```

---

## 3. 💬 ¿Qué es un Prompt?

Un **prompt** es la **instrucción que le das a Claude**. Cualquier mensaje que escribes en el chat es un prompt.

### Anatomía del prompt perfecto

| Componente | Ejemplo |
|------------|---------|
| **Rol** | "Actúa como diseñador UX senior" |
| **Contexto** | "Trabajo en una tienda online de ropa" |
| **Tarea** | "Diseña el flujo de checkout" |
| **Formato** | "Devuélveme un diagrama en Markdown" |
| **Restricciones** | "Máximo 5 pasos, sin login obligatorio" |

> 📚 Profundización: ver el [Bloque 1 del curso](../bloque-1-prompting/README.md) y la [guía de tokens](../docs/01-tokens-y-ahorro.md).

---

## 4. 🛠 ¿Qué son las Skills?

Una **Skill** es una **carpeta con instrucciones especializadas + scripts** que Claude **carga automáticamente** cuando detecta que tu pedido coincide con su descripción.

### Analogía cotidiana

> Imagina que Claude es un asistente personal **muy inteligente pero genérico**.
> Las skills son como **manuales especializados** que tiene en su escritorio: el manual de cocina, el manual de reparación de autos, el manual de inversión.
> Cuando le pides algo, él agarra el manual correcto y lo aplica.
>
> **Tú no tienes que decirle qué manual usar.** Él lo decide solo.

### Estructura de una skill

```
nombre-skill/
├── SKILL.md           ← Instrucciones (frontmatter + descripción)
├── scripts/           ← Código auxiliar (Python, bash...)
│   └── helper.py
├── references/        ← Documentación técnica
└── assets/            ← Plantillas, imágenes
```

### Dónde van las skills (ubicaciones)

| Nivel | Ruta (Windows) | Alcance |
|-------|----------------|---------|
| **Personal** | `C:\Users\TU_USUARIO\.claude\skills\` | Todas tus sesiones |
| **Proyecto** | `<proyecto>\.claude\skills\` | Solo ese proyecto |
| **Plugin** | Marketplace | Compartidas con equipo |

### ¿Vienen preinstaladas?

**❌ NO.** Por defecto la carpeta `.claude/skills/` ni siquiera existe. Tú las descargas desde GitHub:

```powershell
# Crear carpeta
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills"

# Clonar las oficiales de Anthropic
cd "$env:USERPROFILE\.claude\skills"
git clone https://github.com/anthropics/skills.git anthropic-skills
```

### Skills imprescindibles

| Skill | Para qué |
|-------|----------|
| `pdf` | Leer, crear, dividir PDFs |
| `docx` | Generar documentos Word |
| `xlsx` | Crear/leer Excel |
| `pptx` | Crear PowerPoints |
| `init` | Documentar proyectos automáticamente |
| `review` | Revisar y mejorar código |
| `skill-creator` | Crear tus propias skills |

> 📚 Profundización: ver [guía completa de Skills](../docs/03-skills-completo.md).

---

## 5. 🔌 ¿Qué es MCP?

**MCP = Model Context Protocol** (Protocolo de Contexto del Modelo).

Es un **estándar abierto** que permite a Claude **conectarse con herramientas externas reales**: bases de datos, archivos, APIs, navegadores, GitHub, Slack, etc.

### Analogía cotidiana

> - **Prompt** = la voz de Claude (qué le pides)
> - **Skill** = lo que Claude sabe hacer (sus habilidades)
> - **MCP** = las manos y los pies de Claude (cómo actúa en el mundo real)
>
> Sin MCP, Claude solo puede *describir* cómo se haría algo.
> Con MCP, Claude *lo hace*: ejecuta SQL, crea archivos, abre páginas, envía mensajes.

### Diferencia: Prompts vs Skills vs MCP

| Concepto | Qué es | Ejemplo |
|----------|--------|---------|
| **Prompt** | Instrucción en lenguaje natural | "Genérame un HTML responsive" |
| **Skill** | Capacidad especializada local | Leer un PDF, generar Excel |
| **MCP** | Conexión con herramienta externa | Consultar tu MySQL real, crear PR en GitHub |

### MCPs populares

| MCP | Qué hace |
|-----|----------|
| `filesystem` | Lee/escribe archivos en tu PC |
| `mysql` | Ejecuta SQL en tu BD real |
| `github` | Crea issues, PRs, commits |
| `chrome-devtools` | Controla el navegador |
| `slack` | Envía y lee mensajes |
| `notebooklm` | Genera podcasts, slides, infografías |

### Configurar un MCP

Edita el archivo:

**Windows:** `%APPDATA%\Claude\claude_desktop_config.json`

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "C:\\Users\\TU\\Desktop"]
    },
    "mysql": {
      "command": "npx",
      "args": ["-y", "@benborla29/mcp-server-mysql"],
      "env": {
        "MYSQL_HOST": "127.0.0.1",
        "MYSQL_USER": "root",
        "MYSQL_PASS": "",
        "MYSQL_DB": "tienda_ia"
      }
    }
  }
}
```

Después: **reiniciar Claude Code Desktop** completamente.

> 📚 Profundización: ver [MCP paso a paso](../docs/04-mcp-paso-a-paso.md).

---

## 6. 💰 Versión gratuita vs versión paga

### Comparativa completa

| Característica | 🆓 **Free** | 💎 **Pro** ($17/mes) | 🏢 **Team** ($25/mes) | 🏛 **Enterprise** |
|----------------|-------------|---------------------|----------------------|--------------------|
| **Modelo principal** | Sonnet 4.6 | Sonnet + Opus | Sonnet + Opus | Sonnet + Opus |
| **Mensajes** | ~50/cada 5h | 5x más | Más alto | Personalizado |
| **Carga de archivos** | Limitada | ✅ | ✅ | ✅ |
| **Claude Code** | ✅ Básico | ✅ Completo | ✅ Completo | ✅ + admin |
| **Skills** | ✅ | ✅ | ✅ | ✅ |
| **MCP** | ✅ Limitado | ✅ Completo | ✅ Completo | ✅ + custom |
| **Modo voz** | ❌ | ✅ | ✅ | ✅ |
| **Proyectos** | ❌ | ✅ | ✅ | ✅ |
| **Colaboración equipo** | ❌ | ❌ | ✅ | ✅ |
| **Admin/SSO** | ❌ | ❌ | Básico | ✅ |
| **Soporte prioritario** | ❌ | Email | ✅ | ✅ |

### ¿Cuándo conviene cada una?

#### 🆓 Free (con la que daremos este curso)
- Estás empezando con IA
- Uso ocasional (menos de 2 horas/día)
- Proyectos personales pequeños
- **Suficiente para todo el curso**

#### 💎 Pro ($17/mes)
- Trabajas con Claude más de 2 horas/día
- Te bloquean los límites con frecuencia
- Necesitas Opus para tareas complejas
- Quieres usar MCPs intensivamente
- Trabajas con archivos grandes

#### 🏢 Team ($25/mes/usuario)
- Eres parte de un equipo de 5+ personas
- Necesitas compartir prompts y proyectos
- Quieres administración centralizada

#### 🏛 Enterprise (cotización)
- Empresa grande con compliance
- Necesitas SSO, audit logs
- Volúmenes muy altos

---

## 7. ✅ Ventajas de Claude

### Frente a la competencia (ChatGPT, Gemini)

| Ventaja | Detalle |
|---------|---------|
| 🎯 **Mejor en código** | Modelos como Opus lideran benchmarks de programación |
| 📝 **Contexto enorme** | 200K tokens (≈ 500 páginas de texto) |
| 🛡 **Más seguro** | Menos alucinaciones, rechaza pedidos peligrosos con elegancia |
| 🤖 **Razonamiento explícito** | Piensa paso a paso, transparente |
| 🔌 **MCP estandarizado** | Open standard para integraciones |
| 🧰 **Skills** | Sistema único: capacidades modulares |
| 🌍 **Multi-idioma** | Excelente español |
| 📚 **Citas reales** | Cuando tiene fuentes (NotebookLM), las cita |

### Específicas de la versión gratuita

✅ Acceso al mejor modelo medio del mercado (Sonnet 4.6)
✅ Skills funcionan al 100%
✅ MCP funciona (con límites)
✅ Sin tarjeta de crédito
✅ Sin tiempo de prueba que expira

---

## 8. ⚠️ Desventajas / limitaciones

### De Claude en general

| Limitación | Impacto | Mitigación |
|------------|---------|-------------|
| No tiene acceso a internet en tiempo real | No te dice precio del dólar HOY | Usa MCP de búsqueda o navegador |
| No genera imágenes | No reemplaza a Midjourney | Usa Claude para describir, otra IA para generar |
| No genera audio/video nativamente | Necesita herramientas externas | NotebookLM para podcasts, otras para video |
| Memoria por sesión | No recuerda chats viejos | Usa Projects (Pro) o repos |
| Puede equivocarse | Como toda IA | Verifica siempre código crítico |

### De la versión gratuita específicamente

| Limitación | Detalle |
|------------|---------|
| **Cuota** | ~50 mensajes cada 5 horas |
| **Modelo limitado** | Solo Sonnet 4.6 (no Opus) |
| **Sin proyectos** | No puedes guardar contextos persistentes |
| **MCP con límites** | Cuotas reducidas |
| **Sin voz** | No hay modo conversacional por audio |
| **Degradación** | En alta demanda Claude puede bajarte a Haiku |

---

## 9. 🆚 Claude vs ChatGPT vs Gemini

| Aspecto | 🟧 **Claude** | 🟢 **ChatGPT** | 🔵 **Gemini** |
|---------|--------------|---------------|---------------|
| Mejor en código | 🥇 | 🥈 | 🥉 |
| Mejor en escritura | 🥇 | 🥈 | 🥉 |
| Velocidad | 🥈 | 🥇 | 🥇 |
| Contexto | 200K | 128K | 2M |
| Skills | ✅ | ❌ | ❌ |
| MCP nativo | ✅ | ❌ | ❌ |
| Generación imagen | ❌ | ✅ DALL-E | ✅ Imagen |
| Generación video | ❌ | ✅ Sora | ✅ Veo |
| Precio Pro | $17/mes | $20/mes | $20/mes |
| Mejor versión gratuita | 🥇 | 🥈 | 🥈 |

> 💡 **Conclusión**: para programar y trabajo de oficina avanzado, **Claude gana**. Para imágenes/video, **ChatGPT/Gemini ganan**.

---

## 10. 🎯 Resumen ejecutivo

Antes de seguir al siguiente módulo, deberías poder responder estas 5 preguntas:

1. **¿Qué es Claude?** Un modelo de IA de Anthropic. Hay 3 modelos: Opus, Sonnet, Haiku.
2. **¿Qué es Claude Code?** La herramienta para devs: Claude conectado a tu PC.
3. **¿Qué es una Skill?** Una carpeta con `SKILL.md` que Claude carga automáticamente al detectar el contexto.
4. **¿Qué es MCP?** Un protocolo para conectar Claude con herramientas externas reales.
5. **¿Versión gratis o pago?** Para este curso, **gratis basta**. Considera Pro si lo usas más de 2h/día.

---

## 📚 Para profundizar

- 💰 [Cómo ahorrar tokens en la versión gratuita](../docs/01-tokens-y-ahorro.md)
- 🤖 [Modelos de Claude](../docs/02-modelos-de-claude.md)
- 🛠 [Guía completa de Skills](../docs/03-skills-completo.md)
- 🔌 [MCP paso a paso](../docs/04-mcp-paso-a-paso.md)

---

## ➡️ Siguiente

Continúa con [Bloque 0 — Setup](README.md) para instalar Claude Code y dejar todo listo, luego pasa a [Bloque 1 — Prompting](../bloque-1-prompting/README.md).

---

> **OJB Soluciones Informáticas** · WhatsApp [970 779 871](https://wa.me/51970779871)
