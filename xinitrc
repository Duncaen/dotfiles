#!/bin/sh

[ -d /etc/X11/xinit/xinitrc.d ]; && \
	for f in /etc/X11/xinit/xinitrc.d/*; do; [ -x "$f" ] && . "$f"; done && \
	unset f

[ -r ~/.wallpaper/default ] && \
	feh --bg-fill --no-fehbg ~/.wallpaper/default || \
	feh --recursive --randomize --bg-fill --no-fehbg ~/.wallpaper

setxkbmap \
	-layout 'us(altgr-intl),de(nodeadkeys)' \
	-option 'grp:shifts_toggle,compose:menu'
xmodmap ~/.us-intl-german.xmodmap

xrdb -merge ~/.Xresources
xset b off

# display colors
[ $(command -v sct 2>/dev/null) ] && sct 4400

[ "$(hostname)" = "fly" ] && xinput \
	--set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1 \
	--set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2 \
	--set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200 \
	--set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5 \
	--set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95

exec $STARTUP runsvdir -P ~/service.x 'log: ...........................................................................................................................................................................................................................................................................................................................................................................................................'
