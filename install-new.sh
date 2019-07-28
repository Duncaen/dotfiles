#!/bin/sh

: ${DOTFILES_HOME:=$HOME/.dotfiles}

: ${XDG_CACHE_HOME:=$HOME/cache}
: ${XDG_CONFIG_HOME:=$HOME/config}
: ${XDG_DATA_HOME:=$HOME/data}

: ${BIN_HOME:=$HOME/bin}
: ${SV_HOME:=$HOME/sv}
: ${SERVICE_HOME:=$HOME/service}
: ${SERVICEX_HOME:=$HOME/service.x}

cat <<! >&2
XDG_CACHE_HOME = ${XDG_CACHE_HOME}
XDG_CONFIG_HOME = ${XDG_CONFIG_HOME}
XDG_DATA_HOME = ${XDG_DATA_HOME}
BIN_HOME = ${BIN_HOME}
SV_HOME = ${SV_HOME}
SERVICE_HOME = ${SERVICE_HOME}
SERVICEX_HOME = ${SERVICEX_HOME}

!


printf "creating home directory symlinks\n" >&2
ln -sfn "${DOTFILES_HOME}"/config "${XDG_CONFIG_HOME}"
ln -sfn "${DOTFILES_HOME}"/data "${XDG_DATA_HOME}"
ln -sfn "${DOTFILES_HOME}"/cache "${XDG_CACHE_HOME}"
ln -sfn "${DOTFILES_HOME}"/bin "${BIN_HOME}"
ln -sfn "${DOTFILES_HOME}"/sv "${SV_HOME}"
ln -sfn "${DOTFILES_HOME}"/service "${SERVICE_HOME}"
ln -sfn "${DOTFILES_HOME}"/service.x "${SERVICEX_HOME}"

printf "creating compat directory symlinks\n" >&2
ln -sfn "${DOTFILES_HOME}"/config/vim ~/.vim
ln -sfn "${DOTFILES_HOME}"/config/ssh ~/.ssh
ln -sfn "${DOTFILES_HOME}"/config/mblaze ~/.mblaze

printf "creating compat file symlinks\n" >&2
ln -sf "${DOTFILES_HOME}"/config/mksh/mkshrc /home/duncan/.mkshrc
ln -sf "${DOTFILES_HOME}"/config/sh/profile /home/duncan/.profile
ln -sf "${DOTFILES_HOME}"/config/ksh/kshrc /home/duncan/.kshrc
ln -sf "${DOTFILES_HOME}"/config/yash/yashrc /home/duncan/.yashrc
ln -sf "${DOTFILES_HOME}"/config/xorg/xinitrc /home/duncan/.xinitrc
ln -sf "${DOTFILES_HOME}"/config/gtk-2.0/gtkrc-2.0 /home/duncan/.gtkrc-2.0
ln -sf "${DOTFILES_HOME}"/config/readline/inputrc /home/duncan/.inputrc
ln -sf "${DOTFILES_HOME}"/config/tmux/tmux.conf /home/duncan/.tmux.conf

# try to setup firefox profile
for p in ~/.mozilla/firefox/*/places.sqlite; do
	[ -e "$p" ] || continue 
	p="${p%/*}"; p="${p##*/}"
	printf "setting up firefox profile %s\n" "${p}" >&2
	ln -sf ~/.dotfiles/config/firefox/user.js ~/.mozilla/firefox/"$p"/user.js
	ln -sfn ~/.dotfiles/config/firefox/chrome ~/.mozilla/firefox/"$p"/chrome
done

printf "creating default env directory\n"
echo "${HOME}" >"${XDG_DATA_HOME}"/env/HOME
echo "${XDG_CACHE_HOME}" >"${XDG_DATA_HOME}"/env/XDG_CACHE_HOME
echo "${XDG_CONFIG_HOME}" >"${XDG_DATA_HOME}"/env/XDG_CONFIG_HOME
echo "${XDG_DATA_HOME}" >"${XDG_DATA_HOME}"/env/XDG_DATA_HOME
