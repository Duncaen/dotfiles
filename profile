# load system profile
. /etc/profile

# Keychain
[ -r /usr/bin/keychain -a "$(tty)" = "/dev/tty1" ] && eval `keychain --eval --agents ssh id_rsa`

#
# export DISPLAY=:0
# export XAUTHORITY=/home/duncan/.Xauthority
