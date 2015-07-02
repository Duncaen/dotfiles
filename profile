# load system profile
. /etc/profile
# Keychain
#[ -r /usr/bin/keychain ] && eval `keychain --eval --agents ssh id_rsa`

# runsvdir ~/service
export DISPLAY=:0
export XAUTHORITY=~/.Xauthority
