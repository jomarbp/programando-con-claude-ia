# 💰 Cómo ahorrar tokens en Claude

## ¿Qué es un token?

Un **token** es la unidad mínima que Claude usa para leer y escribir.

| Estimación | Equivalencia |
|------------|--------------|
| 1 token | ≈ 4 caracteres en inglés |
| 1 token | ≈ 3 caracteres en español |
| 100 palabras | ≈ 130–150 tokens |
| 1 página de texto | ≈ 500–700 tokens |

La versión gratuita tiene **límite de mensajes cada 5 horas**. Si gastas tokens innecesarios, te bloquea más rápido.

---

## 🏆 Las 10 reglas de oro

| # | Regla | Ahorro estimado |
|---|-------|-----------------|
| 1 | Sé breve en los prompts | 20–40% |
| 2 | No pegues archivos completos si solo cambias 1 sección | 50–80% |
| 3 | Pide solo el código modificado | 40–60% |
| 4 | Define formato de salida | 20–30% |
| 5 | No pidas explicaciones si no las necesitas | 30% |
| 6 | Usa conversación nueva al cambiar de proyecto | Resetea |
| 7 | Reusa prompts maestros | Reduce iteraciones |
| 8 | Comprime texto: guiones en vez de párrafos | 15% |
| 9 | No subas imágenes pesadas innecesarias | Hasta 1.500 tokens c/u |
| 10 | Cierra el chat al terminar | Variable |

---

## ⚖️ Comparativa: derrochador vs económico

### ❌ Derrochador (≈ 1.200 tokens)

```
Hola Claude, espero que estés bien. Te quería pedir un favor muy grande.
Necesito que me ayudes con un proyecto que estoy desarrollando para un curso.
Es una landing page sobre IA. ¿Podrías por favor explicarme paso a paso cómo
hacerla? Y de paso explícame también qué es HTML, CSS, Tailwind, y por qué es
útil. Después dime qué colores poner, qué texto, qué imágenes, etc. Quiero una
página completa con muchas secciones. Gracias de antemano.
```

### ✅ Económico (≈ 180 tokens)

```
Genera index.html para landing de curso "Claude IA". Tailwind. Paleta:
naranja #E8742C, azul #1F3A5F. Secciones: hero, 3 beneficios, formulario.
Solo código, sin explicaciones.
```

**Mismo resultado. 6 veces menos tokens.**

---

## 🎯 Trucos avanzados

- **Trabaja por partes**: divide proyectos grandes en 5 prompts pequeños.
- **Usa "solo código"**: evita explicaciones largas.
- **Reutiliza el contexto**: en la misma conversación di "modifica el hero del HTML anterior".
- **Pega fragmentos, no archivos**: si tu HTML tiene 800 líneas y solo cambias 30, pega solo esas 30.
- **Evita preámbulos**: nada de "por favor", "espero que estés bien", "muchas gracias". Claude no se ofende.

---

## 🚦 ¿Cuándo pasar a Claude Pro?

- Si te bloquean varias veces al día
- Si trabajas con archivos > 100 KB
- Si usas MCPs intensivamente
- Si trabajas más de 2 horas seguidas con Claude
