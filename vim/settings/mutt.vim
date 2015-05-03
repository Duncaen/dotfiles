au BufRead /tmp/mutt-* set tw=72

augroup filetypedetect
    autocmd BufRead,BufNewFile *mutt-* setfiletype mail
augroup END
