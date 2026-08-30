#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/bin"
ICON_DIR="$HOME/.local/share/icons/hicolor/256x256/apps"

if [ -f "$INSTALL_DIR/si" ]; then
    rm "$INSTALL_DIR/si"
    echo "✓ Removed si"
else
    echo "si is not installed."
fi

echo
echo "Steam game icons already copied by si were not removed."
echo "To remove those icons manually, delete:"
echo "$ICON_DIR/steam_*.png"
