[ $(command -v fzy) ] || return

function fzpsgrep {
	psgrep "$@" | \
		while read -r l; do
			printf '%s\n' "$l" >2
			fzy | awk '{print $2}'
			break
		done
}

function fzxq {
	echo ${fzy_opts:-"--prompt='xbps-query $@ > '"}
	xq "$@" | fzy ${fzy_opts:-"--prompt='xbps-query $@ > '"} | awk '{print $2}'
}

function fzxi {
	local opt q
	for opt; do
		case $opt in
			-*) break; ;;
			*) q+=" $opt"; shift 1 ;;
		esac
	done
	q=$(fzxq -Rs "$q")
	[ -n "$q" ] || return $?
	xi "$@" "$q"
}
