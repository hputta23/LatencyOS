# LatencyOS

**LatencyOS** is a custom, lightweight Arch Linux distribution designed for **ultra-low latency trading and browsing**. It is built to run as a Live ISO (Kiosk Mode), booting directly into a high-performance environment with minimal overhead.

## 🚀 Features

*   **Ultra-Lightweight Desktop**: Uses **LabWC** (Stacking Wayland Compositor) for minimal resource usage.
*   **Minimal UI**: Includes **Waybar** for essential status (Clock, Network) without the bloat of a full desktop environment.
*   **Kiosk Mode**: Automatically logs in as the `trading` user and launches **Chromium** (maximized) tuned for Wayland (`--ozone-platform=wayland`).
*   **Network Ready**: Includes **NetworkManager** and `nm-applet` (System Tray) for easy Wi-Fi connections.
*   **Secure**: Runs as a non-root user (`trading`) with reduced privileges.
*   **Fast Boot**: Optimized systemd services and minimal package set for rapid startup.

## 🛠️ Build Instructions

You can build the ISO using Docker (no Arch Linux host required).
**Prerequisite:** Docker Desktop (Mac/Windows/Linux).

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/hputta23/LatencyOS.git
    cd LatencyOS
    ```

2.  **Run the Build Script**:
    ```bash
    ./run_build_debug.sh
    ```
    *   This will pull the Arch Linux base image, install dependencies, and generate the ISO.
    *   **Note:** The build uses a privileged container to handle filesystem mounts.

3.  **Output**:
    The resulting ISO will be in the `out/` directory:
    *   `out/latencyos-YYYY.MM.DD-x86_64.iso`

## 💻 Running (Virtual Machine)

LatencyOS is tested on **UTM (macOS)** but runs on any hypervisor (QEMU, VirtualBox, VMware).

**Recommended Settings:**
*   **Architecture**: x86_64
*   **System**: Standard PC (Q35 + UEFI)
*   **Display**: `virtio-ramfb-gl` (GPU Acceleration) or `virtio-vga`.
*   **Network**: Shared Network (User Mode) or Bridged.

## 📂 Project Structure

*   `profile/`: The ArchISO configuration profile.
    *   `packages.x86_64`: List of installed packages.
    *   `airootfs/`: Files overlaid onto the live system (configs, scripts).
        *   `home/trading/.config/`: LabWC and Waybar configs.
    *   `profiledef.sh`: ISO metadata and permission rules.
*   `run_build_debug.sh`: Main build script (wraps Docker).
*   `Dockerfile.builder`: Docker environment for building the ISO.

## ⚠️ Notes for Apple Silicon (M1/M2/M3) Users

Since this is an **x86_64** OS, building it on Apple Silicon requires Docker emulation (`linux/amd64`). The build script handles this automatically, but it may be slower than native builds.
The **generated ISO is x86_64** and must be run in Emulation mode on ARM macs.

---
*Built with ❤️ for Speed.*
