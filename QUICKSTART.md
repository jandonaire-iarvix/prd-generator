# Quick Start - 5 minutos para tu primer PRD

## 1. Clonar y configurar (2 min)

**Windows (PowerShell):**
```powershell
git clone https://github.com/jose-andonaire/prd-generator.git
cd prd-generator
.\setup.ps1
```

**Mac/Linux (Bash):**
```bash
git clone https://github.com/jose-andonaire/prd-generator.git
cd prd-generator
bash setup.sh
```

✅ Listo. Ahora tienes:
- `.claude/` con el agente
- `.pdr/` para guardar versiones
- Ejemplos y configuración

## 2. Abre Claude Code (1 min)

```bash
code .
```

Luego abre Claude Code en el editor VS Code.

## 3. Crea tu primer PRD (2 min)

En Claude Code, escribe:

```
/pdr-generador crear
```

Responde 5 preguntas (detalladamente):

1. **¿Qué quieres construir?**
   - Sé específico: "Un CRM para mi equipo de ventas" (no solo "una app")

2. **¿Qué problema resuelves?**
   - Ejemplo: "Mi equipo pierde leads porque no hay lugar central"

3. **¿Quién lo usa?**
   - Ejemplo: "Mi equipo de 5 vendedores, pocos skills técnicos"

4. **¿Cuál es el flujo?**
   - Ejemplo: "1. Cliente llama, 2. Se registra, 3. Se asigna vendedor, 4. Se da seguimiento"

5. **¿Es correcto?**
   - Responde "Sí" o "No, me falta..."

**Boom.** Tu PRD está listo en `/.pdr/PRD.v1.md`

---

## 4. Verifica los archivos generados

En la carpeta `.pdr/` encontrarás:

```
.pdr/
├── PRD.v1.md              ← Tu documento
├── diagrama-v1.mmd        ← Arquitectura
├── schema-v1.sql          ← Base de datos
└── EJEMPLO-PRD.md         ← Para inspirarte
```

Abre `PRD.v1.md` y verás:
- Problema explicado
- Solución propuesta
- Arquitectura
- Base de datos con diagrama
- SQL para crear tablas
- MVP recomendado
- Tus redes sociales al final

---

## 5. Próximos pasos

### Semana 1-2: Construye
- Crea tu backend/frontend
- Usa el SQL como base
- Sigue el MVP del PRD

### Semana 3: Revisa
```
/pdr-generador revisar
```
Cuéntale qué construiste. Te dirá si estás alineado.

### Si cambió algo importante
```
/pdr-generador actualizar
```
Genera PRD v2 automáticamente.

---

## Comandos del agente

```
/pdr-generador crear              ← Nuevo PRD (5 preguntas)
/pdr-generador revisar            ← Validar alineación
/pdr-generador actualizar         ← Recalcular si cambiaste BD/arquitectura
/pdr-generador validar-alineacion ← Análisis detallado
/pdr-generador diagnosticar       ← Estado general del proyecto
```

---

## Estructura de archivos final

Después de todo:

```
tu-proyecto-pdr/
├── .claude/
│   └── agents/
│       └── prd-generator.md      ← Instrucciones del agente
├── .pdr/
│   ├── PRD.v1.md                 ← Tu documento
│   ├── PRD.current.md            ← Versión activa
│   ├── diagrama-v1.mmd
│   ├── schema-v1.sql
│   ├── CHANGELOG.md              ← Historial de cambios
│   └── VALIDACIONES.md           ← Log de revisiones
├── .gitignore
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── setup.sh
└── docs/
    ├── guia-uso.md
    └── faq.md
```

Todo listo para GitHub.

---

## Próxima sesión: Push a GitHub

```bash
# Inicializa git (si aún no lo hiciste)
git init

# Agrega archivos
git add .

# Commit inicial
git commit -m "Initial commit: PRD Generator with first PRD"

# Agrega remote y push
git remote add origin https://github.com/TU_USUARIO/pdr-generator.git
git branch -M main
git push -u origin main
```

---

## 📚 Documentación

- **README.md** — Descripción del proyecto
- **CONTRIBUTING.md** — Cómo contribuir
- **docs/guia-uso.md** — Guía detallada
- **docs/faq.md** — Preguntas frecuentes
- **.pdr/EJEMPLO-PRD.md** — Caso de uso real

---

## 🔗 Redes

📺 **YouTube:** https://www.youtube.com/@jose.andonaire  
📸 **Instagram:** https://www.instagram.com/jose.andonaireac/  
💼 **LinkedIn:** https://www.linkedin.com/in/automatizacion-para-empresas/

---

¿Listo? **Adelante.** 🚀

```
/pdr-generador crear
```

¡Tu primer PRD está a 5 minutos!
