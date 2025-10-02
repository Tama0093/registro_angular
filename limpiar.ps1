Write-Host "🧹 Limpiando proyecto Angular..." -ForegroundColor Cyan

# Detener si está corriendo ng serve
taskkill /F /IM node.exe > $null 2>&1

# Borrar carpetas de cache y compilación
if (Test-Path ".angular") { Remove-Item -Recurse -Force ".angular" }
if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }
if (Test-Path "node_modules") { Remove-Item -Recurse -Force "node_modules" }

# Borrar archivos .tsbuildinfo
Get-ChildItem -Path . -Include *.tsbuildinfo -Recurse | Remove-Item -Force

Write-Host "📦 Instalando dependencias..." -ForegroundColor Yellow
npm install

Write-Host "✅ Proyecto limpio. Ahora puedes correr: ng serve" -ForegroundColor Green
