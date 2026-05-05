# Bloque 0 — Bienvenida y Setup

> ⏱ **Duración**: 15 minutos
> 🎯 **Objetivo**: Que todos los participantes tengan Claude Code funcionando.

> 📘 **Lectura previa recomendada**: [Introducción a los fundamentos](introduccion-fundamentos.md) — qué es Claude Code, Skills, MCP, versión gratis vs paga, ventajas y desventajas (15 min).

---

## 📋 Agenda del bloque

| Min | Actividad |
|-----|-----------|
| 0–2 | Bienvenida y mostrar proyectos finales |
| 2–5 | ¿Qué es Claude IA? |
| 5–7 | Crear cuenta gratuita en claude.ai |
| 7–12 | Instalar Claude Code Desktop |
| 12–15 | Primer "hola mundo" con Claude |

---

## Paso 1 — Crear cuenta gratuita en Claude

1. Ir a [https://claude.ai](https://claude.ai)
2. Hacer clic en **Sign up**
3. Iniciar sesión con Google (más rápido) o crear cuenta con email
4. Verificar correo electrónico
5. Listo: tienes acceso gratuito a Claude Sonnet 4.6

> ⚠️ **Importante**: la cuenta gratuita es suficiente para todo el curso.

---

## Paso 2 — Instalar Claude Code Desktop

### Windows

```powershell
# Opción A: descarga manual
# Ve a https://claude.com/claude-code y descarga el .exe

# Opción B: con winget
winget install Anthropic.ClaudeCode
```

### macOS

```bash
brew install --cask claude-code
```

### Linux

```bash
curl -fsSL https://claude.com/install.sh | sh
```

---

## Paso 3 — Verificar instalación

Abre Claude Code Desktop y verifica:

```bash
claude --version
```

Debe mostrar algo como: `claude-code 2.x.x`

---

## Paso 4 — Primer "hola mundo"

En Claude Code, escribe:

```
Hola Claude, dime en una sola línea qué puedes hacer por mí como programador.
```

Si responde, **¡estás listo para el curso!** 🎉

---

## ❓ Posibles tropiezos

| Problema | Solución |
|----------|----------|
| No puedo instalar Claude Code | Usa la versión web claude.ai como respaldo |
| Conexión lenta | Cierra otras pestañas y aplicaciones pesadas |
| No tengo cuenta Google | Crea cuenta con cualquier correo personal |
| Bloqueo por límites | Espera 5 horas o pasa a Claude Pro |

---

## ➡️ Siguiente

Ve a [Bloque 1 — El arte del prompting](../bloque-1-prompting/README.md)
