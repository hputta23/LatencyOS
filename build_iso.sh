#!/bin/bash
set -e

# Configuration
PROFILE_DIR="$(pwd)/profile"
OUT_DIR="$(pwd)/out"
WORK_DIR="$(pwd)/work"

echo "=== LatencyOS Builder ==="
echo "Profile: $PROFILE_DIR"
echo "Output:  $OUT_DIR"

# Cleanup
# sudo rm -rf "$WORK_DIR" "$OUT_DIR"

mkdir -p "$OUT_DIR"

# Run mkarchiso
# Note: This command requires root and archiso installed
echo "Starting build... (requires sudo)"

# Check if running on Linux
if [[ "$(uname)" != "Linux" ]]; then
    echo "ERROR: This script must be run on Linux (Arch Linux recommended) with 'archiso' installed."
    echo "You are running on: $(uname)"
    exit 1
fi

sudo mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$PROFILE_DIR"

echo "Build complete. ISO is in $OUT_DIR"
