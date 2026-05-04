# 🌍 Configurar dominio propio para el sitio del curso

> Reemplaza `jomarbp.github.io/programando-con-claude-ia/` por algo como `claude.ojbsoluciones.com` o `curso.tudominio.com`.

## 📋 Requisitos

- Un dominio comprado en GoDaddy, Namecheap, Hostinger, Google Domains, etc.
- Acceso al panel de DNS del dominio
- 5 minutos de configuración

---

## Paso 1 — Decidir el subdominio o dominio

| Opción | Ejemplo | Recomendación |
|--------|---------|---------------|
| Subdominio | `curso.ojbsoluciones.com` | ✅ Recomendado (no afecta tu sitio principal) |
| Subdominio | `claude.ojbsoluciones.com` | ✅ Alternativa |
| Dominio raíz | `ojbsoluciones.com` | ⚠️ Solo si el dominio es exclusivo del curso |

---

## Paso 2 — Configurar DNS

### Para subdominio (ej. `curso.ojbsoluciones.com`)

En el panel DNS de tu dominio, crea un registro **CNAME**:

| Tipo | Nombre / Host | Valor / Apunta a | TTL |
|------|---------------|------------------|-----|
| `CNAME` | `curso` | `jomarbp.github.io` | 3600 |

### Para dominio raíz (ej. `ojbsoluciones.com`)

Necesitas **4 registros A** apuntando a las IPs de GitHub:

| Tipo | Nombre | Valor | TTL |
|------|--------|-------|-----|
| `A` | `@` | `185.199.108.153` | 3600 |
| `A` | `@` | `185.199.109.153` | 3600 |
| `A` | `@` | `185.199.110.153` | 3600 |
| `A` | `@` | `185.199.111.153` | 3600 |

Y opcionalmente un `AAAA` para IPv6:

```
AAAA  @  2606:50c0:8000::153
AAAA  @  2606:50c0:8001::153
AAAA  @  2606:50c0:8002::153
AAAA  @  2606:50c0:8003::153
```

---

## Paso 3 — Crear el archivo CNAME en el repo

```bash
echo "curso.ojbsoluciones.com" > CNAME
git add CNAME
git commit -m "feat: agregar dominio personalizado"
git push
```

> Reemplaza `curso.ojbsoluciones.com` por tu dominio real.

---

## Paso 4 — Activar HTTPS en GitHub

1. Ve a tu repo → **Settings** → **Pages**
2. En **Custom domain**, escribe tu dominio (ya debería estar)
3. Espera ~10 minutos a que GitHub valide el DNS
4. Marca la casilla **Enforce HTTPS** ✅

---

## Paso 5 — Verificar

```bash
# Esperar la propagación DNS (puede tardar minutos a horas)
dig curso.ojbsoluciones.com +short
nslookup curso.ojbsoluciones.com

# Probar el sitio
curl -I https://curso.ojbsoluciones.com
```

Debe responder `HTTP/2 200`.

---

## 🚨 Problemas comunes

| Problema | Solución |
|----------|----------|
| `DNS check failed` en GitHub | Espera 1 hora, luego refresca |
| Certificado SSL no se genera | Verifica que el CNAME esté correcto y espera más |
| Mi dominio no resuelve | Verifica con `dig` y revisa el panel DNS |
| Aparece el sitio antiguo | Limpia caché del navegador (Ctrl+Shift+R) |

---

## 💡 Comando GitHub CLI

```bash
# Configurar dominio desde la terminal
gh api -X PUT repos/jomarbp/programando-con-claude-ia/pages \
  -f cname=curso.ojbsoluciones.com \
  -F https_enforced=true
```

---

## 🎯 Ejemplo completo

Si compraste **`ojbsoluciones.com`** y quieres **`curso.ojbsoluciones.com`**:

1. **DNS** del proveedor → agregar CNAME `curso` → `jomarbp.github.io`
2. **En el repo**:
   ```bash
   echo "curso.ojbsoluciones.com" > CNAME
   git add CNAME && git commit -m "feat: dominio propio" && git push
   ```
3. **GitHub Pages** → Custom domain → `curso.ojbsoluciones.com` → Save
4. Esperar 10-30 min → marcar **Enforce HTTPS**
5. ¡Listo! Tu curso está en `https://curso.ojbsoluciones.com`
