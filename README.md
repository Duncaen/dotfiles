# dotfiles

This repository contains my dotfiles, runit services and small scripts.
Many scripts are inspired by or copied from [leah2](http://chneukirchen.org/dotfiles/).

## usage

	$ ./install.sh
	# ./install-root.sh

## deps

* [extarce](https://github.com/chneukirchen/extrace) - trace exec() calls system-wide
* [lr](https://github.com/chneukirchen/lr) - list files, recursively
* [snooze](https://github.com/chneukirchen/snooze) - run a command at a particular time
* [xe](https://github.com/chneukirchen/xe) - simple xargs and apply replacement
* [dmenu](http://tools.suckless.org/dmenu/)
* [dwm](http://dwm.suckless.org/)
* [st](http://st.suckless.org/)

## bin/

* colors - terminal color and attribute escape sequences
* cppgrep - grep in C/C++ headers
* diffed [-CHT] [-pN] [-s SUBST -r REPL] [-x EXCLUDE] - filter for unified diffs 
* dmoji - dmenu based emoji picker
* errstr errno... - print error string
* fzpsgrep [pattern] - psgrep with fzy selection
* git merge-pr [PRNUM][@REMOTE] [GIT-AM FLAGS...] - list or apply GitHub pull request from command-line
* grurls - substitute and group urls
* h - print the current paths vcs root or home
* hex2rgb [hex ...] - converts hex colors to rgb
* ix FILES... - paste to ix.io
* jour [-d YYYY.MM.DD] [ls|read|write] - simple text journal
* nginx-here [DIR] [PORT] - serve current directory (or DIR) on PORT (or 8080)
* oomtop - lists processes by oom score
* psgrep [pattern] - `ps` for matching processes
* rgb2hex red green blue - converts rgb to hex colors
* s [-w sec] [cmd] [service...] - runit service helper
* sprunge FILES... - paste to sprunge.us
* ssh-copy-term - copy terminfo via ssh
* swaptop - show most swap-using processes
* timer [hh:mm[:ss]]... [[0-9]*[h|m|s]]... -- prog [args...]
* tmux-signal pid [signal] - send signal to running processes in pids session
* tmux-urls - get a list of all visible urls
* twoman CMD... - show comments at the beginning of a script
* unpatch [-pN] FILES... - re-generate patch from files and their .orig version
* venv - small POSIX shell script for python virtualenv
* yiff - colored diff
