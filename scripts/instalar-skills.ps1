# instalar-skills.ps1
# Instala las skills oficiales de Anthropic en ~/.claude/skills/
# Uso: .\scripts\instalar-skills.ps1

$ErrorActionPreference = "Stop"

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Instalador de Skills oficiales de Claude   " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

# 1. Verificar git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Git no esta instalado." -ForegroundColor Red
    Write-Host "Instala git con: winget install git.git" -ForegroundColor Yellow
    exit 1
}

# 2. Crear carpeta de skills
$skillsPath = Join-Path $env:USERPROFILE ".claude\skills"
if (-not (Test-Path $skillsPath)) {
    Write-Host "[+] Creando carpeta: $skillsPath" -ForegroundColor Green
    New-Item -ItemType Directory -Force -Path $skillsPath | Out-Null
} else {
    Write-Host "[OK] Carpeta ya existe: $skillsPath" -ForegroundColor Yellow
}

# 3. Clonar/actualizar repositorio oficial
$repoPath = Join-Path $skillsPath "anthropic-skills"
if (Test-Path $repoPath) {
    Write-Host "[~] Actualizando skills existentes..." -ForegroundColor Yellow
    Set-Location $repoPath
    git pull
} else {
    Write-Host "[+] Clonando skills oficiales desde GitHub..." -ForegroundColor Green
    Set-Location $skillsPath
    git clone https://github.com/anthropics/skills.git anthropic-skills
}

# 4. Listar skills instaladas
Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Skills instaladas                          " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Get-ChildItem -Directory $repoPath | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor White
}

# 5. Mensaje final
Write-Host ""
Write-Host "[OK] Instalacion completada." -ForegroundColor Green
Write-Host ""
Write-Host "Siguientes pasos:" -ForegroundColor Cyan
Write-Host "  1. Cierra Claude Code Desktop completamente" -ForegroundColor White
Write-Host "  2. Vuelve a abrir Claude Code" -ForegroundColor White
Write-Host "  3. Pregunta: 'Que skills tienes instaladas?'" -ForegroundColor White
Write-Host ""
