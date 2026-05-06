# refrescar-cookies.ps1
# Script auxiliar para abrir Chrome con CDP y permitir refresh de cookies de NotebookLM

$env:PATH += ";$env:USERPROFILE\AppData\Roaming\Python\Python314\Scripts"

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Refresh de cookies NotebookLM              " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Pasos:" -ForegroundColor Yellow
Write-Host "  1. Se abrira Chrome con DevTools Protocol activo (puerto 9222)" -ForegroundColor White
Write-Host "  2. Inicia sesion en https://notebooklm.google.com/" -ForegroundColor White
Write-Host "  3. Espera a ver tus notebooks" -ForegroundColor White
Write-Host "  4. Vuelve a Claude Code y di: 'refresca las cookies de NotebookLM'" -ForegroundColor White
Write-Host ""

# Matar Chrome existente para evitar conflictos
Get-Process chrome -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 2

# Abrir Chrome con CDP
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$profileDir = "$env:USERPROFILE\chrome-nlm-profile"

if (-not (Test-Path $chromePath)) {
    Write-Host "[ERROR] Chrome no encontrado en $chromePath" -ForegroundColor Red
    exit 1
}

Write-Host "Iniciando Chrome..." -ForegroundColor Green
Start-Process -FilePath $chromePath -ArgumentList "--remote-debugging-port=9222","--user-data-dir=`"$profileDir`"","https://notebooklm.google.com/"

Write-Host ""
Write-Host "[OK] Chrome iniciado en puerto 9222" -ForegroundColor Green
Write-Host "    Inicia sesion y luego vuelve a Claude Code." -ForegroundColor White
