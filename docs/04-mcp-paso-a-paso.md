# 🔌 MCP (Model Context Protocol) paso a paso

> MCP permite a Claude conectarse con herramientas externas reales: bases de datos, archivos, APIs, navegadores.

---

## 📂 Dónde está la configuración

| SO | Ruta |
|----|------|
| **Windows** | `%APPDATA%\Claude\claude_desktop_config.json` |
| **macOS** | `~/Library/Application Support/Claude/claude_desktop_config.json` |
| **Linux** | `~/.config/Claude/claude_desktop_config.json` |

### Abrir el archivo

```powershell
# Windows
notepad "$env:APPDATA\Claude\claude_desktop_config.json"
```

```bash
# macOS
open -e ~/Library/Application\ Support/Claude/claude_desktop_config.json

# Linux
nano ~/.config/Claude/claude_desktop_config.json
```

---

## 📝 Estructura del archivo

```json
{
  "mcpServers": {
    "nombre_del_mcp": {
      "command": "comando_a_ejecutar",
      "args": ["argumentos"],
      "env": {
        "VARIABLE": "valor"
      }
    }
  }
}
```

---

## 🎯 MCPs recomendados (configuración lista)

### 1. Filesystem — Claude lee/escribe archivos

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:\\Users\\JOE\\Desktop"
      ]
    }
  }
}
```

> ⚠️ Cambia la ruta por la tuya.

### 2. MySQL — Claude consulta tu BD

```json
{
  "mcpServers": {
    "mysql": {
      "command": "npx",
      "args": ["-y", "@benborla29/mcp-server-mysql"],
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

### 3. GitHub — Claude crea issues, PRs, commits

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_aqui"
      }
    }
  }
}
```

> 🔑 Generar token: https://github.com/settings/tokens (permisos: `repo`)

### 4. Configuración combinada (todo junto)

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "C:\\Users\\JOE\\Desktop"]
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
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_aqui"
      }
    }
  }
}
```

---

## 🔄 Pasos para activar un MCP

1. **Editar** `claude_desktop_config.json`
2. **Pegar** la configuración del MCP
3. **Guardar** el archivo
4. **Cerrar** completamente Claude Code Desktop
5. **Reabrir** Claude Code
6. **Verificar** preguntando: `¿Qué MCPs tienes activos?`

---

## 🧪 Pruebas para cada MCP

### Filesystem

```
Lista los archivos en mi escritorio.
```

### MySQL

```
Conéctate a la BD tienda_ia y dime cuántos productos tengo activos.
```

### GitHub

```
Crea un issue en mi repo "programando-con-claude-ia" con el título
"Agregar más ejemplos de prompts" y descripción "Ampliar la sección
de prompts maestros".
```

---

## 🔒 Seguridad

| Práctica | ¿Por qué? |
|----------|-----------|
| ❌ No subas `claude_desktop_config.json` a GitHub | Tiene tokens y contraseñas |
| ✅ Usa `.gitignore` | Para excluir archivos sensibles |
| ✅ Permisos mínimos en tokens | Solo lo necesario |
| ✅ MCPs de fuentes confiables | Oficiales o muy populares |
| ✅ Revoca tokens viejos | Si dejaste de usarlos |

---

## 📚 Catálogo oficial de MCPs

🔗 https://github.com/modelcontextprotocol/servers

| MCP | Para qué |
|-----|----------|
| `filesystem` | Sistema de archivos |
| `github` | Repositorios |
| `gitlab` | Repositorios GitLab |
| `postgres` | PostgreSQL |
| `sqlite` | SQLite |
| `slack` | Mensajes de Slack |
| `google-drive` | Google Drive |
| `puppeteer` | Automatizar navegador |
| `brave-search` | Búsquedas web |

---

## ⚠️ Límites en versión gratuita

- ✅ MCP funciona en gratuita
- ⚠️ Cuotas más limitadas
- 💡 Considera Pro si lo usas mucho
