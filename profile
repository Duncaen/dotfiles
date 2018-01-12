: ${BROWSER:=$(command -v firefox 2>/dev/null)}
: ${BROWSER:=$(command -v chromium 2>/dev/null)}

: ${EDITOR:=$(command -v vim 2>/dev/null)}
: ${EDITOR:=$(command -v vi 2>/dev/null)}
: ${VISUAL:="$EDITOR"}

: ${GOPATH:="$HOME/go"}

: ${PAGER:=$(command -v less 2>/dev/null)}
: ${MANWIDTH:=80}

: ${GCC_COLORS:="locus=34"}

PATH="$HOME/bin:/usr/local/bin:/usr/local/lobase/bin:$PATH:$GOPATH/bin:/usr/local/plan9/bin"

export BROWSER EDITOR GOPATH MANWIDTH PAGER PATH VISUAL GCC_COLORS
