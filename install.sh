#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
RAW_URL="https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/si"

mkdir -p "$INSTALL_DIR"

curl -fsSL "$RAW_URL" -o "$INSTALL_DIR/si"
chmod +x "$INSTALL_DIR/si"

echo "✓ Installed steam-kde-icon-sync"
echo "✓ Command available as: si"
echo
echo "Run 'si' whenever a Steam game is missing its KDE icon."
