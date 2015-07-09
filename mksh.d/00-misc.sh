alias wanip='curl ipinfo.io/ip'

function psgrep {
	ps u `pgrep "$1"`
}
