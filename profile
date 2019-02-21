BROWSER=firefox
EDITOR=vim
PAGER=less
VISUAL=vim

GCC_COLORS="locus=34"

: ${GOPATH:="$HOME/go"}
: ${XDG_RUNTIME_DIR:=/run/$USER}

for x in \
	"/usr/local/bin" \
	"/usr/local/lobase/bin" \
	"/usr/local/lobase/sbin" \
	"$HOME/.local/bin" \
	"$HOME/.cargo/bin" \
	"$HOME/.cabal/bin" \
	"$GOPATH/bin" \
	"$HOME/bin"; do
	[ -d "$x" ] || continue
	case "$PATH" in
	*"$x"*) ;;
	*) PATH="$x:$PATH" ;;
	esac
done

export BROWSER EDITOR PAGER PATH VISUAL GCC_COLORS XDG_RUNTIME_DIR GOPATH
