# Bloque 5 — MCP: Claude conectado al mundo real

> ⏱ **Duración**: 25 minutos
> 🎯 **Objetivo**: Entender MCP y ver Claude consultando MySQL en vivo.

---

## 🔌 ¿Qué es MCP?

**MCP = Model Context Protocol**

Es un estándar abierto que permite a Claude **comunicarse con herramientas externas**: bases de datos, sistemas de archivos, APIs, navegadores, etc.

```
Prompts → palabras
Skills  → habilidades
MCP     → manos y pies (ejecuta acciones reales)
```

---

## 🆚 Diferencia entre Prompts, Skills y MCP

| Concepto | Qué hace | Ejemplo |
|----------|----------|---------|
| **Prompt** | Instrucción en lenguaje natural | "Genérame un HTML responsive" |
| **Skill** | Capacidad especializada activada por Claude | Leer un PDF, generar un Excel |
| **MCP** | Conexión con herramienta externa | Consultar la BD MySQL real |

---

## 🌐 Casos de uso reales

| MCP | Para qué sirve |
|-----|----------------|
| `filesystem` | Claude lee/escribe archivos en tu PC |
| `mysql` | Ejecutar consultas SQL reales |
| `postgres` | Igual, pero PostgreSQL |
| `github` | Crear issues, PRs, revisar código |
| `chrome-devtools` | Controlar el navegador, automatizar pruebas |
| `slack` | Enviar y leer mensajes |
| `notion` | Leer y escribir en Notion |

---

## 🎬 Demostración en vivo (10 min)

**Escenario**: Claude consulta directamente la BD `tienda_ia` del Bloque 4.

### 1. Prompt simple

```
Conéctate a la base tienda_ia y dime cuántos productos activos tengo.
```

Claude usa el MCP de MySQL → ejecuta `SELECT COUNT(*) FROM productos WHERE activo=1` → te devuelve el número.

### 2. Prompt avanzado

```
Encuentra el producto más caro de la tienda y aplícale un descuento del 20%
con un UPDATE. Confirma mostrándome el antes y el después.
```

Claude:
1. Hace `SELECT` para encontrar el más caro
2. Calcula el nuevo precio
3. Hace `UPDATE`
4. Hace `SELECT` para confirmar
5. Te muestra antes/después

### 3. Verificación visual

Abre phpMyAdmin → tabla `productos` → confirma que el cambio es real.

**¡Boom! Claude acaba de operar tu BD.** 🎉

---

## 🛠 Cómo instalar un MCP

### Paso 1 — Encontrar el MCP

Buscar en:
- **Registro oficial**: https://github.com/modelcontextprotocol/servers
- **Búsqueda**: GitHub topic `mcp-server`

### Paso 2 — Editar la configuración de Claude Code

Ubicación del archivo:

```powershell
# Windows
notepad "$env:APPDATA\Claude\claude_desktop_config.json"
```

```bash
# macOS
nano ~/Library/Application\ Support/Claude/claude_desktop_config.json

# Linux
nano ~/.config/Claude/claude_desktop_config.json
```

### Paso 3 — Agregar el MCP

Ejemplo para MySQL:

```json
{
  "mcpServers": {
    "mysql": {
      "command": "npx",
      "args": [
        "-y",
        "@benborla29/mcp-server-mysql"
      ],
      "env": {
        "MYSQL_HOST": "127.0.0.1",
        "MYSQL_PORT": "3306",
        "MYSQL_USER": "root",
        "MYSQL_PASS": "",
        "MYSQL_DB": "tienda_ia"
      }
    }
  }
}
```

### Paso 4 — Reiniciar Claude Code

Cierra completamente y vuelve a abrir.

### Paso 5 — Probar

```
¿Qué MCPs tienes activos? Listámelos.
```

---

## 🎯 MCPs recomendados para empezar

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "C:\\Users\\JOE\\Desktop"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_aqui"
      }
    },
    "mysql": {
      "command": "npx",
      "args": ["-y", "@benborla29/mcp-server-mysql"],
      "env": {
        "MYSQL_HOST": "127.0.0.1",
        "MYSQL_USER": "root",
        "MYSQL_PASS": "",
        "MYSQL_DB": "tienda_ia"
      }
    }
  }
}
```

---

## ⚠️ Límites en versión gratuita

- ✅ MCP funciona en versión gratuita
- ⚠️ Cuotas más limitadas (menos consultas/hora)
- 💡 Si los usas intensivamente, considera Claude Pro

---

## 🔒 Seguridad importante

- ❌ **Nunca** subas el archivo `claude_desktop_config.json` a GitHub si tiene tokens.
- ✅ Usa variables de entorno cuando sea posible.
- ✅ Da permisos mínimos al token de GitHub (solo `repo`, no admin).
- ✅ Usa MCPs de fuentes confiables (oficiales o muy populares).

---

## ➡️ Siguiente

Ve a [Bloque 6 — Cierre](../bloque-6-cierre/README.md)
