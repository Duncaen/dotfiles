#!/bin/sh

msg() { t=$1; shift; printf '%s: %s\n' "$t" "$@"; }

_ln_home() {
	[ -z "$2" ] && tgt="$HOME/$1" || tgt="$HOME/$2"
	src="$PWD/$1"
	[ -e "$tgt" ] && mv "$tgt" "$tgt.bak"
	ln -sf "$src" "$tgt"
}
_mkdir() {
	for x; do
		mkdir -p "$HOME/$x"
	done
}

_vim() {
	[ -n "$(command -v vim 2>/dev/null)" ] || return
	msg "INSTALL" "vim config"
	_ln_home "vimrc" ".vimrc"
	_ln_home "vim" ".vim"
	# install plugins
	# vim +PlugInstall +qall
}
_xorg() {
	[ -n "$(command -v Xorg 2>/dev/null)" ] || return
	msg "INSTALL" "xorg config"
	_ln_home "xinitrc" ".xinitrc"
	_ln_home "Xresources" ".Xresources"
	_ln_home "us-intl-german.xmodmap" ".us-intl-german.xmodmap"
}
_fonts() {
	[ -n "$(command -v Xorg 2>/dev/null)" ] || return
	msg "INSTALL" "fontconfig config"
	_mkdir ".config/fontconfig"
	_ln_home "fonts.conf" ".config/fontconfig/fonts.conf"
}
_mksh() {
	[ -n "$(command -v mksh 2>/dev/null)" ] || return
	msg "INSTALL" "mksh config"
	_ln_home "mkshrc" ".mkshrc"
}
_yash() {
	[ -n "$(command -v yash 2>/dev/null)" ] || return
	msg "INSTALL" "yash config"
	_ln_home "yashrc" ".yashrc"
}
_shell() {
	msg "INSTALL" "shell config"
	_ln_home "profile" ".profile"
	_ln_home "inputrc" ".inputrc"
	_ln_home "aliases" ".aliases"
}
_git() {
	[ -n "$(command -v git 2>/dev/null)" ] || return
	msg "INSTALL" "git config"
	_ln_home "gitconfig" ".gitconfig"
	_ln_home "gitignore_global" ".gitignore_global"
}
_void() {
	[ -n "$(command -v xbps-install 2>/dev/null)" ] || return
	msg "INSTALL" "void config"
	_ln_home "xbps-src.conf" ".xbps-src.conf"
}
_ssh() {
	[ -n "$(command -v ssh 2>/dev/null)" ] || return
	msg "INSTALL" "ssh config"
	mkdir -p "$HOME/.ssh"
	_ln_home "ssh/config" ".ssh/config"
}
_bin() {
	msg "INSTALL" "user bin directory"
	_ln_home "bin"
}
_runit() {
	[ -n "$(command -v runsvdir 2>/dev/null)" ] || return
	msg "INSTALL" "runit user services"
	_ln_home "sv"
	_ln_home "service"
	_ln_home "service.x"
}
_gtk() {
	[ -n "$(command -v Xorg 2>/dev/null)" ] || return
	msg "INSTALL" "gtk config"
	_ln_home "gtkrc-2.0" ".gtkrc-2.0"
	_ln_home "gtk-3.0" ".config/gtk-3.0"
}

: ${PWD:=$(pwd)}
: ${HOME:=~}

_mksh
_yash
_shell
_bin
_runit
_git
_xorg
_fonts
_vim
_void
_ssh
_gtk
