alias ls='ls -hF --color'
alias sl='ls'

alias ltoday='lr -1 -t "mtime >= \"00:00:00\"" -t "! name =~ \"^[.]{1,2}$\""'
alias lftoday='ltoday -t "type == f"'
