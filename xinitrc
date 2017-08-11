#!/bin/sh

[ -d /etc/X11/xinit/xinitrc.d ] && \
	for f in /etc/X11/xinit/xinitrc.d/*; do [ -x "$f" ] && . "$f"; done && unset f

[ -r ~/.wallpaper/default ] && \
	feh --bg-fill --no-fehbg ~/.wallpaper/default || \
	feh --recursive --randomize --bg-fill --no-fehbg ~/.wallpaper

setxkbmap \
	-layout 'us(altgr-intl),de(nodeadkeys)' \
	-option 'grp:shifts_toggle,compose:menu'
xmodmap ~/.us-intl-german.xmodmap

xrdb -merge ~/.Xresources
xset b off

# color temperature
[ $(command -v sct 2>/dev/null) ] && sct 4400

exec $STARTUP runsvdir -P ~/service.x 'log: ...........................................................................................................................................................................................................................................................................................................................................................................................................'
