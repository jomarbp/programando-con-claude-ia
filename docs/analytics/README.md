# 📊 Agregar Google Analytics al sitio del curso

> Mide cuánta gente visita tu curso, de dónde vienen, qué bloques leen más.

## 📋 Pre-requisitos

- Cuenta de Google
- 5 minutos

---

## Paso 1 — Crear cuenta en Google Analytics 4

1. Ve a [analytics.google.com](https://analytics.google.com)
2. **Empezar a medir**
3. Crea una cuenta: nombre `OJB Soluciones`
4. Crea una propiedad: nombre `Curso Claude IA`
5. Datos de la empresa → continuar
6. Plataforma → **Web**
7. URL: `https://jomarbp.github.io/programando-con-claude-ia/`
8. Nombre del flujo: `Curso Claude IA - Sitio web`
9. **Crear flujo**

## Paso 2 — Copiar el ID de medición

Verás algo como:

```
ID de medición: G-XXXXXXXXXX
```

Cópialo. Lo necesitas en el siguiente paso.

---

## Paso 3 — Agregar el código al sitio

### Opción A — Editar `index.html`

Abre `index.html` y antes del `</head>` agrega:

```html
<!-- Google Analytics 4 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

> Reemplaza `G-XXXXXXXXXX` por tu ID real.

### Opción B — Script automático

```bash
# Reemplaza el placeholder por tu ID real
python scripts/agregar-analytics.py G-XXXXXXXXXX
```

(Crear este script si lo necesitas frecuentemente).

---

## Paso 4 — Hacer commit y push

```bash
git add index.html demos/
git commit -m "feat: agregar Google Analytics 4"
git push
```

GitHub Pages se actualiza en 1–2 minutos.

---

## Paso 5 — Verificar

1. Abre tu sitio: https://jomarbp.github.io/programando-con-claude-ia/
2. Ve a Google Analytics → **Informes** → **Tiempo real**
3. Deberías verte como visitante activo

---

## 📈 Eventos personalizados útiles

Agrega estos al `<script>` para medir mejor:

```javascript
// Medir cuándo alguien clic en "Empezar curso"
document.querySelectorAll('a[href*="github.com"]').forEach(link => {
  link.addEventListener('click', () => {
    gtag('event', 'click_github', { 'event_category': 'engagement' });
  });
});

// Medir cuándo alguien clic en WhatsApp
document.querySelectorAll('a[href*="wa.me"]').forEach(link => {
  link.addEventListener('click', () => {
    gtag('event', 'click_whatsapp', { 'event_category': 'conversion' });
  });
});

// Medir scroll profundo
let scrollMarker = false;
window.addEventListener('scroll', () => {
  if (!scrollMarker && window.scrollY > document.body.scrollHeight * 0.75) {
    gtag('event', 'scroll_75', { 'event_category': 'engagement' });
    scrollMarker = true;
  }
});
```

---

## 🔒 Privacidad

Si quieres respetar la privacidad de tus usuarios:

1. Activa **anonimización de IP**:
   ```javascript
   gtag('config', 'G-XXXXXXXXXX', { 'anonymize_ip': true });
   ```

2. Agrega un banner de cookies (puedes usar [cookieconsent](https://www.cookieconsent.com/))

3. Crea una página de **política de privacidad**

---

## 📊 Métricas que vale la pena revisar

| Métrica | Para qué sirve |
|---------|---------------|
| Usuarios activos | ¿Cuánta gente entra? |
| Páginas vistas | ¿Qué bloques leen más? |
| Tiempo en página | ¿Engancha el contenido? |
| Tasa de rebote | ¿Se van rápido? |
| Fuentes de tráfico | ¿De dónde llegan? |
| Eventos | Clics importantes |

---

## 🆓 Alternativas gratuitas a Google Analytics

| Servicio | Privacy-friendly | Setup |
|----------|------------------|-------|
| [Plausible](https://plausible.io) | ✅ Sí | 1 línea de JS |
| [Umami](https://umami.is) | ✅ Sí, self-hosted | Docker |
| [GoatCounter](https://goatcounter.com) | ✅ Sí | 1 línea, gratis |
| [Cloudflare Analytics](https://cloudflare.com) | ✅ Sí | Si usas CF |
