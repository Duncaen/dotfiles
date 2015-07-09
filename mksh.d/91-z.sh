if [ -r /home/duncan/repos/github.com/Duncaen/dotfiles/z/z.sh ]; then
  . /home/duncan/repos/github.com/Duncaen/dotfiles/z/z.sh
  PS1+='$(_z --add "${PWD}")'
fi
