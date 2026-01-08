iso_name="latencyos"
iso_label="LATENCYOS"
iso_publisher="Antigravity <https://antigravity.dev>"
iso_application="LatencyOS Live"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-b' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.ssh"]="0:0:700"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/home/trading"]="1000:1000:755"
  ["/home/trading/.bash_profile"]="1000:1000:644"
  ["/home/trading/.config"]="1000:1000:755"
  ["/home/trading/.config/labwc"]="1000:1000:755"
  ["/home/trading/.config/labwc/rc.xml"]="1000:1000:644"
  ["/home/trading/.config/labwc/autostart"]="1000:1000:755"
  ["/home/trading/.config/waybar"]="1000:1000:755"
  ["/home/trading/.config/waybar/config"]="1000:1000:644"
  ["/home/trading/.config/waybar/style.css"]="1000:1000:644"
)

