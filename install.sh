#!/bin/bash

# PRD Generator - One-command installer
# Usage: bash <(curl -s https://raw.githubusercontent.com/jandonaire-iarvix/pdr-generator/main/install.sh)

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}PRD Generator - Installation${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if in a valid directory
if [ ! -d ".git" ] && [ ! -f "package.json" ] && [ ! -f "pyproject.toml" ] && [ ! -f "go.mod" ]; then
    echo -e "${YELLOW}⚠️  Note: This doesn't look like a project directory${NC}"
    echo -e "${YELLOW}Continue anyway? (y/n)${NC}"
    read -r response
    if [ "$response" != "y" ]; then
        echo -e "${RED}Installation cancelled${NC}"
        exit 1
    fi
fi

echo -e "${BLUE}Creating project structure...${NC}"
echo ""

# Create .claude directory
mkdir -p ".claude/agents"
echo -e "${GREEN}✓${NC} Created .claude/agents/"

# Create .pdr directory
mkdir -p ".pdr"
echo -e "${GREEN}✓${NC} Created .pdr/"

# Download agent from GitHub
echo -e "${BLUE}Downloading PRD Generator agent...${NC}"
curl -s -o ".claude/instructions.md" \
    "https://raw.githubusercontent.com/jandonaire-iarvix/prd-generator/main/.claude/instructions.md"
echo -e "${GREEN}✓${NC} Agent installed in .claude/instructions.md"

# Also copy to agents folder for compatibility
cp ".claude/instructions.md" ".claude/agents/prd-generator.md"
echo -e "${GREEN}✓${NC} Agent also available in .claude/agents/prd-generator.md"

# Create example PRD
cat > ".pdr/EJEMPLO-PRD.md" << 'EOF'
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
EOF
echo -e "${GREEN}✓${NC} Created example PRD"

# Create CHANGELOG
cat > ".pdr/CHANGELOG.md" << 'EOF'
# Changelog - PRD Generator

## Historial

### v1 - [Initial]
- Versión inicial del sistema
EOF
echo -e "${GREEN}✓${NC} Created CHANGELOG.md"

# Create VALIDACIONES
cat > ".pdr/VALIDACIONES.md" << 'EOF'
# Registro de Validaciones y Revisiones

Cada vez que revises o diagnostiques tu proyecto, agrega una entrada aquí.

### [Inicio]
Sistema creado y listo para usar.
EOF
echo -e "${GREEN}✓${NC} Created VALIDACIONES.md"

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    cat > ".gitignore" << 'EOF'
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
EOF
    echo -e "${GREEN}✓${NC} Created .gitignore"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✅ Installation complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Your PRD Generator is ready!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo ""
echo "1. Open this folder in Claude Code:"
echo -e "   ${BLUE}code .${NC}"
echo ""
echo "2. In Claude Code, start creating your PRD:"
echo -e "   ${BLUE}Crear un PRD${NC}"
echo ""
echo "3. Or any of these commands:"
echo -e "   ${BLUE}Revisar mi PRD${NC}"
echo -e "   ${BLUE}Actualizar mi PRD${NC}"
echo -e "   ${BLUE}Validar alineación${NC}"
echo -e "   ${BLUE}Diagnosticar proyecto${NC}"
echo ""
echo -e "${YELLOW}Your PRD files will be saved in: .pdr/${NC}"
echo ""
echo -e "${BLUE}More info:${NC}"
echo "📺 YouTube: https://www.youtube.com/@jose.andonaire"
echo "📸 Instagram: https://www.instagram.com/jose.andonaireac/"
echo ""
