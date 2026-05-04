# PM-11 — MCP MySQL en vivo

> Bloque 5 — Demostración de Claude operando la BD real.

## Prompt 1: consulta simple

```
Conéctate a la base tienda_ia y dime cuántos productos activos tengo.
```

## Prompt 2: análisis

```
¿Cuál es el producto más caro de mi tienda? Devuélveme su nombre,
categoría y precio.
```

## Prompt 3: modificación

```
Encuentra el producto más caro de mi tienda y aplícale un descuento del 20%
con un UPDATE. Confirma el cambio mostrándome el precio antes y después.
```

## Prompt 4: análisis avanzado

```
Hazme un reporte de mi tienda en Markdown:
- Total de productos
- Productos por categoría
- Producto más caro y más barato
- Precio promedio
- Stock total disponible

Usa SELECT con GROUP BY donde corresponda.
```
