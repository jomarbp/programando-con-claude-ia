# Bloque 1 — El arte del prompting

> ⏱ **Duración**: 25 minutos
> 🎯 **Objetivo**: Entender que la calidad del resultado depende de la calidad del prompt.

---

## 🧬 Anatomía de un prompt profesional

Un buen prompt tiene **5 componentes**:

| # | Componente | Ejemplo |
|---|-----------|---------|
| 1 | **Rol** | "Actúa como desarrollador frontend senior." |
| 2 | **Contexto** | "Estoy creando una landing page para un curso de IA." |
| 3 | **Tarea** | "Genera el HTML del hero con título, subtítulo y CTA." |
| 4 | **Formato** | "Devuélveme solo el código HTML, sin explicaciones." |
| 5 | **Restricciones** | "Usa Tailwind CSS y colores naranja y azul." |

---

## 🎯 Demostración: malo vs bueno

### ❌ Prompt malo

```
hazme una pagina web bonita
```

**Resultado**: genérico, colores aleatorios, sin enfoque al negocio.

### ✅ Prompt bueno

```
Actúa como desarrollador frontend senior. Necesito una landing page para
un curso online de Programación con IA llamado "Programando con Claude IA".
Usa HTML + Tailwind. Incluye: hero con título grande, 3 beneficios con íconos,
testimonios y formulario de contacto. Paleta: naranja #E8742C y azul oscuro
#1F3A5F. Devuelve solo el código completo en un único archivo.
```

**Resultado**: profesional, alineado al negocio, listo para usar.

---

## 🚀 Técnicas avanzadas

### 1. Few-shot prompting

Da ejemplos del estilo que esperas:

```
Aquí tienes ejemplos de cómo escribo títulos:
- "Domina Claude IA en 30 días"
- "El secreto detrás de los mejores prompts"

Genera 5 títulos más en ese estilo para mi curso.
```

### 2. Prompts encadenados

Divide proyectos grandes en prompts pequeños:

```
Prompt 1: "Diseña la estructura de carpetas del proyecto"
Prompt 2: "Genera el HTML del hero según la estructura anterior"
Prompt 3: "Ahora el CSS para esa sección"
Prompt 4: "Ahora el JavaScript para el formulario"
```

### 3. Prompts iterativos

```
1. "Genera la versión 1 del hero"
2. "Modifica solo el hero para hacerlo más impactante"
3. "Ahora agrega una animación de fade-in"
```

### 4. Auto-revisión

```
Revisa el código que acabas de generar y mejóralo en 3 aspectos:
performance, accesibilidad y diseño responsive.
```

---

## 🏋️ Ejercicio práctico (5 minutos)

Cada participante escribe un prompt para generar el hero de su propio proyecto imaginario aplicando los 5 componentes.

**Plantilla**:

```
Rol: Actúa como ___________
Contexto: Estoy creando ___________
Tarea: Genera ___________
Formato: Devuélveme ___________
Restricciones: Usa ___________
```

---

## 📜 Reglas de oro del prompting

1. **Sé específico**: cuanto más concreto, mejor el resultado.
2. **Da contexto**: Claude no sabe nada de tu negocio si no se lo dices.
3. **Define formato de salida**: "solo código", "lista numerada", "tabla en Markdown".
4. **Itera**: el primer resultado casi nunca es el final.
5. **Cuida los tokens**: prompts cortos consumen menos contexto.

---

## ➡️ Siguiente

Ve a [Bloque 2 — Landing Page](../bloque-2-landing-page/README.md)
