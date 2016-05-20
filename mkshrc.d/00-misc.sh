alias wanip='curl ipinfo.io/ip'

psgrep() { ps up $(pgrep -f $@) 2>&-; }
psofgrep() { lsof -p $(pgrep -f $@ | tr '\012' ,); }
lsofgrep() { lsof $@; }
