# 🤖 GitHub Actions — Plantillas

Estos workflows están listos pero **NO** se subieron a `.github/workflows/` porque el token de `gh` necesita el scope `workflow` para crearlos.

## ✅ Cómo activarlos

### Opción 1 — Con GitHub CLI (recomendado)

```powershell
# 1. Refrescar el token con el scope necesario
gh auth refresh -h github.com -s workflow

# 2. Crear la carpeta y mover el workflow
mkdir .github\workflows
move .github-templates\validar.yml.template .github\workflows\validar.yml

# 3. Commit y push
git add .github/workflows/validar.yml
git commit -m "ci: agregar validacion automatica"
git push
```

### Opción 2 — Manualmente desde la web

1. Entra a https://github.com/jomarbp/programando-con-claude-ia
2. Ir a la pestaña **Actions**
3. Hacer clic en **set up a workflow yourself**
4. Pega el contenido de `validar.yml.template`
5. Guarda como `validar.yml`
6. **Commit changes**

---

## 📋 Workflows incluidos

### `validar.yml.template`

Se ejecuta en cada push/PR a `main` y valida:

- ✅ Enlaces en archivos Markdown (que no estén rotos)
- ✅ Sintaxis HTML (de `index.html`, demos, proyecto-respaldo)
- ✅ Estructura del repo (cuenta bloques, prompts, docs)

**Triggers**: `push`, `pull_request`, manual (`workflow_dispatch`)
