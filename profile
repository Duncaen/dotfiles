# load system profile
[ -r /etc/profile ] && . /etc/profile

: ${BROWSER:=$(command -v firefox 2>/dev/null)}
: ${BROWSER:=$(command -v chromium 2>/dev/null)}

: ${EDITOR:=$(command -v vim 2>/dev/null)}
: ${EDITOR:=$(command -v vi 2>/dev/null)}
: ${VISUAL:="$EDITOR"}

: ${GOPATH:="$HOME/go"}

: ${PAGER:=$(command -v less 2>/dev/null)}
: ${MANWIDTH:=80}

PATH="$HOME/bin:$PATH:$GOPATH/bin"

export BROWSER EDITOR GOPATH MANWIDTH PAGER PATH VISUAL
