# 📱 Códigos QR del curso

QRs listos para imprimir en flyers, diapositivas y material físico.

| Archivo | Para qué | Apunta a |
|---------|----------|----------|
| `qr-curso-principal.png` | Banner principal, diapositivas | Sitio del curso |
| `qr-curso-principal.svg` | Versión vectorial (impresión grande) | Sitio del curso |
| `qr-github-repo.png` | Para que vean el código fuente | Repositorio |
| `qr-demo-landing.png` | Mostrar el proyecto 1 antes de inscribirse | Demo Landing |
| `qr-demo-tienda.png` | Mostrar el proyecto 2 | Demo Tienda |
| `qr-whatsapp.png` | Para inscripciones rápidas | WhatsApp |

## 🔄 Regenerar los QR

```bash
python scripts/generar-qr.py
```

## 🎨 Personalizar

Edita `scripts/generar-qr.py` y cambia:
- Diccionario `URLS` para agregar nuevas URLs
- Variables `NARANJA` y `AZUL` para cambiar colores
- `box_size` para tamaño del QR

## 💡 Ideas de uso

- 📄 **Flyer impreso**: QR principal grande + WhatsApp
- 🖼 **Roll-up de evento**: QR con título "Escanea para ver el curso"
- 🪧 **Tarjeta de presentación**: QR de WhatsApp + repo
- 📊 **Diapositiva final**: QR principal para que escaneen al terminar la sesión
