# load system profile
. /etc/profile
# Keychain
#[ -r /usr/bin/keychain ] && eval `keychain --eval --agents ssh id_rsa`

# runsvdir ~/service
export DISPLAY=:0
export XAUTHORITY=/home/duncan/.Xauthority
# echo "$XDG_RUNTIME_DIR" > /home/duncan/sv/x/env/XDG_RUNTIME_DIR
# echo "$XDG_SESSION_COOKIE" > /home/duncan/sv/x/env/XDG_SESSION_COOKIE
