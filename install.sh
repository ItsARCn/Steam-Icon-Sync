#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
RAW_URL="https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/si"

mkdir -p "$INSTALL_DIR"

if command -v curl >/dev/null 2>&1; then
    echo "→ Downloading si using curl..."
    curl -fsSL "$RAW_URL" -o "$INSTALL_DIR/si"
elif command -v wget >/dev/null 2>&1; then
    echo "→ Downloading si using wget..."
    wget -q "$RAW_URL" -O "$INSTALL_DIR/si"
else
    echo "✗ Error: curl or wget is required."
    echo "  Install either curl or wget and run the installer again."
    exit 1
fi

chmod +x "$INSTALL_DIR/si"

echo "✓ Installed steam-kde-icon-sync"
echo "✓ Command available as: si"
echo
echo "Run 'si' whenever a Steam game is missing its KDE icon."
