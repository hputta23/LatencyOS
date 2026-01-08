if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    # Launch LabWC (Window Manager)
    # This will trigger ~/.config/labwc/autostart (Chromium + Waybar + NM-Applet)
    exec labwc

fi
