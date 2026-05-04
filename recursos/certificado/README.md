# 🎓 Plantilla de Certificado

Certificado profesional listo para personalizar y exportar como PDF.

## 📁 Archivo principal

- **`plantilla-certificado.html`** — plantilla A4 horizontal con diseño profesional

## 🚀 Cómo usar

### Opción 1 — Personalizar por URL (rápido)

Abre el archivo con parámetros en la URL:

```
file:///ruta/plantilla-certificado.html?nombre=Juan%20Perez&fecha=2026-05-15&id=CERT-0001
```

| Parámetro | Ejemplo |
|-----------|---------|
| `nombre` | `Juan%20Perez` |
| `fecha` | `2026-05-15` |
| `id` | `CERT-0001` |

### Opción 2 — Editar a mano

1. Abre `plantilla-certificado.html` en cualquier editor
2. Reemplaza `[NOMBRE DEL PARTICIPANTE]` por el nombre real
3. Reemplaza `[FECHA]` por la fecha
4. Cambia `CERT-XXXX` por un ID único

## 🖨 Exportar a PDF

### Desde Chrome / Edge

1. Abrir el HTML en el navegador
2. **Ctrl + P** (Imprimir)
3. Destino: **Guardar como PDF**
4. Diseño: **Horizontal**
5. Márgenes: **Ninguno**
6. Tamaño: **A4**
7. **Más ajustes** → marcar "Gráficos en segundo plano"
8. Guardar

### Lote masivo (varios certificados)

Usa el script Python `generar-certificados.py` (siguiente sección).

## 🎨 Personalización del diseño

El certificado usa:
- **Naranja**: `#E8742C`
- **Azul oscuro**: `#1F3A5F`
- Fuente: Georgia (clásica, profesional)
- Tamaño: A4 horizontal (297mm × 210mm)

Para cambiar colores, busca en el `<style>` y reemplaza los valores.

## 📦 Generación masiva

```bash
python ../../scripts/generar-certificados.py participantes.csv
```

Donde `participantes.csv` tiene formato:

```csv
nombre,fecha,id
Juan Perez,2026-05-15,CERT-0001
Maria Lopez,2026-05-15,CERT-0002
```
