#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.local/bin"
BASE_URL="https://raw.githubusercontent.com/ItsARCn/Steam-Icon-Sync/main"

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

echo "→ Downloading sis..."
download "$BASE_URL/sis" "$INSTALL_DIR/sis"

echo "→ Downloading sis-clean..."
download "$BASE_URL/sis-clean" "$INSTALL_DIR/sis-clean"

chmod +x "$INSTALL_DIR/sis" "$INSTALL_DIR/sis-clean"

echo
echo "✓ Installed Steam Icon Sync"
echo "✓ Command available: sis"
echo "✓ Command available: sis-clean"
echo
echo "Run 'sis' to sync Steam game icons."
echo "Run 'sis-clean' to undo icons created by sis."