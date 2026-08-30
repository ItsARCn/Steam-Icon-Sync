#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
BASE_URL="https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main"

mkdir -p "$INSTALL_DIR"

download() {
    local url="$1"
    local output="$2"

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$url" -o "$output"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$url" -O "$output"
    else
        echo "✗ Error: curl or wget is required."
        echo "  Install either curl or wget and run the installer again."
        exit 1
    fi
}

echo "→ Downloading si..."
download "$BASE_URL/si" "$INSTALL_DIR/si"

echo "→ Downloading si-clean..."
download "$BASE_URL/si-clean" "$INSTALL_DIR/si-clean"

chmod +x "$INSTALL_DIR/si" "$INSTALL_DIR/si-clean"

echo
echo "✓ Installed steam-kde-icon-sync"
echo "✓ Command available: si"
echo "✓ Command available: si-clean"
echo
echo "Run 'si' to sync Steam game icons."
echo "Run 'si-clean' to undo icons created by si."
