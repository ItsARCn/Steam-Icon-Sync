#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"

removed=0

if [ -f "$INSTALL_DIR/sis" ]; then
    rm "$INSTALL_DIR/sis"
    echo "✓ Removed sis"
    removed=$((removed + 1))
fi

if [ -f "$INSTALL_DIR/sis-clean" ]; then
    rm "$INSTALL_DIR/sis-clean"
    echo "✓ Removed sis-clean"
    removed=$((removed + 1))
fi

if [ "$removed" -eq 0 ]; then
    echo "Steam Icon Sync is not installed."
else
    echo
    echo "✓ Uninstalled Steam Icon Sync"
fi

echo
echo "Steam game icons copied by sis were not removed."
echo "Your Steam game icons and .desktop files were left untouched."
echo
echo "If you ran 'sis-clean' before uninstalling, the icons"
echo "created by sis have already been removed and the original"
echo "icons have been restored."