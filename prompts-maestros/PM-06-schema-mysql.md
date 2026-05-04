# PM-06 — Schema MySQL

> Bloque 4 — Generar la base de datos completa.

```
Genera el script SQL completo para crear una base de datos MySQL llamada
"tienda_ia" con estas tablas:

1) categorias (id, nombre, descripcion)
2) productos (id, categoria_id FK, nombre, descripcion, precio, stock,
   imagen, activo)
3) usuarios (id, nombre, email único, password_hash, fecha_registro)
4) pedidos (id, usuario_id FK, fecha, total, estado)
5) pedido_detalle (id, pedido_id FK, producto_id FK, cantidad,
   precio_unitario)

Incluye:
- Llaves foráneas con ON DELETE CASCADE donde corresponda
- Índices en campos buscables
- 3 categorías de ejemplo
- 5 productos de ejemplo

Devuelve solo el SQL, sin explicaciones, listo para ejecutar en phpMyAdmin.
```
