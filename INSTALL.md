# Instalación - Formas simples

Elige la opción que prefieras.

---

## 🟢 Opción 1: La más simple (SIN descargar nada)

**Copia esto en Claude Code:**

```
/pdr-generador crear
```

¿Cómo funciona?

1. Abre Claude Code en tu proyecto
2. En el chat, escribe exactamente eso: `/pdr-generador crear`
3. Claude Code me carga automáticamente
4. Responde las 5 preguntas
5. Tu PRD está listo en `.pdr/PRD.v1.md`

**Ventaja:** No necesitas clonar nada. Funciona al instante.

---

## 🟡 Opción 2: Simple (con un archivo)

**Pasos:**

1. Ve a https://github.com/jandonaire-iarvix/prd-generator
2. Abre la carpeta `.claude/agents/`
3. Haz click en `prd-generator.md`
4. Click en botón "Raw"
5. Copia todo el contenido
6. En Claude Code, pega en chat y usa `/remember`
7. Listo. Ahora puedes usar `/prd-generador`

**Ventaja:** Una sola copia/pega. Rápido.

---

## 🟠 Opción 3: Completa (clonar repo)

Si quieres TODO (agente + ejemplos + documentación):

### Windows (PowerShell)

```powershell
git clone https://github.com/jandonaire-iarvix/prd-generator.git
cd prd-generator
.\setup.ps1
```

### Mac/Linux (Bash)

```bash
git clone https://github.com/jandonaire-iarvix/prd-generator.git
cd prd-generator
bash setup.sh
```

**Ventaja:** Tienes ejemplos, documentación, y estructura lista. Ideal para aprender.

---

## ¿Cuál elegir?

| Opción | Tiempo | Complejidad | Para quién |
|--------|--------|------------|-----------|
| 1 (simple) | 10 seg | Mínima | Quiero usarlo YA |
| 2 (archivo) | 2 min | Baja | Prefiero tener el archivo |
| 3 (completo) | 3 min | Media | Quiero documentación + ejemplos |

**Recomendación:** Empieza con **Opción 1**. Si quieres más adelante, migra a Opción 3.

---

## Confirmación de instalación

Después de instalar (cualquier opción), verifica que funciona:

En Claude Code, escribe:

```
/pdr-generador crear
```

Si te hace preguntas, **¡estás listo!** 🚀

---

## ¿Problemas?

- **"No reconoce /pdr-generador"** → Intenta `/remember` primero
- **"PowerShell dice que no tiene permisos"** → Abre PowerShell como administrador
- **"Git no está instalado"** → Descarga desde https://git-scm.com

---

**Eso es todo.** Elige tu opción y adelante. 🚀
