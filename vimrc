set nocompatible
filetype off

sil! if plug#begin('~/.vim/plugged')

if v:version >= 800 && (has('python') || has('python3'))
	Plug 'maralla/completor.vim'
endif

Plug 'ctrlpvim/ctrlp.vim', { 'on': '<plug>(ctrlp)' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()
endif

" ============================================================================
" Basic settings
" ============================================================================

set autoread                " automatically read changed files

" syntax
syntax off                  " no syntax highlighting by default
sil! colorscheme shblah     " default colorscheme
let g:is_kornshell = 1      " ksh syntax by default

" interface
set cursorline              " highlight current line
sil! set colorcolumn=80     " show line after 80 chars
set list                    " show tabs, whitespaces etc
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set vb t_vb=                " disable beep
set timeoutlen=500          " time to wait for key code, mapped key sequence

" search
set incsearch               " match search while typing
set hlsearch                " hightligt search results
set smartcase               " search casesensitive if pattern contains uppercase chars
set ignorecase              " overwritten by smartcase if it contains uppercase chars

" compelete
set complete-=i
set completeopt=longest,menuone

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db

" directories
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" histroy/undo
set history=1000            " store a ton of history (default is 20)
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone

" Formating
set backspace=indent,eol,start
filetype plugin indent on
set autoindent
set smartindent
set smarttab
set foldlevelstart=99

" ============================================================================
" MAPPINGS
" ============================================================================

let mapleader      = ','
let maplocalleader = ','

" w!! to write with doas/sudo
if executable('doas')
	cmap w!! w !doas tee % >/dev/null
else
	cmap w!! w !sudo tee % >/dev/null
endif

command! W w    " too often i type W instead of w
nnoremap Y y$   " Make Y behave like other capitals
nnoremap Q @q   " qq to record, Q to replay

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" ,s - reload vim rc
nmap <leader>s :source $MYVIMRC<cr>

" ,c - toggle comment
nmap <leader>c <plug>Commentary
vmap <leader>c <plug>Commentary

" ctrlp plugin on-demand loading
map <c-p> <plug>(ctrlp)
let g:ctrlp_map = ''

" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim) from: https://github.com/junegunn/dotfiles
" ----------------------------------------------------------------------------
fu! s:map_change_option(...)
	let [key, opt] = a:000[0:1]
	let op = get(a:, 3, 'set '.opt.'!')
	execute printf("nnoremap <silent> co%s :%s<bar>echo '%s: '. &%s<cr>", key, op, opt, opt)
endf

call s:map_change_option('c', 'spell', 'setlocal spell!')
call s:map_change_option('n', 'number', 'setlocal number!')
call s:map_change_option('h', 'hlsearch', 'setlocal hlsearch!')
call s:map_change_option('l', 'list', 'setlocal list!')
call s:map_change_option('p', 'paste')
call s:map_change_option('s', 'syntax',
	\ 'if exists("g:syntax_on")<bar>syntax off<bar>else<bar>syntax enable<bar>endif<bar>redraw')
call s:map_change_option('t', 'textwidth',
	\ 'let &l:textwidth = input("textwidth (". &l:textwidth ."): ")<bar>redraw')
call s:map_change_option('w', 'wrap', 'setlocal wrap!')

" ============================================================================
" FILETYPES
" ============================================================================

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet
