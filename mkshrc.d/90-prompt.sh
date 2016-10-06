PS1='$(d=${PWD/$HOME/\~};print ${d##*/})$(((r=$?))&&print "?\e[0;31;40m$r\e[0m")$(((USER_ID))&&print \$||print \#) '
