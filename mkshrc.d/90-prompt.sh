PS1='$(d=${PWD/$HOME/\~};print ${d##*/})$(((r=$?))&&$([ -n "$SSH_CONNECTION" ] && print "@${HOSTNAME:=$(hostname)}"||true)&&print "?\e[0;31;40m$r\e[0m")$(((USER_ID))&&print \$||print \#) '
