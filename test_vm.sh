#!/bin/bash

# Find the latest ISO
ISO_FILE=$(ls out/latencyos-*.iso | head -n 1)

if [[ -z "$ISO_FILE" ]]; then
    echo "No ISO found in out/. Please build it first."
    exit 1
fi

echo "Booting $ISO_FILE in QEMU..."

# Detect Accelerator
ACCEL=""
if [[ "$(uname)" == "Darwin" ]]; then
    ACCEL="-accel hvf"
elif [[ "$(uname)" == "Linux" ]]; then
    ACCEL="-enable-kvm"
fi

qemu-system-x86_64 \
    -m 4G \
    -smp 4 \
    $ACCEL \
    -cdrom "$ISO_FILE" \
    -boot d \
    -vga virtio \
    -display default \
    -net nic -net user
