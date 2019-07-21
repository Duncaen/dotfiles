[ -r /etc/ksh.kshrc ] && . /etc/ksh.kshrc

[ -z "$SSH_AUTH_SOCK" ] && [ -r ~/.cache/ssh-agent-info ] && \
	. ~/.cache/ssh-agent-info

[ -r ~/.aliases ] && . ~/.aliases

case "$TERM" in
network|dump)
	PS1=$'\001\r''$(\
((r=$?)) && e="?$r" || e=;\
d=${PWD/$HOME/\~}; d=${d##*/};\
[ "$SSH_CONNECTION" ] && s="@${HOSTNAME:=$(hostname)}" || s=;\
((USER_ID)) && i=\$ || i=\#;\
print "$d$s$e$i ")'
;;
xterm|*-256color)
	PS1=$'\001\r\W'$([ "$SSH_CONNECTION" ] && print '@\h')'$(((e=$?)) && print "?\e[0;31;40m$e\e[0m")\$ '
;;
esac
