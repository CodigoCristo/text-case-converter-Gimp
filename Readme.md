# 🔤 Text Case Converter — GIMP 3.0 Plugin

**Español / English** — Convierte el texto de capas en GIMP a diferentes formatos de mayúsculas y minúsculas con un solo clic desde el menú.

> Convert text layers in GIMP to different letter cases with a single click from the menu.

---

## 📸 Vista previa / Preview

```
Texto / Text
  └── Convertir Caso / Convert Case
        ├── 1. MAYÚSCULAS  /  1. UPPERCASE
        ├── 2. minúsculas  /  2. lowercase
        ├── 3. Título      /  3. Title Case
        ├── 4. iNVERTIR    /  4. sWAP cASE
        └── 5. Oración     /  5. Sentence
```

---

## ✨ Características / Features

| Modo / Mode | Ejemplo / Example |
|---|---|
| **MAYÚSCULAS / UPPERCASE** | `hola mundo` → `HOLA MUNDO` |
| **minúsculas / lowercase** | `HOLA MUNDO` → `hola mundo` |
| **Título / Title Case** | `hola mundo` → `Hola Mundo` |
| **iNVERTIR / sWAP cASE** | `Hola Mundo` → `hOLA mUNDO` |
| **Oración / Sentence** | `hola mundo` → `Hola mundo` |

- 🌐 **Bilingüe automático** — detecta si tu sistema está en español o inglés
- 🌐 **Auto bilingual** — detects if your system is in Spanish or English
- ↩️ **Soporte de Deshacer / Undo support** — `Ctrl+Z` revierte el cambio
- 🔢 **Múltiples capas** — funciona con varias capas de texto seleccionadas a la vez
- 🔢 **Multiple layers** — works with several text layers selected at once

---

## ⚙️ Requisitos / Requirements

| | |
|---|---|
| **GIMP** | 3.0.2 o superior / or higher ⚠️ |
| **SO / OS** | Windows, Linux, macOS |
| **Python** | Incluido en GIMP / Bundled with GIMP |

> ⚠️ **Importante / Important:** Las versiones GIMP 3.0.0 y 3.0.1 tienen un bug en Windows que impide ejecutar plugins de Python. Usa **GIMP 3.0.2 o superior**.
>
> GIMP 3.0.0 and 3.0.1 have a bug on Windows that prevents Python plugins from running. Use **GIMP 3.0.2 or higher**.

Para verificar que Python funciona en tu GIMP / To verify Python works in your GIMP:
```
Filtros → Desarrollo → Python-Fu → Consola
Filters → Development → Python-Fu → Console
```
Si aparece la consola, Python está activo ✅ / If the console appears, Python is active ✅

---

## 📦 Instalación / Installation

### 1. Descarga / Download

Descarga el archivo `text-case-converter.py` desde este repositorio.

Download the file `text-case-converter.py` from this repository.

### 2. Crea la carpeta del plugin / Create the plugin folder

El archivo `.py` debe estar dentro de una **subcarpeta con el mismo nombre** / The `.py` file must be inside a **subfolder with the same name**:

```
text-case-converter/
  └── text-case-converter.py
```

### 3. Copia a la carpeta de plugins de GIMP / Copy to GIMP plugins folder

| Sistema / OS | Ruta / Path |
|---|---|
| **Windows** | `%APPDATA%\GIMP\3.0\plug-ins\` |
| **Linux** | `~/.config/GIMP/3.0/plug-ins/` |
| **macOS** | `~/Library/Application Support/GIMP/3.0/plug-ins/` |

Resultado final / Final result:

**Windows:**
```
C:\Users\TuUsuario\AppData\Roaming\GIMP\3.0\plug-ins\text-case-converter\text-case-converter.py
```

**Linux / macOS:**
```
~/.config/GIMP/3.0/plug-ins/text-case-converter/text-case-converter.py
```

### 4. Permisos de ejecución (solo Linux/macOS) / Execution permissions (Linux/macOS only)

```bash
chmod +x ~/.config/GIMP/3.0/plug-ins/text-case-converter/text-case-converter.py
```

### 5. Reinicia GIMP / Restart GIMP

El menú aparecerá en / The menu will appear at:
- 🇪🇸 `Texto → Convertir Caso`
- 🇬🇧 `Text → Convert Case`

---

## 🚀 Uso / Usage

1. Abre una imagen con capas de texto / Open an image with text layers
2. Selecciona una o más capas de texto en el panel de capas / Select one or more text layers in the layers panel
3. Ve al menú / Go to the menu: `Texto → Convertir Caso` / `Text → Convert Case`
4. Elige el modo deseado / Choose the desired mode
5. Usa `Ctrl+Z` para deshacer si es necesario / Use `Ctrl+Z` to undo if needed

---

## 🐛 Solución de problemas / Troubleshooting

**El menú no aparece / Menu doesn't appear**
- Verifica que la carpeta y el archivo tengan el mismo nombre / Verify the folder and file have the same name
- Reinicia GIMP completamente / Restart GIMP completely
- Comprueba que GIMP sea 3.0.2 o superior / Check that GIMP is 3.0.2 or higher

**El texto no cambia / Text doesn't change**
- Asegúrate de seleccionar una capa de tipo **texto** (no una capa de imagen) / Make sure to select a **text** layer (not an image layer)
- La capa de texto debe estar seleccionada en el panel de capas, no el texto dentro del editor / The text layer must be selected in the layers panel, not the text inside the editor

**Error en Windows con GIMP 3.0.0 / Windows error with GIMP 3.0.0**
- Actualiza a GIMP 3.0.2 o superior / Update to GIMP 3.0.2 or higher
- Descarga desde / Download from: [gimp.org](https://www.gimp.org/downloads/)

---

## 📄 Licencia / License

MIT License — libre para usar, modificar y distribuir / free to use, modify and distribute.

---

## 🙌 Contribuciones / Contributions

¡Las contribuciones son bienvenidas! / Contributions are welcome!

1. Fork este repositorio / Fork this repository
2. Crea una rama / Create a branch: `git checkout -b mi-mejora`
3. Haz tus cambios / Make your changes
4. Abre un Pull Request

---

*Hecho con ❤️ para la comunidad de GIMP / Made with ❤️ for the GIMP community*Readme
