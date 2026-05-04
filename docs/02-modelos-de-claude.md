# 🤖 Modelos de Claude: cuándo usar cada uno

Claude no es un solo modelo. La familia **Claude 4.X** tiene tres modelos con distinto balance entre velocidad, inteligencia y costo.

## 📊 Tabla comparativa

| Modelo | ID | Velocidad | Inteligencia | Costo | Ideal para |
|--------|----|-----------|--------------|-------|-----------|
| **Claude Opus 4.7** | `claude-opus-4-7` | 🐢 Lenta | 🧠🧠🧠 Máxima | $$$ | Tareas complejas, arquitectura, razonamiento profundo |
| **Claude Sonnet 4.6** | `claude-sonnet-4-6` | 🚶 Media | 🧠🧠 Alta | $$ | Día a día, programación general |
| **Claude Haiku 4.5** | `claude-haiku-4-5` | 🐇 Muy rápida | 🧠 Buena | $ | Tareas simples, alto volumen |

---

## 🧠 Opus — el cerebro

**Úsalo cuando:**
- Diseñas arquitectura desde cero
- Resuelves bugs complejos que otros modelos no pudieron
- Necesitas análisis profundo de código grande
- Haces refactor de un sistema completo

**No lo uses para:**
- Generar HTML simple
- Tareas repetitivas
- Prompts de 1 línea

---

## ⚖️ Sonnet — el todoterreno (RECOMENDADO POR DEFECTO)

**Úsalo cuando:**
- Programas tu día a día
- Generas landing pages, formularios, componentes
- Conectas frontend con backend
- Escribes consultas SQL medianas
- Aún no sabes qué modelo elegir

> **Es el modelo que usa TODO este curso.**

---

## ⚡ Haiku — el velocista

**Úsalo cuando:**
- Necesitas respuestas inmediatas
- Tareas simples y repetitivas
- Procesas grandes volúmenes (clasificar, etiquetar)
- Quieres llamar a Claude muchas veces desde un script

**Ejemplos perfectos:**
- "Tradúceme estos 50 títulos al inglés"
- "Dame un sinónimo de cada palabra"
- "Categoriza estos 100 productos en 5 grupos"

---

## 🎯 Regla práctica

```
¿La tarea requiere pensar mucho?      →  Opus
¿La tarea es de programación normal?  →  Sonnet
¿La tarea es simple y repetitiva?     →  Haiku
```

---

## 🆓 En la versión gratuita

- Por defecto usas **Sonnet 4.6**
- En alta demanda Claude puede degradarte automáticamente a Haiku
- **Opus** está reservado para Pro

> 🎯 Por eso el curso entero está diseñado alrededor de **Sonnet**: porque es lo que tienen los alumnos.
