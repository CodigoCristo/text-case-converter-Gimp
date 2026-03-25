# 🔤 Text Case Converter — GIMP 3.0 Plugin

**Español / English** — Convierte el texto de capas en GIMP a diferentes formatos de mayúsculas y minúsculas con un solo clic desde el menú.

> Convert text layers in GIMP to different letter cases with a single click from the menu.

---

## ✨ Características / Features

| Modo / Mode | Ejemplo / Example |
|---|---|
| **1. MAYÚSCULAS / UPPERCASE** | `hola mundo` → `HOLA MUNDO` |
| **2. minúsculas / lowercase** | `HOLA MUNDO` → `hola mundo` |
| **3. Título / Title Case** | `hola mundo` → `Hola Mundo` |
| **4. iNVERTIR / sWAP cASE** | `Hola Mundo` → `hOLA mUNDO` |
| **5. Oración / Sentence** | `hola mundo` → `Hola mundo` |

- 🌐 **Bilingüe automático** — detecta si tu sistema está en español o inglés
- ↩️ **Soporte de Deshacer** — `Ctrl+Z` revierte el cambio
- 🔢 **Múltiples capas** — funciona con varias capas de texto seleccionadas a la vez
- 📁 **Multi-versión** — se instala en todas las versiones de GIMP encontradas (3.0, 3.2...)

---

## ⚙️ Requisitos / Requirements

| | |
|---|---|
| **GIMP** | 3.0.2 o superior / or higher ⚠️ |
| **SO / OS** | Linux |
| **Python** | Incluido en GIMP / Bundled with GIMP |

> ⚠️ GIMP 3.0.0 y 3.0.1 tienen un bug en el soporte de Python. Usa **GIMP 3.0.2 o superior**.
>
> GIMP 3.0.0 and 3.0.1 have a bug with Python support. Use **GIMP 3.0.2 or higher**.

---

## 🚀 Instalación / Installation

### ⚡ Automática / Automatic (recomendada)

```bash
git clone https://github.com/CodigoCristo/text-case-converter-Gimp.git
cd text-case-converter-Gimp
chmod +x install_linux.sh
./install_linux.sh
```

El script detecta automáticamente todas las versiones de GIMP instaladas (3.0, 3.2...) y copia el plugin en cada una.

> The script automatically detects all installed GIMP versions (3.0, 3.2...) and copies the plugin into each one.

---

### 🛠️ Manual desde terminal / Manual from terminal

Si prefieres instalar manualmente, ejecuta los siguientes comandos según las versiones de GIMP que tengas instaladas:

> If you prefer to install manually, run the following commands depending on your installed GIMP versions:

**GIMP 3.0**
```bash
mkdir -p ~/.config/GIMP/3.0/plug-ins/text-case-converter
cp text-case-converter/text-case-converter.py ~/.config/GIMP/3.0/plug-ins/text-case-converter/
chmod +x ~/.config/GIMP/3.0/plug-ins/text-case-converter/text-case-converter.py
```

**GIMP 3.2**
```bash
mkdir -p ~/.config/GIMP/3.2/plug-ins/text-case-converter
cp text-case-converter/text-case-converter.py ~/.config/GIMP/3.2/plug-ins/text-case-converter/
chmod +x ~/.config/GIMP/3.2/plug-ins/text-case-converter/text-case-converter.py
```

> 💡 Ejecuta solo los comandos de la versión que tengas instalada, o ambos si tienes las dos.
>
> Run only the commands for the version you have installed, or both if you have both.

La estructura final debe quedar así / The final structure should look like this:

```
~/.config/GIMP/
├── 3.0/
│   └── plug-ins/
│       └── text-case-converter/
│           └── text-case-converter.py
└── 3.2/
    └── plug-ins/
        └── text-case-converter/
            └── text-case-converter.py
```

Reinicia GIMP y el menú aparecerá en / Restart GIMP and the menu will appear at:
- 🇪🇸 `Texto → Convertir Caso`
- 🇬🇧 `Text → Convert Case`

---

## 🎯 Uso / Usage

1. Selecciona una o más capas de texto en el panel de capas / Select one or more text layers in the layers panel
2. Ve al menú `Texto → Convertir Caso` / Go to `Text → Convert Case`
3. Elige el modo deseado / Choose the desired mode
4. Usa `Ctrl+Z` para deshacer si es necesario / Use `Ctrl+Z` to undo if needed

---

## 🐛 Solución de problemas / Troubleshooting

**El menú no aparece / Menu doesn't appear**
- Reinicia GIMP completamente / Restart GIMP completely
- Verifica que GIMP sea 3.0.2 o superior / Check that GIMP is 3.0.2 or higher
- Comprueba que Python funciona: `Filtros → Desarrollo → Python-Fu → Consola`

**El texto no cambia / Text doesn't change**
- Asegúrate de seleccionar una capa de tipo **texto** en el panel de capas, no dentro del editor de texto / Make sure to select a **text** layer in the layers panel, not inside the text editor

---

## 📄 Licencia / License

MIT License — libre para usar, modificar y distribuir / free to use, modify and distribute.

---

*Hecho con ❤️ para la comunidad de GIMP / Made with ❤️ for the GIMP community*
