# PRD Generator - One-command installer for Windows
# Usage: powershell -Command "iex (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/jandonaire-iarvix/prd-generator/main/install.ps1')"

$ErrorActionPreference = "Stop"

# Colors
function Write-Blue { Write-Host $args[0] -ForegroundColor Cyan }
function Write-Green { Write-Host $args[0] -ForegroundColor Green }
function Write-Yellow { Write-Host $args[0] -ForegroundColor Yellow }
function Write-Red { Write-Host $args[0] -ForegroundColor Red }

Write-Host ""
Write-Blue "========================================"
Write-Blue "PRD Generator - Installation"
Write-Blue "========================================"
Write-Host ""

# Create .claude directory
Write-Blue "Creating project structure..."
Write-Host ""

New-Item -ItemType Directory -Path ".claude\agents" -Force | Out-Null
Write-Green "✓ Created .claude\agents\"

New-Item -ItemType Directory -Path ".pdr" -Force | Out-Null
Write-Green "✓ Created .pdr\"

# Download agent from GitHub
Write-Blue "Downloading PRD Generator agent..."
$agentUrl = "https://raw.githubusercontent.com/jandonaire-iarvix/prd-generator/main/.claude/instructions.md"
try {
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($agentUrl, ".\.claude\instructions.md")
    Write-Green "✓ Agent installed in .claude\instructions.md"

    # Also copy to agents folder
    Copy-Item ".\.claude\instructions.md" ".\.claude\agents\prd-generator.md" -Force
    Write-Green "✓ Agent also available in .claude\agents\prd-generator.md"
} catch {
    Write-Red "✗ Failed to download agent. Check your internet connection."
    exit 1
}

# Create example PRD
@"
# Ejemplo: Sistema de Gestión de Leads

Este es un ejemplo de cómo se ve un PRD generado.

## 1. Problema

Tu equipo de ventas pierde contactos. Los emails se mezclan, no saben quién respondió, y pierdes oportunidades.

## 2. Solución propuesta

Un sistema que:
- Reciba información de clientes
- Guarde todo en un lugar
- Muestre quién respondió
- Ayude a tu equipo a darle seguimiento

## 3. Usuarios del sistema

**Primarios:** Equipo de ventas (5-10 personas)
**Secundarios:** Administrador (maneja la configuración)

## 4. Flujo del sistema

1. Cliente envía email o llama
2. Tu equipo ingresa la información
3. Sistema guarda los datos
4. Sistema muestra historia del cliente
5. Equipo da seguimiento

## 5. Funcionalidades principales

- Registrar nuevos leads
- Ver historial de comunicación
- Actualizar estado del lead
- Ver reportes de conversión
- Asignar leads a vendedores

## 6. Tipo de arquitectura

**Aplicación web simple:** Usuario → Interfaz Web → Backend → Base de datos

## 7. Complejidad

**Media:** Necesita BD, backend, y interfaz web.

## 8. MVP (Versión mínima para empezar)

1. Crear leads
2. Ver lista de leads
3. Actualizar estado
4. Ver comunicaciones de cada lead

---

Para más información: https://www.youtube.com/@jose.andonaire
"@ | Out-File -FilePath ".pdr\EJEMPLO-PRD.md" -Encoding UTF8
Write-Green "✓ Created example PRD"

# Create CHANGELOG
@"
# Changelog - PRD Generator

## Historial

### v1 - [Initial]
- Versión inicial del sistema
"@ | Out-File -FilePath ".pdr\CHANGELOG.md" -Encoding UTF8
Write-Green "✓ Created CHANGELOG.md"

# Create VALIDACIONES
@"
# Registro de Validaciones y Revisiones

Cada vez que revises o diagnostiques tu proyecto, agrega una entrada aquí.

### [Inicio]
Sistema creado y listo para usar.
"@ | Out-File -FilePath ".pdr\VALIDACIONES.md" -Encoding UTF8
Write-Green "✓ Created VALIDACIONES.md"

# Create .gitignore if it doesn't exist
if (-Not (Test-Path ".gitignore")) {
    @"
# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Node
node_modules/
package-lock.json
yarn.lock

# Python
__pycache__/
*.py[cod]
.venv/
venv/

# Local config
.env.local
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
    Write-Green "✓ Created .gitignore"
}

Write-Host ""
Write-Green "========================================"
Write-Green "✅ Installation complete!"
Write-Green "========================================"
Write-Host ""
Write-Blue "Your PRD Generator is ready!"
Write-Host ""
Write-Yellow "Next steps:"
Write-Host ""
Write-Host "1. Open this folder in Claude Code:"
Write-Host "   code ." -ForegroundColor Cyan
Write-Host ""
Write-Host "2. In Claude Code, start creating your PRD:"
Write-Host "   Crear un PRD" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Or any of these commands:"
Write-Host "   Revisar mi PRD" -ForegroundColor Cyan
Write-Host "   Actualizar mi PRD" -ForegroundColor Cyan
Write-Host "   Validar alineación" -ForegroundColor Cyan
Write-Host "   Diagnosticar proyecto" -ForegroundColor Cyan
Write-Host ""
Write-Yellow "Your PRD files will be saved in: .pdr\"
Write-Host ""
Write-Blue "More info:"
Write-Host "📺 YouTube: https://www.youtube.com/@jose.andonaire"
Write-Host "📸 Instagram: https://www.instagram.com/jose.andonaireac/"
Write-Host ""
