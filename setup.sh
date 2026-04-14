#!/bin/bash

# PRD Generator - Setup Script
# Este script configura el agente automáticamente en tu proyecto

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}PRD Generator - Setup${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "README.md" ]; then
    echo -e "${RED}❌ Error: Ejecuta este script desde la raíz del repositorio${NC}"
    exit 1
fi

echo -e "${YELLOW}📦 Configurando PRD Generator...${NC}"
echo ""

# 1. Crear carpeta .claude si no existe
if [ ! -d ".claude" ]; then
    echo -e "${BLUE}✓ Creando carpeta .claude${NC}"
    mkdir -p .claude/agents
else
    echo -e "${BLUE}✓ Carpeta .claude ya existe${NC}"
fi

# 2. Crear carpeta .pdr para versionado
if [ ! -d ".pdr" ]; then
    echo -e "${BLUE}✓ Creando carpeta .pdr (para versiones de PRD)${NC}"
    mkdir -p .pdr
else
    echo -e "${BLUE}✓ Carpeta .pdr ya existe${NC}"
fi

# 3. Crear .gitignore si no existe
if [ ! -f ".gitignore" ]; then
    echo -e "${BLUE}✓ Creando .gitignore${NC}"
    cat > .gitignore << 'EOF'
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
EOF
    echo -e "${GREEN}✓ .gitignore creado${NC}"
else
    echo -e "${BLUE}ℹ .gitignore ya existe${NC}"
fi

# 4. Crear archivo de ejemplo de PRD
if [ ! -f ".pdr/EJEMPLO-PRD.md" ]; then
    echo -e "${BLUE}✓ Creando ejemplo de PRD${NC}"
    cat > .pdr/EJEMPLO-PRD.md << 'EOF'
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
EOF
    echo -e "${GREEN}✓ Ejemplo creado en .pdr/EJEMPLO-PRD.md${NC}"
else
    echo -e "${BLUE}ℹ Ejemplo ya existe${NC}"
fi

# 5. Crear archivo CHANGELOG
if [ ! -f ".pdr/CHANGELOG.md" ]; then
    echo -e "${BLUE}✓ Creando CHANGELOG.md${NC}"
    cat > .pdr/CHANGELOG.md << 'EOF'
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
EOF
    echo -e "${GREEN}✓ CHANGELOG creado${NC}"
else
    echo -e "${BLUE}ℹ CHANGELOG ya existe${NC}"
fi

# 6. Crear archivo de validaciones
if [ ! -f ".pdr/VALIDACIONES.md" ]; then
    echo -e "${BLUE}✓ Creando VALIDACIONES.md${NC}"
    cat > .pdr/VALIDACIONES.md << 'EOF'
# Registro de Validaciones y Revisiones

Cada vez que uses `/pdr-generador revisar` o `/pdr-generador diagnosticar`, agrega una entrada aquí.

## Formato

```
### [Fecha] - /pdr-generador revisar
**Alineación:** 85%
**Desviaciones:**
- Cambio 1
- Cambio 2
**Decisión:** Seguir como está / Actualizar a v2
```

---

## Registro

### [2026-04-14] - Inicial
Sistema creado, awaiting first review.
EOF
    echo -e "${GREEN}✓ VALIDACIONES creado${NC}"
else
    echo -e "${BLUE}ℹ VALIDACIONES ya existe${NC}"
fi

# 7. Verificar que el archivo del agente existe
if [ ! -f ".claude/agents/prd-generator.md" ]; then
    echo -e "${RED}⚠️  Advertencia: .claude/agents/prd-generator.md no encontrado${NC}"
    echo -e "${YELLOW}   Asegúrate de que esté en el repositorio${NC}"
else
    echo -e "${GREEN}✓ Agente PRD Generator encontrado${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Setup completado${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Próximos pasos:${NC}"
echo ""
echo "1. Abre Claude Code en tu proyecto:"
echo -e "   ${YELLOW}cd tu-proyecto-pdr${NC}"
echo ""
echo "2. Usa el agente para crear tu primer PRD:"
echo -e "   ${YELLOW}/pdr-generador crear${NC}"
echo ""
echo "3. Sigue las preguntas del agente"
echo ""
echo -e "${BLUE}Más información:${NC}"
echo "📖 Lee: README.md"
echo "📺 YouTube: https://www.youtube.com/@jose.andonaire"
echo "📸 Instagram: https://www.instagram.com/jose.andonaireac/"
echo ""
