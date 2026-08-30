#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

cp "$SCRIPT_DIR/si" "$INSTALL_DIR/si"
chmod +x "$INSTALL_DIR/si"

echo "✓ Installed steam-kde-icon-sync"
echo "✓ Command available as: si"
echo
echo "Run 'si' whenever a Steam game is missing its KDE icon."
