FROM --platform=linux/amd64 archlinux:latest

# Install archiso and dependencies
RUN pacman -Syu --noconfirm archiso make devtools git grub

# Set up work directory
WORKDIR /build

# The user will mount the repo to /build
# The command to run is ./build_iso.sh
CMD ["./build_iso.sh"]
