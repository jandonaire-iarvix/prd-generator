# Guía de Uso - PRD Generator

## Tabla de contenidos

1. [Instalación](#instalación)
2. [Primer PRD](#primer-prd)
3. [Durante el desarrollo](#durante-el-desarrollo)
4. [Actualizar PRD](#actualizar-prd)
5. [Casos comunes](#casos-comunes)
6. [Tips y trucos](#tips-y-trucos)

---

## Instalación

### Paso 1: Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/prd-generator.git tu-proyecto-pdr
cd tu-proyecto-pdr
```

### Paso 2: Ejecutar setup

```bash
bash setup.sh
```

Esto crea automáticamente:
- Carpeta `.claude/` con el agente
- Carpeta `.pdr/` para versiones
- Archivos de configuración

### Paso 3: Abre Claude Code

```bash
# En tu terminal
code .
```

Luego abre Claude Code en el editor.

---

## Primer PRD

### Paso 1: Iniciar creación

En Claude Code, escribe:

```
/pdr-generador crear
```

### Paso 2: Responder preguntas

El agente te hará 5 preguntas. **Responde con claridad y detalle:**

**P1: ¿Qué quieres construir?**
```
❌ Malo: "Una app de ventas"
✅ Bueno: "Un sistema para que mi equipo de ventas gestione 
          los leads que reciben por email, teléfono y formulario web"
```

**P2: ¿Qué problema estás resolviendo?**
```
❌ Malo: "Necesitamos mejor gestión"
✅ Bueno: "Hoy mi equipo pierde leads porque cada uno maneja 
          los emails en su cuenta personal. No saben si alguien 
          ya contactó a un cliente. Perdemos seguimiento."
```

**P3: ¿Quién usará esto?**
```
❌ Malo: "Mi equipo"
✅ Bueno: "Mi equipo de ventas (5 personas, no muy técnicas). 
          Posiblemente también algunos gerentes que quieren 
          ver reportes."
```

**P4: ¿Cuál es el flujo?**
```
❌ Malo: "El cliente llama y registramos"
✅ Bueno: "1. Cliente envía email al buzón general
           2. Alguien del equipo abre un registro
           3. Sistema envía confirmación
           4. Se asigna a un vendedor
           5. Se da seguimiento
           6. Se cierra o se archiva"
```

**P5: Validación**

El agente dirá:
> "Si entiendo bien, quieres construir [resumen]. ¿Correcto?"

Responde: "Sí" o "No, me falta agregar..."

### Paso 3: Tu PRD está listo

El agente generará:
- `.pdr/PRD.v1.md` — Tu documento completo
- `.pdr/diagrama-v1.mmd` — Diagrama de arquitectura
- `.pdr/schema-v1.sql` — Código base de BD

**Guarda el mensaje** (cópialo a un archivo si lo necesitas).

---

## Durante el desarrollo

### Semana 1-2: Construye el MVP

Implementa las características del PRD.

### Semana 3: Primera revisión

```
/pdr-generador revisar
```

Cuéntale qué implementaste:

```
"Creé:
- API de leads con Node.js
- Base de datos PostgreSQL con tabla leads y usuarios
- Interfaz web básica que permite crear y ver leads
- He completado el 60% del MVP"
```

El agente te dirá:
- ✅ Qué está bien alineado
- ⚠️ Qué cambió sin intención
- 💡 Si necesitas actualizar el PRD

### Si todo está en línea

```
"Estás 80% alineado. Sigue adelante."
```

### Si hay cambios

```
"Detecté que:
- Cambios la BD de MongoDB a PostgreSQL ✅ (buena decisión)
- Agregaste tabla de 'comunicaciones' (no estaba planeada)

¿Por qué agregaste 'comunicaciones'?"
```

**Tú respondes:** "Porque necesito registrar cada email y llamada"

**Agente:** "Tiene sentido. Sugerencia: actualicemos el PRD a v2"

---

## Actualizar PRD

### Cuándo actualizar

- ✅ Cambió la arquitectura
- ✅ Agregaste tablas a la BD
- ✅ Removiste features
- ✅ Cambiaste tipo de tenancy
- ❌ NO: pequeños bugs o refactoring

### Cómo actualizar

```
/pdr-generador actualizar
```

**El agente pregunta:** "¿Qué cambió?"

Responde en detalle:

```
"De v1 a ahora:

1. Base de datos:
   - Cambié de MongoDB a PostgreSQL
   - Agregué tabla 'comunicaciones' para registrar emails/llamadas
   - Agregué tabla 'asignaciones' para asignar leads a vendedores

2. Features:
   - Agregué: Dashboard de reportes
   - Removí: Exportar a PDF (es complejo)

3. Arquitectura:
   - Ahora tengo: Backend Node.js + Frontend React
   - Antes planeaba: Backend simple + HTML

4. Usuarios:
   - Ahora 7 personas van a usarlo (antes 5)"
```

### Tu PRD v2 está listo

Genera:
- `.pdr/PRD.v2.md` — Nueva versión
- `.pdr/CHANGELOG.md` — Qué cambió
- Nuevos diagramas y SQL

---

## Casos comunes

### Caso 1: "No estoy seguro si aún estoy alineado"

```
/pdr-generador diagnosticar
```

Esto te da un análisis profundo:
- ¿Dónde estás vs dónde deberías estar?
- ¿Qué features falta?
- ¿Hay riesgos técnicos?

### Caso 2: "Cambié algo pequeño, ¿actualizo?"

**NO necesitas actualizar v1 → v2 por:**
- Cambios en variable names
- Refactoring de código
- Bug fixes
- Pequeñas optimizaciones

**SÍ deberías actualizar por:**
- Nuevas tablas en BD
- Features nuevas no planeadas
- Cambio de arquitectura
- Cambio de tecnología principal

### Caso 3: "Alguien nuevo se une al equipo"

```
/pdr-generador revisar
```

El agente puede generar una versión resumida del PRD actual para que el nuevo entienda de qué va el proyecto.

### Caso 4: "Quiero volver al PRD v1"

```
/pdr/PRD.v1.md
```

Lee la v1 para ver qué cambió. Luego puedes:
- Alinear tu código de vuelta
- O confirmar que v2 fue la decisión correcta

---

## Tips y trucos

### Tip 1: Guarda las respuestas en un documento

Cuando respondas las 5 preguntas iniciales, cópialas a un documento. Así tienes referencia de tu intención original.

### Tip 2: Usa revisiones regularmente

No esperes 3 meses. Cada 2-3 semanas haz una revisión. Es más fácil encontrar desviaciones temprano.

### Tip 3: Comparte el PRD con tu equipo

Si tienes equipo técnico:
```
Tu PRD.md → muéstraselo
```

Que lean la sección de arquitectura. Será base para las conversaciones técnicas.

### Tip 4: Usa CHANGELOG para decisiones

Cuando actualices a v2, explica **por qué** cambió. Eso es valioso para futuras decisiones.

### Tip 5: MVP es tu guía

Si sientes que te desalineaste, vuelve a leer la sección "Recomendación de MVP". Eso te recentra.

---

## Troubleshooting

### "El agente no genera diagrama Mermaid"

Asegúrate que el agente esté cargado:
1. Ve a `.claude/agents/prd-generator.md`
2. Copia su contenido
3. Usa `/remember` en Claude Code para cargar el agente

### "No puedo ver la carpeta .pdr"

Las carpetas con punto (`.`) son ocultas en algunos sistemas.

**Windows:** Enable "Hidden files" en View options  
**Mac:** `Cmd + Shift + .` en Finder  
**Linux:** `ls -la` en terminal

### "El setup.sh no funciona"

```bash
# Dame permisos ejecutables
chmod +x setup.sh

# Ejecuta
./setup.sh
```

Si aún no funciona, crea la carpeta manualmente:
```bash
mkdir -p .claude/agents
mkdir -p .pdr
```

---

## Próximos pasos

1. **Crea tu primer PRD:** `/pdr-generador crear`
2. **Empieza a construir** según el MVP
3. **Revisa cada 2 semanas:** `/pdr-generador revisar`
4. **Actualiza cuando sea necesario:** `/pdr-generador actualizar`

¡Adelante! 🚀

---

**Preguntas?** Revisa [FAQ.md](faq.md) o contacta en mis redes:
- 📺 YouTube: https://www.youtube.com/@jose.andonaire
- 📸 Instagram: https://www.instagram.com/jose.andonaireac/
