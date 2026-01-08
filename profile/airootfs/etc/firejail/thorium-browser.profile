# Firejail profile for Thorium Browser
# Optimized for LatencyOS

include chromium-common.profile

# No persistent storage needed for Kiosk mode generally, but if needed:
# whitelist ~/Downloads

# Network restriction: Only allow network (no restriction on protocol, but we hardened the stack)

# Filesystem
private-bin thorium-browser,thorium,chrome,bash,sh
private-etc alternatives,ca-certificates,crypto-policies,fonts,group,hostname,hosts,ld.so.cache,ld.so.conf,ld.so.conf.d,localtime,machine-id,nsswitch.conf,passwd,pki,protocols,resolv.conf,rpc,services,ssl,udev,xdg

# Reduce attack surface
# debugfs is widely used by chromium for trace logging, disable it
blacklist /sys/kernel/debug

# Seccomp (syscall filtering)
seccomp
# Caps
caps.drop all

# No sound if not needed (Robinhood usually doesn't need it, but maybe for alerts?)
# nodbus (might break notifications)
