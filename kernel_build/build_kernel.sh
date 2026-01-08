#!/bin/bash

# This script helps set up the environment to build the linux-rt kernel
# It is meant to be run on an Arch Linux system.

echo "=== LatencyOS Kernel Builder Helper ==="

# 1. Clone linux-rt from AUR
if [ ! -d "linux-rt" ]; then
    echo "Cloning linux-rt from AUR..."
    git clone https://aur.archlinux.org/linux-rt.git
else
    echo "linux-rt directory already exists."
fi

cd linux-rt

echo "--------------------------------------------------------"
echo "Instructions for 'Clean Slate' Kernel:"
echo "1. Run 'makepkg --nobuild' to download sources."
echo "2. Run 'make localmodconfig' inside the src/linux... directory"
echo "   (Make sure you have your trading hardware plugged in so it detects needed drivers!)"
echo "3. Edit the .config file manually to fully disable:"
echo "   - Bluetooth (CONFIG_BT)"
echo "   - Printing (CONFIG_USB_PRINTER)"
echo "   - Sound drivers (except needed)"
echo "4. Run 'makepkg -si' to build and install."
echo "5. Move the resulting .pkg.tar.zst files to your custom repo."
echo "--------------------------------------------------------"
