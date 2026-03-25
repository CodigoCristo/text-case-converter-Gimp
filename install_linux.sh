#!/bin/bash
# =============================================================================
# Text Case Converter — GIMP 3.0 Plugin
# Instalador para Linux / Installer for Linux
# =============================================================================

PLUGIN_NAME="text-case-converter"
GIMP_CONFIG="$HOME/.config/GIMP"

# Colores / Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

print_header() {
    echo ""
    echo -e "${CYAN}${BOLD}=============================================${NC}"
    echo -e "${CYAN}${BOLD}  Text Case Converter — GIMP 3.0 Plugin     ${NC}"
    echo -e "${CYAN}${BOLD}  Instalador Linux / Linux Installer         ${NC}"
    echo -e "${CYAN}${BOLD}=============================================${NC}"
    echo ""
}

print_ok()   { echo -e "  ${GREEN}✔${NC}  $1"; }
print_info() { echo -e "  ${CYAN}→${NC}  $1"; }
print_warn() { echo -e "  ${YELLOW}⚠${NC}  $1"; }
print_err()  { echo -e "  ${RED}✘${NC}  $1"; }

print_header

# 1. Verificar GIMP / Check GIMP
echo -e "${BOLD}[1/3] Verificando GIMP / Checking GIMP...${NC}"
if ! command -v gimp &>/dev/null; then
    print_err "GIMP no está instalado / GIMP is not installed."
    echo ""
    echo "    Ubuntu/Debian : sudo apt install gimp"
    echo "    Fedora        : sudo dnf install gimp"
    echo "    Arch          : sudo pacman -S gimp"
    echo ""
    exit 1
fi

GIMP_VERSION=$(gimp --version 2>/dev/null | grep -oP '\d+\.\d+\.\d+' | head -1)
print_ok "GIMP v$GIMP_VERSION ✓"
echo ""

# 2. Verificar archivos del plugin / Check plugin files
echo -e "${BOLD}[2/3] Verificando archivos / Checking files...${NC}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_SRC="$SCRIPT_DIR/$PLUGIN_NAME"

if [[ ! -d "$PLUGIN_SRC" ]]; then
    print_err "No se encontró la carpeta '$PLUGIN_NAME' junto a este script."
    echo ""
    echo "  Estructura esperada / Expected structure:"
    echo "    text-case-converter-Gimp/"
    echo "    ├── $PLUGIN_NAME/"
    echo "    │   └── $PLUGIN_NAME.py"
    echo "    └── install_linux.sh"
    echo ""
    exit 1
fi

if [[ ! -f "$PLUGIN_SRC/$PLUGIN_NAME.py" ]]; then
    print_err "No se encontró '$PLUGIN_NAME.py' dentro de la carpeta del plugin."
    exit 1
fi

print_ok "Carpeta del plugin encontrada / Plugin folder found ✓"
echo ""

# 3. Buscar versiones e instalar / Find versions and install
echo -e "${BOLD}[3/3] Instalando plugin / Installing plugin...${NC}"

VERSIONES=()
if [[ -d "$GIMP_CONFIG" ]]; then
    for dir in "$GIMP_CONFIG"/*/; do
        [[ -d "$dir" ]] || continue
        version=$(basename "$dir")
        if [[ "$version" =~ ^3\.[0-9] ]]; then
            VERSIONES+=("$version")
        fi
    done
fi

if [[ ${#VERSIONES[@]} -eq 0 ]]; then
    print_warn "No se encontraron carpetas de GIMP, creando 3.0 por defecto..."
    VERSIONES=("3.0")
fi

print_info "Versiones encontradas / Versions found: ${VERSIONES[*]}"
echo ""

INSTALADOS=0

for VERSION in "${VERSIONES[@]}"; do
    PLUGIN_DST="$GIMP_CONFIG/$VERSION/plug-ins/$PLUGIN_NAME"

    print_info "Instalando en GIMP $VERSION..."

    mkdir -p "$GIMP_CONFIG/$VERSION/plug-ins"

    if [[ -d "$PLUGIN_DST" ]]; then
        print_warn "Instalación previa encontrada, reemplazando..."
        rm -rf "$PLUGIN_DST"
    fi

    cp -r "$PLUGIN_SRC" "$PLUGIN_DST"
    chmod +x "$PLUGIN_DST/$PLUGIN_NAME.py"
    print_ok "GIMP $VERSION → $PLUGIN_DST ✓"
    echo ""

    INSTALADOS=$((INSTALADOS + 1))
done

echo -e "${GREEN}${BOLD}================================================${NC}"
echo -e "${GREEN}${BOLD}  ✔  Instalado en $INSTALADOS versión(es) de GIMP  ${NC}"
echo -e "${GREEN}${BOLD}================================================${NC}"
echo ""
echo -e "  ${BOLD}Próximos pasos / Next steps:${NC}"
echo -e "  1. Reinicia GIMP / Restart GIMP"
echo -e "  2. Ve al menú / Go to menu:"
echo -e "     ${CYAN} Texto → Convertir Caso${NC}"
echo -e "     ${CYAN} Text  → Convert Case${NC}"
echo ""
