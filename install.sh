#!/bin/sh

msg() { t=$1; shift; printf '%s: %s\n' "$t" "$@"; }

_ln_home() {
	[ -z "$2" ] && tgt="$HOME/$1" || tgt="$HOME/$2"
	src="$PWD/$1"
	[ -e "$tgt" ] && mv "$tgt" "$tgt.bak"
	ln -sf "$src" "$tgt"
}
_mkdir() {
	mkdir -p $@
}

_vim() {
	msg "INSTALL" "vim config"
	_ln_home "vimrc" ".vimrc"
	_ln_home "vim" ".vim"
	# install plugins
	# vim +PlugInstall +qall
}
_xorg() {
	msg "INSTALL" "xorg config"
	_ln_home "xinitrc" ".xinitrc"
	_ln_home "Xresources" ".Xresources"
	_ln_home "us-intl-german.xmodmap" ".us-intl-german.xmodmap"
}
_fonts() {
	msg "INSTALL" "fontconfig config"
	_mkdir ".config/fontconfig"
	_ln_home "fonts.conf" ".config/fontconfig/fonts.conf"
}
_mksh() {
	msg "INSTALL" "mksh config"
	_ln_home "mkshrc" ".mkshrc"
}
_shell() {
	msg "INSTALL" "shell config"
	_ln_home "profile" ".profile"
	_ln_home "inputrc" ".inputrc"
	_ln_home "aliases" ".aliases"
}
_git() {
	msg "INSTALL" "git config"
	_ln_home "gitconfig" ".gitconfig"
	_ln_home "gitignore_global" ".gitignore_global"
}
_void() {
	msg "INSTALL" "void config"
	_ln_home "xbps-src.conf" ".xbps-src.conf"
}
_ssh() {
	msg "INSTALL" "ssh config"
	mkdir -p "$HOME/.ssh"
	_ln_home "ssh/config" ".ssh/config"
}
_bin() {
	msg "INSTALL" "user bin directory"
	_ln_home "bin"
}
_sv() {
	msg "INSTALL" "user services"
	_ln_home "sv"
	_ln_home "service"
	_ln_home "service.x"
}
_gtk() {
	msg "INSTALL" "gtk config"
	_ln_home "gtkrc-2.0" ".gtkrc-2.0"
	_ln_home "gtk-3.0" ".config/gtk-3.0"
}

: ${PWD:=$(pwd)}
: ${HOME:=~}

_mksh
_shell
_bin
_sv
_git
_xorg
_fonts
_vim
_void
_ssh
_gtk
