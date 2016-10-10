PS1='$(d=${PWD/$HOME/\~};print ${d##*/})$([ "$SSH_CONNECTION" ]&&print "@${HOSTNAME:=$(hostname)}")$(((r=$?))&&print "?\e[0;31;40m$r\e[0m")$(((USER_ID))&&print \$||print \#) '
