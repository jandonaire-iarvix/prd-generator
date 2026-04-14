# PRD Generator - Setup Script para PowerShell
# Ejecuta: .\setup.ps1

Write-Host "========================================" -ForegroundColor Blue
Write-Host "PRD Generator - Setup" -ForegroundColor Blue
Write-Host "========================================" -ForegroundColor Blue
Write-Host ""

# Verificar que estamos en el directorio correcto
if (-Not (Test-Path "README.md")) {
    Write-Host "❌ Error: Ejecuta este script desde la raíz del repositorio" -ForegroundColor Red
    exit 1
}

Write-Host "📦 Configurando PRD Generator..." -ForegroundColor Yellow
Write-Host ""

# 1. Crear carpeta .claude si no existe
if (-Not (Test-Path ".claude\agents")) {
    Write-Host "✓ Creando carpeta .claude\agents" -ForegroundColor Blue
    New-Item -ItemType Directory -Path ".claude\agents" -Force | Out-Null
} else {
    Write-Host "✓ Carpeta .claude\agents ya existe" -ForegroundColor Blue
}

# 2. Crear carpeta .pdr
if (-Not (Test-Path ".pdr")) {
    Write-Host "✓ Creando carpeta .pdr (para versiones de PRD)" -ForegroundColor Blue
    New-Item -ItemType Directory -Path ".pdr" -Force | Out-Null
} else {
    Write-Host "✓ Carpeta .pdr ya existe" -ForegroundColor Blue
}

# 3. Crear .gitignore si no existe
if (-Not (Test-Path ".gitignore")) {
    Write-Host "✓ Creando .gitignore" -ForegroundColor Blue
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

# Node (si usas Node.js)
node_modules/
package-lock.json
yarn.lock

# Python (si usas Python)
__pycache__/
*.py[cod]
*.egg-info/
.venv/
venv/

# Archivos locales
.env.local
.env.*.local

# Documentación local
docs/local/
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
    Write-Host "✓ .gitignore creado" -ForegroundColor Green
} else {
    Write-Host "ℹ .gitignore ya existe" -ForegroundColor Blue
}

# 4. Crear ejemplo de PRD
if (-Not (Test-Path ".pdr\EJEMPLO-PRD.md")) {
    Write-Host "✓ Creando ejemplo de PRD" -ForegroundColor Blue
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

## 7. Base de datos

Necesitamos 3 tablas:

**leads:** Información de clientes
- id (identificador único)
- nombre
- email
- teléfono
- estado (nuevo, contactado, interesado, cerrado)
- fecha de creación

**usuarios:** Tu equipo
- id
- nombre
- email
- rol

**comunicaciones:** Registro de cada email/llamada
- id
- lead_id
- usuario_id
- tipo (email/llamada)
- contenido
- fecha

## 8. Complejidad

**Media:** Necesita BD, backend, y interfaz web. No es super compleja pero tampoco trivial.

## 9. MVP (Versión mínima para empezar)

1. Crear leads
2. Ver lista de leads
3. Actualizar estado
4. Ver comunicaciones de cada lead

Después agregas: reportes, asignación, notificaciones.

---

Para más información: https://www.youtube.com/@jose.andonaire
"@ | Out-File -FilePath ".pdr\EJEMPLO-PRD.md" -Encoding UTF8
    Write-Host "✓ Ejemplo creado en .pdr\EJEMPLO-PRD.md" -ForegroundColor Green
} else {
    Write-Host "ℹ Ejemplo ya existe" -ForegroundColor Blue
}

# 5. Crear CHANGELOG
if (-Not (Test-Path ".pdr\CHANGELOG.md")) {
    Write-Host "✓ Creando CHANGELOG.md" -ForegroundColor Blue
    @"
# Changelog - PRD Generator

## Formato

Cada vez que uses `/pdr-generador actualizar`, agrega una entrada aquí.

Ejemplo:

### v2 - [2026-04-15]
- **Base de datos:** Migramos de MongoDB a PostgreSQL
- **Nuevas tablas:** events, audit_logs
- **Features nuevas:** Dashboard de analytics
- **Features removidas:** Exportar a Excel
- **Razón:** Mejor performance y compliance

---

## Historial

### v1 - [2026-04-14]
- Versión inicial del sistema
"@ | Out-File -FilePath ".pdr\CHANGELOG.md" -Encoding UTF8
    Write-Host "✓ CHANGELOG creado" -ForegroundColor Green
} else {
    Write-Host "ℹ CHANGELOG ya existe" -ForegroundColor Blue
}

# 6. Crear VALIDACIONES
if (-Not (Test-Path ".pdr\VALIDACIONES.md")) {
    Write-Host "✓ Creando VALIDACIONES.md" -ForegroundColor Blue
    @"
# Registro de Validaciones y Revisiones

Cada vez que uses `/pdr-generador revisar` o `/pdr-generador diagnosticar`, agrega una entrada aquí.

## Formato

\`\`\`
### [Fecha] - /pdr-generador revisar
**Alineación:** 85%
**Desviaciones:**
- Cambio 1
- Cambio 2
**Decisión:** Seguir como está / Actualizar a v2
\`\`\`

---

## Registro

### [2026-04-14] - Inicial
Sistema creado, awaiting first review.
"@ | Out-File -FilePath ".pdr\VALIDACIONES.md" -Encoding UTF8
    Write-Host "✓ VALIDACIONES creado" -ForegroundColor Green
} else {
    Write-Host "ℹ VALIDACIONES ya existe" -ForegroundColor Blue
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✅ Setup completado" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Próximos pasos:" -ForegroundColor Blue
Write-Host ""
Write-Host "1. En Claude Code, usa el agente:" -ForegroundColor Cyan
Write-Host "   /pdr-generador crear" -ForegroundColor Yellow
Write-Host ""
Write-Host "2. Responde las 5 preguntas del agente" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Tu primer PRD estará en .pdr/PRD.v1.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "Más información:" -ForegroundColor Blue
Write-Host "📖 Lee: README.md" -ForegroundColor Cyan
Write-Host "📺 YouTube: https://www.youtube.com/@jose.andonaire" -ForegroundColor Cyan
Write-Host "📸 Instagram: https://www.instagram.com/jose.andonaireac/" -ForegroundColor Cyan
Write-Host ""
