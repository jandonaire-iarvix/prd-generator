# PRD Generator Skill - Guía Completa

## ¿Qué es?

**prd-generator** es una skill profesional para Claude Code que guía conversacionalmente la creación de Documentos de Requerimientos (PRDs) de alta calidad.

Transforma ideas vagas en documentos claros, bien estructurados, con arquitectura, base de datos y MVP definidos.

## Instalación

1. **Descargar** `prd-generator.skill` desde [GitHub](https://github.com/jandonaire-iarvix/prd-generator)
2. **En Claude Code:**
   - Ir a Skills → Install Skill → Upload File
   - Seleccionar `prd-generator.skill`
3. **Listo!** La skill está disponible

## Uso - 5 Comandos

### 1. `/pdr crear` - Crear PRD desde cero

**Para:** Proyectos nuevos o ideas que necesitan documentación

**Proceso:**
1. La skill pregunta 5 preguntas estratégicas (idea, problema, usuarios, flujo, validación)
2. Genera PRD.v1.md completo con 13 secciones
3. Crea diagrama de arquitectura (Mermaid)
4. Genera SQL schema base

**Ejemplo:**
```
/pdr crear

Skill: ¿Qué quieres construir?
Tú: Un CRM para pequeños equipos de ventas

Skill: ¿Qué problema resuelves?
Tú: Actualmente usan Excel y pierden información

[... continúa con 3 preguntas más ...]

Skill: Si entiendo bien, estás construyendo...
Tú: Sí, eso es correcto

Skill: ✅ Generando PRD.v1.md completo...
```

**Salida:**
```
.pdr/
├── PRD.v1.md              ← Tu documento principal
├── PRD.current.md         ← Copia activa
├── diagrama-v1.mmd        ← Arquitectura visual
└── schema-v1.sql          ← Tablas SQL
```

### 2. `/pdr revisar` - Revisar alineación

**Para:** Validar si tu implementación sigue el PRD original

**Proceso:**
1. Carga el PRD existente
2. Pregunta qué has construido
3. Compara contra el PRD original
4. Genera reporte de alineación

**Ejemplo:**
```
/pdr revisar

Skill: Cargué tu PRD.v1. ¿Qué has implementado?
Tú: Tengo tablas de usuarios y leads, API REST básica...

Skill: Analizando alineación...

Salida:
✅ 85% alineado
✅ BD respeta estructura del PRD
⚠️ Agregaste campo 'source' (no documentado)
⚠️ Usas PostgreSQL en lugar de MongoDB
```

**Salida:**
```
.pdr/VALIDACIONES.md       ← Reporte de alineación
```

### 3. `/pdr actualizar` - Actualizar a nueva versión

**Para:** Cuando cambias arquitectura, agregás features o descubres nuevos requerimientos

**Proceso:**
1. Carga PRD actual
2. Pregunta qué cambió
3. Valida si cambios son definitivos
4. Regenera PRD.v2 con changelog

**Ejemplo:**
```
/pdr actualizar

Skill: ¿Qué cambió en tu proyecto?
Tú: Ahora necesitamos multi-tenant, email notifications, dashboard...

Skill: ¿Estos cambios afectan el objetivo?
Tú: Sí, el sistema crece

Skill: Actualizando a PRD.v2...
```

**Salida:**
```
.pdr/
├── PRD.v2.md              ← Nueva versión
├── PRD.current.md         ← Actualizado
├── diagrama-v2.mmd        ← Nueva arquitectura
├── schema-v2.sql          ← Nuevas tablas
└── CHANGELOG.md           ← Cambios documentados
```

### 4. `/pdr validar` - Análisis profundo de desviaciones

**Para:** Entender en detalle qué está 100%, 50%, o 0% completado

**Proceso:**
1. Carga PRD
2. Pregunta estado detallado de cada componente
3. Mapea features: completadas, parciales, faltantes
4. Genera análisis de riesgos

**Ejemplo:**
```
/pdr validar

Skill: Cuéntame qué implementaste en detalle
Tú: Feature 1 = 100% lista, Feature 2 = 60% (falta X), Feature 3 = 0%...

Salida:
- [x] Feature 1: 100% completada
- [~] Feature 2: 60% completada
- [ ] Feature 3: No iniciada
- [+] Feature 4: Agregada sin PRD
```

**Salida:**
```
.pdr/VALIDACIONES.md       ← Análisis detallado
```

### 5. `/pdr diagnosticar` - Estado general del proyecto

**Para:** Revisar MVP completitud, riesgos técnicos, deuda técnica

**Proceso:**
1. Carga PRD
2. Preguntas sobre estado actual
3. Analiza: MVP progress, riesgos, deuda técnica
4. Genera recomendaciones priorizadas

**Ejemplo:**
```
/pdr diagnosticar

Skill: ¿Cuál es el estado actual?
Tú: MVP 60% completado, hay un problema con...

Salida:
MVP Progress: 60%
Riesgos técnicos:
  🔴 CRÍTICO: Autenticación no implementada
  🟡 MEDIO: Sin indexes en BD
  🟢 BAJO: Documentación incompleta

Próximos pasos:
  1. Implementar autenticación
  2. Agregar indexes
  3. Escribir tests
```

**Salida:**
```
.pdr/DIAGNOSTICO.md        ← Reporte de salud
```

---

## Estructura de archivos generada

La skill automáticamente crea y gestiona esta estructura:

```
tu-proyecto/
├── .pdr/
│   ├── PRD.v1.md              ← Primera versión
│   ├── PRD.v2.md              ← Segunda versión (si aplica)
│   ├── PRD.current.md         ← Versión activa (siempre leer esta)
│   ├── diagrama-v1.mmd        ← Diagrama arquitectura v1
│   ├── diagrama-v2.mmd        ← Diagrama arquitectura v2
│   ├── schema-v1.sql          ← Schema BD v1
│   ├── schema-v2.sql          ← Schema BD v2
│   ├── CHANGELOG.md           ← Historial de cambios
│   ├── VALIDACIONES.md        ← Reportes de alineación
│   └── DIAGNOSTICO.md         ← Análisis de salud
```

---

## Características principales

### 🎯 Conversacional y pedagógica
- No genera documentos genéricos
- Hace preguntas específicas
- Explica en lenguaje simple
- Resume antes de generar

### 📊 Versionado automático
- Rastrea cambios entre versiones
- Genera CHANGELOG automáticamente
- Mantiene historial completo

### 🏗️ Generación profesional
- PRDs con 13 secciones completas
- Diagramas Mermaid (arquitectura, ERD, flujo)
- SQL con índices y constraints
- Explicaciones pedagógicas para no-técnicos

### 🔍 Auditoría inteligente
- Detecta desviaciones del PRD
- Estima alineación en porcentaje
- Identifica riesgos técnicos

---

## Flujo típico de proyecto

### Semana 1: Crear PRD
```
/pdr crear
→ Responde 5 preguntas
→ Genera PRD.v1.md
```

### Semanas 2-4: Implementar
Desarrolla tu sistema siguiendo el PRD

### Semana 5: Revisar
```
/pdr revisar
→ Cuéntale qué hiciste
→ Obtén reporte de alineación
```

### Semana 6: Ajustar (si necesario)
```
/pdr actualizar
→ Describe cambios
→ Genera PRD.v2 + CHANGELOG
```

### Semana 7-8: Validar
```
/pdr validar
→ Análisis detallado de estado
→ Recomendaciones de próximos pasos
```

---

## Tips y mejores prácticas

### ✅ Haz bien
- Sé específico en tus descripciones
- Valida el entendimiento de la skill
- Mantén PRD.current.md actualizado
- Revisa alineación regularmente

### ❌ Evita
- Cambiar PRD sin documentar en CHANGELOG
- Agregar features sin actualizar versión
- Ignorar desviaciones detectadas

### 🚀 Para máxima efectividad
1. Crea PRD ANTES de codificar
2. Revisa alineación cada 2 semanas
3. Actualiza PRD cuando cambies arquitectura
4. Usa CHANGELOG como documentación de decisiones

---

## Formato de salidas

### PRD Sections
Cada PRD incluye:
1. Problema
2. Solución propuesta
3. Usuarios del sistema
4. Flujo del sistema
5. Funcionalidades principales
6. Tipo de arquitectura
7. Tipo de tenancy
8. Diagrama de arquitectura
9. Diseño de base de datos
10. SQL base
11. Nivel de complejidad
12. Recomendación de MVP
13. Explicación pedagógica

### Diagramas (Mermaid)
- **Arquitectura:** flowchart LR (usuario → API → BD)
- **BD:** erDiagram (relaciones entre tablas)
- **Flujo:** flowchart TD (paso a paso del usuario)

### SQL
- CREATE TABLE con constraints
- Foreign keys documentadas
- Índices para performance

---

## Soporte

Para preguntas o mejoras:
- 📺 [YouTube](https://www.youtube.com/@jose.andonaire)
- 📸 [Instagram](https://www.instagram.com/jose.andonaireac/)
- 💼 [LinkedIn](https://www.linkedin.com/in/automatizacion-para-empresas/)

---

Creado por Jose Andonaire para ayudar constructores a pensar y estructurar mejor.

¡Adelante! 🚀
