set nocompatible
filetype off

sil! if plug#begin('~/.vim/plugged')

if v:version >= 800 && (has('python') || has('python3'))
	Plug 'maralla/completor.vim'
endif

" Navigation
Plug 'ctrlpvim/ctrlp.vim', { 'on': '<plug>(ctrlp)' }
" Plug 'bling/vim-bufferline'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()
endif

" ============================================================================
" Basic settings
" ============================================================================

let mapleader      = ','
let maplocalleader = ','

set showcmd                 " show current command
set number                  " show line numbers
set list                    " show tabs, whitespaces etc
set cursorline              " highlight current line
set scrolloff=5             " scroll 5 lines before reaching top/bottom
sil! set colorcolumn=80  " show line after 80 chars
set diffopt=filler,vertical " vertical vimdiff
set ruler                   " cursor position in status line
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set laststatus=1            " show the statusline if there are at least two windows
syntax off                  " no syntax highlighting by default
sil! colorscheme shblah  " default colorscheme
let g:is_kornshell = 1      " ksh syntax by default

set visualbell

set timeoutlen=500          " time to wait for key code, mapped key sequence
set history=1000            " store a ton of history (default is 20)

set incsearch               " match search while typing
set hlsearch                " hightligt search results
set smartcase               " search casesensitive if pattern contains uppercase chars
set ignorecase              "

set autoread                " automatically read changed files
set backspace=indent,eol,start

set complete-=i
set completeopt=longest,menuone

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db

" directories
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" Formating
filetype plugin indent on
set autoindent
set tabstop=8
set shiftwidth=8
set smartindent
set smarttab
set foldlevelstart=99
set foldmethod=indent
set textwidth=0             " dont wrap text automatically

" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim) from: https://github.com/junegunn/dotfiles
" ----------------------------------------------------------------------------
fu! s:map_change_option(...)
	let [key, opt] = a:000[0:1]
	let op = get(a:, 3, 'set '.opt.'!')
	execute printf("nnoremap co%s :%s<BAR>echo '%s: '. &%s<CR>", key, op, opt, opt)
endf

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
" ctrlp
" ============================================================================

map <c-p> <plug>(ctrlp)
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }

" ============================================================================
" FILETYPES
" ============================================================================

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet

" ============================================================================
" MAPPINGS
" ============================================================================

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
nmap <Leader>s :source $MYVIMRC<cr>

" ,c - toggle comment
nmap <Leader>c <Plug>Commentary
vmap <Leader>c <Plug>Commentary
