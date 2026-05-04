# 🛒 Tienda IA — Proyecto de respaldo

Código completo del Proyecto 2 del curso, listo para usar si en clase algo falla.

## 📂 Archivos

```
tienda/
├── catalogo.html       ← Frontend con carrito en localStorage
├── productos.php       ← Endpoint JSON conectado a MySQL
└── db/
    └── tienda_ia.sql   ← Schema completo + datos de ejemplo
```

## 🚀 Instalación rápida

### 1. Crear la base de datos

```bash
mysql -u root < db/tienda_ia.sql
```

O desde phpMyAdmin: pestaña **SQL** → pegar el contenido de `tienda_ia.sql` → Continuar.

### 2. Levantar el servidor PHP

```bash
cd proyecto-respaldo/tienda
php -S localhost:8000
```

### 3. Abrir en el navegador

http://localhost:8000/catalogo.html

---

## ✅ Verificación

Visitando `http://localhost:8000/productos.php` debes ver un JSON así:

```json
{
  "ok": true,
  "total": 5,
  "productos": [...]
}
```

Si ves error: revisa que MySQL esté corriendo y la base `tienda_ia` exista.
