#!/bin/sh
# README.sh - generate README file

cat <<! | ./bin/grurls
dotfiles
========

This repository contains my dotfiles, runit services and small scripts.
Many scripts are inspired by or copied from [leah2](http://chneukirchen.org/dotfiles/).

usage
-----

	$ ./install.sh
	# ./install-root.sh

deps
----

- [extarce](https://github.com/chneukirchen/extrace) - trace exec() calls system-wide
- [lr](https://github.com/chneukirchen/lr) - list files, recursively
- [snooze](https://github.com/chneukirchen/snooze) - run a command at a particular time
- [xe](https://github.com/chneukirchen/xe) - simple xargs and apply replacement

- [dmenu](http://tools.suckless.org/dmenu/)
- [dwm](http://dwm.suckless.org/)
- [st](http://st.suckless.org/)

bin/
----

$(git ls-files bin/ | xe awk 'NR==2{if(sub("# ","- ")){print}}')

Proudly presented by

	# git ls-files bin/ | xe awk 'NR==2{if(sub("# ","- ")){print}}'

links
-----

!
