#!/usr/bin/env bash
# instalar-skills.sh
# Instala las skills oficiales de Anthropic en ~/.claude/skills/
# Uso: bash scripts/instalar-skills.sh

set -e

echo "=============================================="
echo "  Instalador de Skills oficiales de Claude   "
echo "=============================================="
echo ""

# 1. Verificar git
if ! command -v git &> /dev/null; then
    echo "[ERROR] Git no está instalado."
    echo "Instálalo con: sudo apt install git  (Linux)"
    echo "             o: brew install git      (macOS)"
    exit 1
fi

# 2. Crear carpeta de skills
SKILLS_PATH="$HOME/.claude/skills"
if [ ! -d "$SKILLS_PATH" ]; then
    echo "[+] Creando carpeta: $SKILLS_PATH"
    mkdir -p "$SKILLS_PATH"
else
    echo "[OK] Carpeta ya existe: $SKILLS_PATH"
fi

# 3. Clonar/actualizar repositorio oficial
REPO_PATH="$SKILLS_PATH/anthropic-skills"
if [ -d "$REPO_PATH" ]; then
    echo "[~] Actualizando skills existentes..."
    cd "$REPO_PATH"
    git pull
else
    echo "[+] Clonando skills oficiales desde GitHub..."
    cd "$SKILLS_PATH"
    git clone https://github.com/anthropics/skills.git anthropic-skills
fi

# 4. Listar skills instaladas
echo ""
echo "=============================================="
echo "  Skills instaladas                          "
echo "=============================================="
ls -1 "$REPO_PATH" | while read skill; do
    if [ -d "$REPO_PATH/$skill" ]; then
        echo "  - $skill"
    fi
done

# 5. Mensaje final
echo ""
echo "[OK] Instalación completada."
echo ""
echo "Siguientes pasos:"
echo "  1. Cierra Claude Code Desktop completamente"
echo "  2. Vuelve a abrir Claude Code"
echo "  3. Pregunta: '¿Qué skills tienes instaladas?'"
echo ""
