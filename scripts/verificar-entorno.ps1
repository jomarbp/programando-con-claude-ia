# verificar-entorno.ps1
# Verifica que todo este listo antes del curso.

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Verificacion del entorno - Curso Claude IA " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

function Check($name, $cmd) {
    try {
        $null = & $cmd 2>&1
        Write-Host "  [OK]   $name" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "  [FAIL] $name" -ForegroundColor Red
        return $false
    }
}

# Herramientas
Write-Host "Herramientas:" -ForegroundColor Yellow
Check "Git"        { git --version }
Check "Node.js"    { node --version }
Check "PHP"        { php --version }
Check "MySQL"      { mysql --version }
Check "GitHub CLI" { gh --version }

Write-Host ""
Write-Host "Carpetas:" -ForegroundColor Yellow

# Carpetas
$skillsPath = Join-Path $env:USERPROFILE ".claude\skills"
if (Test-Path $skillsPath) {
    $count = (Get-ChildItem -Directory $skillsPath -Recurse -Depth 2 | Where-Object { Test-Path "$($_.FullName)\SKILL.md" }).Count
    Write-Host "  [OK]   ~/.claude/skills/ ($count skills detectadas)" -ForegroundColor Green
} else {
    Write-Host "  [FAIL] ~/.claude/skills/ no existe" -ForegroundColor Red
    Write-Host "         Ejecuta: .\scripts\instalar-skills.ps1" -ForegroundColor Yellow
}

# Config MCP
$mcpConfig = Join-Path $env:APPDATA "Claude\claude_desktop_config.json"
if (Test-Path $mcpConfig) {
    Write-Host "  [OK]   Configuracion MCP encontrada" -ForegroundColor Green
} else {
    Write-Host "  [WARN] No hay configuracion MCP (opcional)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Listo. Si todo dice [OK], puedes empezar el curso!" -ForegroundColor Cyan
Write-Host ""
