# PRD Generator - Agente Generador de Documentos de Requerimientos

Un agente profesional de arquitectura que transforma ideas en documentos estructurados de requerimientos (PRDs), diagramas y esquemas de base de datos.

## Instalacion - Un solo comando

### Opcion 1: Command-line install (recomendado)

**Windows (PowerShell):**
```powershell
(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/jandonaire-iarvix/prd-generator/main/install.ps1','install.ps1'); .\install.ps1
```

**Mac/Linux (Bash):**
```bash
bash <(curl -s https://raw.githubusercontent.com/jandonaire-iarvix/prd-generator/main/install.sh)
```

**Listo!** El agente se instala automaticamente en tu proyecto.

### Opcion 2: Clonar repositorio completo

Si prefieres tener toda la documentacion y ejemplos:

```bash
git clone https://github.com/jandonaire-iarvix/prd-generator.git
cd prd-generator
./setup.sh  # o .\setup.ps1 en Windows
```

---

## Que es?

**PRD Generator** es un asistente tecnico integrado en Claude Code que te guia paso a paso para:

- Estructurar tu idea en un documento claro
- Generar diagrama de arquitectura
- Disenar base de datos (diagrama + SQL)
- Definir tipo de tenancy (single/multi-tenant)
- Proponer MVP
- Validar alineacion durante el desarrollo
- Actualizar documentacion cuando algo cambia

## Uso en Claude Code

Una vez abierto en Claude Code, simplemente escribe en el chat:

### Crear un PRD nuevo

```
Crear un PRD
```

o

```
Quiero crear un PRD para mi proyecto
```

El agente hara 5 preguntas estrategicas y generara un PRD completo en `.pdr/PRD.v1.md`

### Revisar alineacion durante desarrollo

```
Revisar mi PRD
```

Valida que tu implementacion siga el PRD original. Detecta desviaciones.

### Actualizar PRD cuando cambia algo

```
Actualizar mi PRD
```

Si cambio tu base de datos, arquitectura o features, el agente regenera v2 con changelog.

### Validar alineacion con PRD

```
Validar alineacion de mi proyecto
```

Analisis detallado de desviaciones y scope.

### Diagnosticar estado del proyecto

```
Diagnosticar mi proyecto
```

Analisis: MVP, que falta, riesgos tecnicos.

## Estructura de archivos

```
tu-proyecto/
├── .claude/
│   ├── instructions.md          (El agente)
│   └── agents/
│       └── prd-generator.md     (Copia alternativa)
│
├── .pdr/
│   ├── PRD.v1.md               (Tu PRD generado)
│   ├── PRD.current.md          (Version activa)
│   ├── diagrama-v1.mmd         (Diagramas)
│   ├── schema-v1.sql           (BD generada)
│   ├── CHANGELOG.md            (Historial)
│   └── VALIDACIONES.md         (Log de revisiones)
```

## Documentacion

- **[INSTALL.md](INSTALL.md)** - Diferentes formas de instalar
- **[QUICKSTART.md](QUICKSTART.md)** - 5 minutos para primer PRD
- **[docs/guia-uso.md](docs/guia-uso.md)** - Tutorial completo
- **[docs/faq.md](docs/faq.md)** - Preguntas frecuentes

## Filosofia

Este agente no busca perfeccion inmediata.

Busca que **pienses con claridad** antes de codificar.

- Que problema resuelvo?
- Quien lo usa?
- Como fluye?
- Que arquitectura necesito?

Una vez responden estas preguntas, constructores tecnicos pueden trabajar con claridad.

## Para mas informacion

YouTube: https://www.youtube.com/@jose.andonaire
Instagram: https://www.instagram.com/jose.andonaireac/
LinkedIn: https://www.linkedin.com/in/automatizacion-para-empresas/

---

Creado por Jose Andonaire para ayudar constructores a pensar y estructurar mejor.
