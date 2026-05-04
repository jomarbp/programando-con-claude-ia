# Bloque 2 — Proyecto 1: Landing Page profesional

> ⏱ **Duración**: 45 minutos
> 🎯 **Objetivo**: Construir una landing page completa para el curso, lista para publicar.

---

## 📅 Estructura del bloque

| Min | Actividad | Resultado |
|-----|-----------|-----------|
| 0–5 | Brief del proyecto | Todos saben qué se construirá |
| 5–15 | Prompt maestro | Esqueleto del sitio |
| 15–25 | Secciones (hero, beneficios, temario, testimonios) | Sitio con todo |
| 25–33 | Formulario + responsive | Funcional en móvil |
| 33–40 | Iteración y refinamiento | Sitio profesional |
| 40–45 | Resultado en navegador | Celebrar |

---

## Paso 1 — Brief del proyecto

```
Curso: Programando con Claude IA
Público: profesionales y estudiantes
Colores: naranja #E8742C y azul oscuro #1F3A5F
Secciones: Hero, Beneficios, Temario, Testimonios, Contacto
Objetivo: que la persona se inscriba
```

---

## Paso 2 — Prompt maestro

📂 Archivo: [`prompts-maestros/PM-01-landing.md`](../prompts-maestros/PM-01-landing.md)

Copia y pega el prompt en Claude. Te devolverá un `index.html` completo.

---

## Paso 3 — Guardar el resultado

```powershell
# Windows PowerShell
mkdir landing-curso-ia
cd landing-curso-ia
notepad index.html
# Pega el código que dio Claude y guarda
```

```bash
# Linux/Mac
mkdir landing-curso-ia
cd landing-curso-ia
nano index.html
# Pega el código y Ctrl+O, Ctrl+X
```

Doble clic al archivo: se abre en tu navegador. **¡Tu primera página con IA está lista!** 🎉

---

## Paso 4 — Iteración guiada (lo más valioso)

Aquí está el oro del curso. Demostrar 3 iteraciones:

### Iteración A — Mejorar el hero

```
El hero se ve plano. Hazlo más impactante: agrega un fondo con degradado
naranja-azul, aumenta el tamaño del título a 5xl en desktop, y añade una
pequeña animación de fade-in al cargar. Devuelve solo la sección hero
modificada.
```

### Iteración B — Agregar lo que falta

```
Falta una sección "Cómo funciona" con 4 pasos numerados (Inscríbete, Aprende,
Practica, Certifícate). Insértala entre Beneficios y Temario. Devuelve solo
esa sección nueva.
```

### Iteración C — Hacer el formulario funcional

```
El formulario actual no envía. Hazlo funcional usando Formspree (yo configuraré
el endpoint después). Agrega validación con JavaScript: campos obligatorios y
formato de email. Devuelve solo el HTML del formulario y el script.
```

---

## 🛠 Skills usadas durante el bloque

| Skill | Cuándo se activa |
|-------|------------------|
| Generación de código | Al pedir el HTML completo |
| Diseño UI/UX | Al refinar colores y espaciado |
| Optimización | Al pedir auto-revisión de performance |

---

## 💡 Tip de tokens

Después del prompt maestro, **NO** pegues otra vez el HTML completo en cada iteración. Solo pide:

✅ "Modifica el hero del HTML anterior..."
❌ "Aquí va todo el HTML [800 líneas]... ahora cambia el hero..."

Ahorras hasta **80% de tokens**.

---

## 🎯 Resultado esperado

📂 Ver el código final en: [`proyecto-respaldo/landing/index.html`](../proyecto-respaldo/landing/index.html)

---

## ➡️ Siguiente

Ve a [Bloque 3 — Skills](../bloque-3-skills/README.md)
