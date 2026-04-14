# Preguntas Frecuentes - PRD Generator

## Preguntas Generales

### P: ¿Necesito programación avanzada para usar esto?
**R:** No. El agente genera el PRD y la estructura. Vos implementas según el PRD. Si sabes HTML, JS, Python o SQL básico estás bien.

### P: ¿Es para solo web o también para apps móviles?
**R:** Para cualquier cosa. Puedes crear PRDs para:
- Apps web
- Apps móviles (iOS/Android)
- SaaS
- Backend/APIs
- Sistemas de escritorio

El PRD es agnóstico a tecnología.

### P: ¿Cuánto tiempo tarda crear un PRD?
**R:** 15-30 minutos para el diálogo. El agente genera documentos en segundos.

### P: ¿Puedo usar esto para proyectos ya iniciados?
**R:** Sí. Incluso si empezaste sin PRD, usa `/pdr-generador crear` y luego `/pdr-generador revisar` para validar qué está alineado.

---

## Sobre el agente

### P: ¿El agente usa API de Claude?
**R:** No. Funciona completamente dentro de Claude Code, sin conexiones externas. Tus datos están locales.

### P: ¿Puedo modificar las instrucciones del agente?
**R:** Sí. El archivo está en `.claude/agents/prd-generator.md`. Puedes editarlo, pero recomiendo mantener la estructura.

### P: ¿Qué pasa si me desconecto a mitad de crear un PRD?
**R:** La conversación se pierde. Pero puedes volver a `/pdr-generador crear` y el agente te hará las 5 preguntas de nuevo. Es rápido.

### P: ¿Puedo usar esto con equipo?
**R:** El PRD generado es un archivo Markdown. Compártelo por:
- GitHub
- Notion
- Google Docs
- Email

Todos leen lo mismo.

---

## Sobre PRDs y versiones

### P: ¿Qué es un PRD exactamente?
**R:** Un **Documento de Requerimientos del Producto** = un plan.

Dice qué vas a construir, por qué, para quién, y cómo fluye. Es el "blueprint" antes de codificar.

### P: ¿Por qué versionado? ¿No puedo tener un PRD único?
**R:** Puedes, pero versionar es más profesional porque:
- Documentas **por qué** cambiaste
- Tienes historial de decisiones
- Nuevos miembros del equipo ven evolución
- Si algo sale mal, sabes qué cambió

### P: ¿Puedo tener PRD.v1, v2, v3?
**R:** Sí. Pero el agente te guía a versionarla sensatamente. No hace falta v1 → v2 → v3 por cada cambio pequeño.

### P: ¿Qué pasa con las versiones viejas?
**R:** Guárdalas. Son historial. Si en el futuro necesitas "¿cómo era el plan original?", está ahí.

---

## Sobre arquitectura

### P: ¿El agente recomienda tecnologías específicas?
**R:** El agente sugiere arquitectura (web, móvil, monolito, microservicios) pero NO impone stack.

Vos eliges: Node.js, Python, Java, Go, etc.

### P: ¿Qué pasa si yo prefiero otra arquitectura?
**R:** El agente sugiere, pero vos decides. Si eliges diferente, documéntalo en v2 cuando actualices.

### P: ¿El agente genera código?
**R:** **No.** Genera:
- Documentación
- Diagramas
- SQL base (estructura, no lógica)

El código lo escribes tú.

---

## Sobre base de datos

### P: ¿Qué SQL genera el agente?
**R:** SQL base: creación de tablas y relaciones.

NO genera:
- Lógica compleja
- Funciones almacenadas
- Triggers
- Optimizaciones avanzadas

Es el punto de partida.

### P: ¿Puedo usar NoSQL en lugar de SQL?
**R:** Sí. El PRD sugiere SQL, pero tu decisión. Si cambias a MongoDB o Firebase, documéntalo en v2.

### P: ¿Cómo cambio la BD después de crear?
**R:** 
1. Implementa el cambio en tu código
2. Ejecuta `/pdr-generador actualizar`
3. Cuéntale qué cambió
4. Genera PRD v2 con nuevo SQL

---

## Sobre desarrollo

### P: ¿A cada commit reviso con el agente?
**R:** No. Revisa cada 2-3 semanas o cuando hagas cambios arquitectónicos grandes.

### P: ¿Qué hago si me desalineé mucho?
**R:**
1. Ejecuta `/pdr-generador diagnosticar`
2. Lee el análisis
3. Elige: alinear tu código OR actualizar a v2

### P: ¿Puedo ignorar partes del PRD?
**R:** Técnicamente sí, pero documento por qué. Si el PRD dice algo importante, ignorarlo es riesgo técnico.

### P: ¿El MVP es obligatorio?
**R:** El MVP (Versión Mínima Viable) es una sugerencia. Pero respétalo inicialmente. Así evitas scope creep.

---

## Sobre colaboración

### P: ¿Mi equipo ve el agente?
**R:** Solo si lo cargan en sus Claude Code. Puedes:
- Compartir `.claude/agents/prd-generator.md`
- Compartir el README y guía
- Todos clonan el repo y corren setup

### P: ¿Qué pasa si mi equipo no usa Claude Code?
**R:** Entonces comparten el PRD generado (Markdown). Ellos lo leen, tú lo mantienes.

### P: ¿Puedo mostrar el PRD a clientes?
**R:** **No directamente.** El PRD es técnico-pedagógico. Para clientes:
- Resumen ejecutivo (2-3 párrafos)
- Flujo del sistema (en palabras simples)
- Resultado esperado

Usa la sección "Explicación pedagógica" del PRD.

---

## Sobre distribución

### P: ¿Cómo comparto mi PRD con mi equipo?
**R:** Tu PRD está en `.pdr/PRD.v1.md` (archivo Markdown).

Puedes compartirlo por:
- **GitHub** — Sube el archivo a tu repo
- **Notion** — Copia y pega el contenido
- **Google Docs** — Convierte a Doc compartido
- **Email** — Envía el archivo .md
- **Confluence** — Copia el Markdown

Tu equipo puede verlo en cualquier plataforma que lea Markdown.

### P: ¿Quién decide si compartir el agente con mi comunidad?
**R:** Tú. Este repo ya tiene todo listo para compartir:
- ✅ README claro
- ✅ setup.sh para instalación automática
- ✅ Documentación completa
- ✅ LICENSE (MIT - código abierto)

Si quieres compartir el agente con tu comunidad:
1. Sube a GitHub (este proyecto ya está listo)
2. Comparte el link
3. Tu comunidad clona y corre: `bash setup.sh`

Si prefieres mantenerlo privado para ti, simplemente no lo publiques.

### P: ¿Qué tiene de especial este repo para GitHub?
**R:** Ya viene con todo:
- ✅ README.md — Explicación clara
- ✅ QUICKSTART.md — Inicio en 5 minutos
- ✅ setup.sh — Instalación automática
- ✅ docs/ — Documentación completa
- ✅ LICENSE (MIT) — Código abierto
- ✅ .gitignore — Archivos ignorados
- ✅ CONTRIBUTING.md — Cómo contribuir

Solo necesitas hacer `git push` y está listo.

---

## Sobre cambios y feedback

### P: ¿Qué pasa si encuentro un bug en el agente?
**R:** 
1. Abre un issue en GitHub
2. Describe qué pasó
3. Comparte cómo reproducir
4. Se arregla en próxima versión

### P: ¿Puedo sugerir features al agente?
**R:** Sí. Abre un issue con "Feature request" en el título.

Ejemplos de features útiles:
- Generar DTOs automáticos
- Generar RLS policies (Supabase)
- Generar Postman collection

### P: ¿El agente se actualiza?
**R:** El repo se actualiza. Tú:
1. `git pull` para actualizar `.claude/agents/prd-generator.md`
2. Los PRDs generados (.pdr/) se mantienen intactos

---

## Sobre casos especiales

### P: ¿Funciona para monorepo?
**R:** Sí. Cada subproyecto puede tener su `.pdr/` folder con su propio PRD.

### P: ¿Qué pasa si tengo múltiples productos?
**R:** Crea múltiples carpetas:
```
productos/
├── producto-a/
│   ├── .pdr/
│   ├── .claude/
│   └── README.md
├── producto-b/
│   ├── .pdr/
│   ├── .claude/
│   └── README.md
```

Cada uno con su agente.

### P: ¿Sirve para documentar un proyecto existente?
**R:** Sí. Ejecuta `/pdr-generador crear`, responde basándote en lo que ya construiste. Luego `revisar` para validar.

### P: ¿Funciona en español y otros idiomas?
**R:** El agente entiende español. Responde en español. Para otros idiomas, pide al agente que responda en ese idioma en tu primer mensaje.

---

## Troubleshooting

### P: "El agente no responde"
**R:**
1. Verifica que `.claude/agents/prd-generator.md` exista
2. Copia su contenido
3. Usa `/remember` para cargar en Claude Code
4. Intenta de nuevo

### P: "Genera el PRD muy corto"
**R:** 
1. Dale respuestas más detalladas a las 5 preguntas
2. No uses respuestas de 1 línea
3. Explica el contexto

Ejemplo:
```
❌ "Es para mi equipo"
✅ "Es para 7 personas en mi equipo de ventas. Algunos saben de tech, 
   otros no. Principalmente usan Salesforce pero eso es lento y caro."
```

### P: "Los diagramas no se ven"
**R:** Los diagramas están en formato Mermaid. Verifica que tu Markdown viewer soporte Mermaid:
- GitHub ✅ (automático)
- VS Code ✅ (extensión)
- Notion ✅ (automático)

---

## Contacto y comunidad

### P: ¿Dónde reporto bugs?
**R:** GitHub issues en el repo del proyecto.

### P: ¿Dónde doy feedback?
**R:** 
- Issues en GitHub
- Comentarios en YouTube: https://www.youtube.com/@jose.andonaire
- DMs en Instagram: https://www.instagram.com/jose.andonaireac/

### P: ¿Hay comunidad de usuarios?
**R:** Sígueme en redes. Ahí comparto actualizaciones y casos de uso.

---

¿No encontraste tu pregunta? Contacta en las redes o abre un issue. 🚀
