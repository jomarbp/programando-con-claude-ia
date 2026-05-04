# Bloque 4 — Proyecto 2: Tienda online con MySQL

> ⏱ **Duración**: 45 minutos
> 🎯 **Objetivo**: Construir la base de una tienda online: frontend + backend + base de datos.

---

## 📅 Estructura del bloque

| Min | Actividad | Resultado |
|-----|-----------|-----------|
| 0–8 | Arquitectura del proyecto | Diagrama del proyecto |
| 8–18 | Schema MySQL | Base de datos creada |
| 18–30 | Frontend (catálogo + carrito) | Interfaz de tienda |
| 30–40 | Backend PHP | Productos cargados desde BD |
| 40–45 | Pruebas y celebración | Tienda funcional |

---

## 🛠 Pre-requisitos

- **MySQL local**: XAMPP, Laragon, MAMP o instalación directa
- **PHP 8+**: incluido en XAMPP/Laragon o instalable aparte
- **Editor**: VS Code, Sublime, Notepad++

### Instalación rápida (Windows con XAMPP)

```powershell
# Con winget
winget install ApacheFriends.Xampp.8.2
```

Después: **Iniciar XAMPP Control Panel** → Start Apache + MySQL.

---

## Paso 1 — Diseñar la arquitectura

Prompt: 📂 [`prompts-maestros/PM-05-arquitectura-tienda.md`](../prompts-maestros/PM-05-arquitectura-tienda.md)

Claude te devolverá:
- Lista de archivos del proyecto
- Tablas con sus campos
- Flujo de usuario

---

## Paso 2 — Generar el schema MySQL

Prompt: 📂 [`prompts-maestros/PM-06-schema-mysql.md`](../prompts-maestros/PM-06-schema-mysql.md)

### Ejecutar el SQL

#### Opción A — phpMyAdmin (GUI)
1. Abrir `http://localhost/phpmyadmin`
2. Pestaña **SQL**
3. Pegar el SQL → **Continuar**

#### Opción B — Línea de comandos
```bash
mysql -u root -p < tienda_ia.sql
```

### Verificar que funcionó

```sql
USE tienda_ia;
SHOW TABLES;
SELECT * FROM productos LIMIT 5;
```

---

## Paso 3 — Frontend del catálogo

Prompt: 📂 [`prompts-maestros/PM-07-catalogo-frontend.md`](../prompts-maestros/PM-07-catalogo-frontend.md)

Guarda el resultado como `catalogo.html`.

---

## Paso 4 — Backend mínimo en PHP

Prompt: 📂 [`prompts-maestros/PM-08-backend-php.md`](../prompts-maestros/PM-08-backend-php.md)

Guarda como `productos.php` en la **misma carpeta** que `catalogo.html`.

### Conectar frontend con backend

Prompt: 📂 [`prompts-maestros/PM-09-conectar-frontend-backend.md`](../prompts-maestros/PM-09-conectar-frontend-backend.md)

---

## Paso 5 — Carrito (opcional)

Prompt: 📂 [`prompts-maestros/PM-10-carrito.md`](../prompts-maestros/PM-10-carrito.md)

---

## Paso 6 — Levantar el servidor

### Opción A — Servidor PHP integrado (más fácil)

```bash
cd carpeta-de-tu-tienda
php -S localhost:8000
```

Abre `http://localhost:8000/catalogo.html` en el navegador.

### Opción B — XAMPP

1. Coloca todos los archivos en `C:\xampp\htdocs\tienda\`
2. Abre `http://localhost/tienda/catalogo.html`

---

## ✅ Checklist de verificación

- [ ] Base de datos `tienda_ia` creada
- [ ] 5 productos de ejemplo insertados
- [ ] `catalogo.html` muestra las tarjetas
- [ ] `productos.php` devuelve JSON al visitarlo directamente
- [ ] Las tarjetas se cargan dinámicamente desde la BD
- [ ] El botón "Agregar al carrito" funciona
- [ ] Responsive en móvil

---

## 💡 Lección clave

Un proyecto grande se construye con **muchos prompts pequeños y precisos**, no con un solo prompt gigante. Cada prompt:

1. Hace **una sola cosa**
2. Se basa en el resultado del anterior
3. Es **específico** sobre qué archivo modificar

---

## 📂 Código de respaldo

Si algo falla, copia el código completo de:
- 📁 [`proyecto-respaldo/tienda/`](../proyecto-respaldo/tienda/)

---

## ➡️ Siguiente

Ve a [Bloque 5 — MCP](../bloque-5-mcp/README.md)
