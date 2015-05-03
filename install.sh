#!/bin/sh

user=duncan
dotfiles=${PWD}

rm -v /home/$user/.vimrc
ln -sfv $dotfiles/vimrc /home/$user/.vimrc

rm -v /home/$user/.vim
ln -sfv $dotfiles/vim /home/$user/.vim

rm -v /home/$user/.xinitrc
ln -sfv $dotfiles/xinitrc /home/$user/.xinitrc

rm -v /home/$user/.mkshrc
ln -sfv $dotfiles/mkshrc /home/$user/.mkshrc

rm -v /home/$user/.stalonetrayrc
ln -sfv $dotfiles/stalonetrayrc /home/$user/.stalonetrayrc

rm -v /home/$user/.inputrc
ln -sfv $dotfiles/inputrc /home/$user/.inputrc

# install plugins
# vim +PlugInstall +qall
