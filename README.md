# PRD Generator - Agente Generador de Documentos de Requerimientos

Un agente profesional de arquitectura que transforma ideas en documentos estructurados de requerimientos (PRDs), diagramas y esquemas de base de datos.

## ¿Qué es?

**PRD Generator** es un asistente técnico integrado en Claude Code que te guía paso a paso para:

- ✅ Estructurar tu idea en un documento claro
- ✅ Generar diagrama de arquitectura
- ✅ Diseñar base de datos (diagrama + SQL)
- ✅ Definir tipo de tenancy (single/multi-tenant)
- ✅ Proponer MVP
- ✅ Validar alineación durante el desarrollo
- ✅ Actualizar documentación cuando algo cambia

## Instalación

### Opción 1: Instalación automática (recomendado)

```bash
git clone https://github.com/tu-usuario/prd-generator.git
cd prd-generator
bash setup.sh
```

### Opción 2: Instalación manual

1. Clona este repositorio
2. Copia la carpeta `.claude/` a tu directorio de proyecto
3. Abre Claude Code en tu proyecto
4. El Skill `/prd-generador` estará disponible

## Uso

### Crear un PRD nuevo

```
/pdr-generador crear
```

El agente hará 5 preguntas estratégicas y generará un PRD completo.

### Revisar alineación durante desarrollo

```
/pdr-generador revisar
```

Valida que tu implementación siga el PRD original. Detecta desviaciones.

### Actualizar PRD cuando cambia algo

```
/pdr-generador actualizar
```

Si cambió tu base de datos, arquitectura o features, el agente regenera:
- PRD v2
- Diagramas
- SQL actualizado
- Changelog

### Validar alineación con PRD

```
/pdr-generador validar-alineacion
```

Análisis detallado: ¿qué se salió del scope? ¿qué cambió?

### Diagnosticar estado del proyecto

```
/pdr-generador diagnosticar
```

Análisis profundo:
- ¿Dónde estás del MVP?
- ¿Qué falta?
- ¿Riesgos técnicos?

## Estructura de archivos

```
tu-proyecto/
├── .pdr/                 (Generado automáticamente)
│   ├── PRD.v1.md
│   ├── PRD.v2.md
│   ├── PRD.current.md    (Versión activa)
│   ├── diagrama-v1.mmd
│   ├── diagrama-v2.mmd
│   ├── schema-v1.sql
│   └── schema-v2.sql
├── .claude/
│   └── agents/
│       └── prd-generator.md
└── README.md
```

## Ejemplo de uso

### Paso 1: Crear PRD

```
/pdr-generador crear

Agente: ¿Qué quieres construir?
Tú: Un sistema de gestión de leads para equipos de ventas

Agente: ¿Qué problema estás intentando resolver?
Tú: Mi equipo pierde leads en emails, no sabe quién respondió...

... (5 preguntas)

Agente: Entendí bien. Aquí está tu PRD.
```

### Paso 2: Revisar durante desarrollo (semana 3)

```
/pdr-generador revisar

Agente: ¿Qué has construido hasta ahora?
Tú: La API de leads, registración de usuarios, pero cambié la BD...

Agente: Detecté 2 cambios. ¿Fueron intencionales?
```

### Paso 3: Actualizar PRD (semana 4)

```
/pdr-generador actualizar

Agente: ¿Qué cambió?
Tú: Ahora uso PostgreSQL en lugar de MongoDB, y agregué tabla de eventos...

Agente: Generado: PRD.v2.md (con changelog)
```

## Documentación

- **[Guía completa](docs/guia-uso.md)** — Explicación detallada de cada comando
- **[Ejemplo de PRD](ejemplos/prd-ejemplo.md)** — Caso de uso real
- **[FAQ](docs/faq.md)** — Preguntas frecuentes

## Filosofía

Este agente no busca perfección inmediata.

Busca que **pienses con claridad** antes de codificar.

- ¿Qué problema resuelvo?
- ¿Quién lo usa?
- ¿Cómo fluye?
- ¿Qué arquitectura necesito?

Una vez responden estas preguntas, constructores técnicos pueden trabajar con claridad.

## Para más información

**YouTube:** https://www.youtube.com/@jose.andonaire  
**Instagram:** https://www.instagram.com/jose.andonaireac/  
**LinkedIn:** https://www.linkedin.com/in/automatizacion-para-empresas/

---

Creado por Jose Andonaire para ayudar constructores a pensar y estructurar mejor.
