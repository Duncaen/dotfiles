set nocompatible
filetype off

silent! if plug#begin('~/.vim/plugged')

if v:version >= 800
	Plug 'maralla/completor.vim'
endif

" Navigation
Plug 'ctrlpvim/ctrlp.vim', { 'on': '<plug>(ctrlp)' }
Plug 'bling/vim-bufferline'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Languages
if hostname() != "pi"
	Plug 'fatih/vim-go', { 'for': ['go'] }
	Plug 'python-rope/ropevim', { 'for': ['python'], 'do': 'python2 setup.py install --user && python3 setup.py install --user' }
endif

call plug#end()
endif

" ============================================================================
" Basic settings
" ============================================================================

" Leader
let mapleader      = ','
let maplocalleader = ','

" interface {{{
set showcmd                 " show current command
set number                  " show line numbers
set list                    " show tabs, whitespaces etc
set cursorline              " highlight current line
set scrolloff=5             " scroll 5 lines before reaching top/bottom
silent! set colorcolumn=80  " show line after 80 chars
set diffopt=filler,vertical " vertical vimdiff
set ruler                   " cursor position in status line
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set laststatus=2            " always show the statusline
" set lazyredraw            " foo
" }}}

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

silent! colorscheme shblah  " default colorscheme

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif



" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim) from: https://github.com/junegunn/dotfiles
" ----------------------------------------------------------------------------
function! s:map_change_option(...)
	let [key, opt] = a:000[0:1]
	let op = get(a:, 3, 'set '.opt.'!')
	execute printf("nnoremap co%s :%s<BAR>echo '%s: '. &%s<CR>", key, op, opt, opt)
endfunction

call s:map_change_option('n', 'number', 'setlocal number!')
call s:map_change_option('h', 'hlsearch', 'setlocal hlsearch!')
call s:map_change_option('l', 'list', 'setlocal list!')
call s:map_change_option('p', 'paste')
call s:map_change_option('w', 'wrap', 'setlocal wrap!')
call s:map_change_option('t', 'textwidth',
	\ 'let &l:textwidth = input("textwidth (". &l:textwidth ."): ")<bar>redraw')


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
" python-mode
" ,b - breakpoint
" <C-c>ra - autoimport module under cursor
" <C-c>g - goto definition
" K - pymode doc
" ============================================================================
" let g:pymode_folding=0

" ============================================================================
" surround
" }/]/) insets without space
" {/[/( insets with space
" mappings:
" cs'" - change ' to "
" ds" - delete "
" ysiw" - wraps word with "
" yss" - wraps line with "
" YS<p> - add <p> around selection lines
" ============================================================================
"foo" bar

" TODO: activate for django templates
" let b:surround_{char2nr("v")} = "{{ \r }}"
" let b:surround_{char2nr("%")} = "{% \r %}"
" let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
" let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
" let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
" let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
" let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" ============================================================================
" FILETYPES
" ============================================================================

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet

" ksh syntax by default
let g:is_kornshell = 1

" ============================================================================
" MAPPINGS
" ============================================================================

" too often i type W instead of w
command! W w

if executable('doas')
	" For when you forget to doas.. Really Write the file.
	cmap w!! w !doas tee % >/dev/null
else
	cmap w!! w !sudo tee % >/dev/null
endif

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" ,s - reload vim rc
nmap <Leader>s :source $MYVIMRC<cr>

" <tab> / <s-tab> | Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ,c - toggle comment
nmap <Leader>c <Plug>Commentary
vmap <Leader>c <Plug>Commentary
