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
echo "Steam game icons copied by si were not removed."
echo "Your Steam game icons and .desktop files were left untouched."
