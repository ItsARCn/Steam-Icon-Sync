#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/bin"

removed=0

if [ -f "$INSTALL_DIR/si" ]; then
    rm "$INSTALL_DIR/si"
    echo "✓ Removed si"
    removed=$((removed + 1))
fi

if [ -f "$INSTALL_DIR/si-clean" ]; then
    rm "$INSTALL_DIR/si-clean"
    echo "✓ Removed si-clean"
    removed=$((removed + 1))
fi

if [ "$removed" -eq 0 ]; then
    echo "steam-kde-icon-sync is not installed."
else
    echo
    echo "✓ Uninstalled steam-kde-icon-sync"
fi

echo
echo "Steam game icons copied by si were not removed."
echo "Your Steam game icons and .desktop files were left untouched."
echo
echo "If you ran 'si-clean' before uninstalling, the icons"
echo "created by si have already been removed and the original"
echo "icons have been restored."
