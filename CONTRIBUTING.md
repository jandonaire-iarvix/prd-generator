# Contribuyendo a PRD Generator

¡Gracias por querer contribuir! Este proyecto vive gracias a la comunidad.

## Cómo reportar bugs

### Antes de reportar
1. Verifica que no esté ya reportado en Issues
2. Revisa [FAQ.md](docs/faq.md) — tu respuesta podría estar ahí

### Al reportar
```markdown
## Descripción
Describe el bug brevemente

## Pasos para reproducir
1. Ejecuté `/pdr-generador crear`
2. Respondí las 5 preguntas
3. El agente generó un diagrama roto

## Resultado esperado
El diagrama debería ser válido Mermaid

## Resultado actual
Error en línea X del diagrama

## Ambiente
- Sistema operativo: Windows / Mac / Linux
- Claude Code versión: X.X.X
- Node.js versión (si aplica): X.X.X
```

---

## Cómo sugerir mejoras

1. Abre un issue con title: `[FEATURE] Nombre de la feature`
2. Describe qué quieres y por qué
3. Ejemplos o mockups si es visual

### Ideas populares de features
- Generar DTOs en TypeScript/Python
- Generar RLS policies para Supabase
- Exportar PRD a PDF
- Generar Postman collection desde PRD
- Integración con Jira/Linear

---

## Cómo contribuir código

### Paso 1: Fork el repo

```bash
# En GitHub, click en "Fork"
git clone https://github.com/TU_USUARIO/prd-generator.git
cd prd-generator
```

### Paso 2: Crea una rama

```bash
git checkout -b feature/nombre-feature
# o
git checkout -b fix/nombre-bug
```

### Paso 3: Haz cambios

Edita los archivos necesarios. Para cambios del agente, edita:
```
.claude/agents/prd-generator.md
```

### Paso 4: Testea localmente

```bash
bash setup.sh  # Verifica que el setup funcione

# Prueba el agente manualmente
# /prd-generador crear (desde Claude Code)
```

### Paso 5: Commit y push

```bash
git add .
git commit -m "feature: agregar nueva funcionalidad X"
git push origin feature/nombre-feature
```

### Paso 6: Abre un Pull Request

En GitHub, se abrirá automáticamente una sugerencia de PR.

Describe:
- Qué cambió
- Por qué
- Cómo testear

---

## Guías de estilo

### Para cambios en agente

El archivo `.claude/agents/prd-generator.md` usa este formato:

```markdown
# Sección principal

Explicación clara.

## Subsección

Detalles.

### Ejemplo de entrada
```
Muestra ejemplo del usuario
```

### Ejemplo de salida
```
Muestra qué genera el agente
```
```

**Reglas:**
- Lenguaje pedagógico (explica para no técnicos)
- Sin "generado por IA"
- Markdown limpio
- Ejemplos claros (❌ Malo vs ✅ Bueno)

### Para documentación

- Markdown limpio
- Encabezados jerárquicos (# → ## → ###)
- Listas con bullets o números
- Código en bloques delimitados
- Links activos

---

## Áreas donde se buscan contribuciones

### 🔴 Críticas
- Bugs en el agente
- Errores en SQL generado
- Problemas en setup.sh

### 🟡 Importantes
- Mejorar documentación
- Agregar más ejemplos
- Traducir a otros idiomas

### 🟢 Útiles
- Casos de uso nuevos
- Tips y trucos
- Optimizaciones

---

## Comunidad

- 📺 YouTube: https://www.youtube.com/@jose.andonaire
- 📸 Instagram: https://www.instagram.com/jose.andonaireac/
- 💼 LinkedIn: https://www.linkedin.com/in/automatizacion-para-empresas/

¡Gracias por ser parte de esto! 🚀
