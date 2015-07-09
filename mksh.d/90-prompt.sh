if [ -x /usr/bin/slcp ]; then
  PS1='$(slcp $COLUMNS $?)'
fi

case "$TERM" in
  dvtm*|xterm*|rxvt*)
    PS1+='$(echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007")'
    ;;
esac
