#!/bin/sh

user=duncan
dotfiles=${PWD}

rm -v /home/$user/.vimrc
ln -sfv $dotfiles/vimrc /home/$user/.vimrc

rm -v /home/$user/.vim
ln -sfv $dotfiles/vim /home/$user/.vim

rm -v /home/$user/.xinitrc
ln -sfv $dotfiles/xinitrc /home/$user/.xinitrc

rm -v /home/$user/.Xresources
ln -sfv $dotfiles/Xresources /home/$user/.Xresources

rm -v /home/$user/.mkshrc
ln -sfv $dotfiles/mkshrc /home/$user/.mkshrc

rm -v /home/$user/.profile
ln -sfv $dotfiles/profile /home/$user/.profile

rm -v /home/$user/.stalonetrayrc
ln -sfv $dotfiles/stalonetrayrc /home/$user/.stalonetrayrc

rm -v /home/$user/.inputrc
ln -sfv $dotfiles/inputrc /home/$user/.inputrc

rm -v /home/$user/.gitconfig
ln -sfv $dotfiles/gitconfig /home/$user/.gitconfig

rm -v /home/$user/bin
ln -sfv $dotfiles/bin /home/$user/bin

rm -rfv /home/$user/sv
ln -sfv $dotfiles/sv /home/$user/sv

rm -rfv /home/$user/service
ln -sfv $dotfiles/service /home/$user/service

rm -rfv /home/$user/service.x
ln -sfv $dotfiles/service.x /home/$user/service.x

# install plugins
# vim +PlugInstall +qall
