set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
" git
Plug 'tpope/vim-fugitive'
" visual
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-bufferline'
" navigation
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
" search
Plug 'mileszs/ack.vim'
" editing
Plug 'tpope/vim-surround'
Plug 'spf13/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
" languages
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript'] }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh', 'for': ['python', 'javascript', 'vim', 'scss', 'css'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
call plug#end()


" <leader>
let mapleader = ','
let maplocalleader = ','


" Color setting
silent! colo Tomorrow-Night

" set clipboard
if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif

" encoding
scriptencoding utf-8

" Formatting
set nowrap " Dont wrap long lines
set autoindent " indent at the same level of the previopus line


" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Syntax
syntax on

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
	set colorcolumn=80
endif

" Indention
filetype indent plugin on

autocmd FileType python
	\ setlocal expandtab |
	\ setlocal shiftwidth=4 |
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4

autocmd FileType javascript
	\ setlocal expandtab |
	\ setlocal shiftwidth=4 |
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4

autocmd FileType html
	\ setlocal noexpandtab |
	\ setlocal shiftwidth=4 |
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4


" VIM UI
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set guifont=Source\ Code\ Pro\ 9
set number
set scrolljump=5
set scrolloff=3
set lazyredraw
set hlsearch " CTRL-L / CTRL-R W
set incsearch
set ignorecase                  " Case insensitive search
set list

set backupdir^=~/.vim/backup//
set directory^=~/.vim/swapfiles//

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

"to create a new line cmd mode without going to insert
nmap <leader>k O<esc>k0
nmap <leader>j o<esc>j0

"Break a line into two and retain cursor position
nmap <leader>b i<cr><esc>k$

if has('cmdline_info')
	set showcmd
endif

if has('persistent_undo')
	set undodir=~/.vim/undodir
	set undofile                " So is persistent undo ...
	set undolevels=1000         " Maximum number of changes that can be undone
	set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" automatically change window's cwd to file's dir
"set autochdir

" Code folding options
set foldmethod=indent
set foldlevel=99
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
	\ }
endif

if isdirectory(expand("~/.vim/plugged/ultisnips/"))
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
endif

if isdirectory(expand("~/.vim/plugged/YouCompleteMe/"))
	let g:ycm_key_list_previous_completion=['<Up>']
endif

if isdirectory(expand("~/.vim/plugged/vim-autoclose"))
	" disable " autoclose in vim files
	let g:autoclose_vim_commentmode = 1
endif

if isdirectory(expand("~/.vim/plugged/vim-airline"))
	let g:airline_theme='tomorrow'
	let g:airline_powerline_fonts=0
	let g:airline_left_sep='›' " Slightly fancier than '>'
	let g:airline_right_sep='‹' " Slightly fancier than '<'
endif

if isdirectory(expand("~/.vim/plugged/tagbar/"))
	nnoremap <silent> <leader>tt :TagbarToggle<CR>
endif

" Python-mode
if isdirectory(expand("~/.vim/plugged/python-mode"))
	let g:pymode_rope=0
	let g:pymode_doc=1
	let g:pymode_doc_key='K'
	let g:pymode_lint=1
	let g:pymode_lint_checker="pyflages,pep8"
	let g:pymode_lint_write=1
	let g:pymode_virtualenv=1
	let g:pymode_breakpoint=1
	let g:pymode_breakpoint_key='<leader>b'
	let g:pymode_syntax=1
	let g:pymode_syntax_all=1
	let g:pymode_syntax_indent_errors=g:pymode_syntax_all
	let g:pymode_syntax_space_errors=g:pymode_syntax_all
	let g:pymode_folding=0
endif

if isdirectory(expand("~/.vim/plugged/nerdcommenter"))
	let g:NERDSpaceDelims=1 " add a space before comments, pep8 etc.
endif

" NERD Tree
if isdirectory(expand("~/.vim/plugged/nerdtree"))
	map <C-e> <plug>NERDTreeTabsToggle<CR>
	map <leader>e :NERDTreeToggle<CR>
	nmap <leader>nt :NERDTreeToggle<CR>

	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
	let NERDTreeChDirMode=0
	let NERDTreeQuitOnOpen=1
	let NERDTreeMouseMode=2
	let NERDTreeShowHidden=1
	let NERDTreeKeepTreeInNewTab=1
	let g:nerdtree_tabs_open_on_gui_startup=0
endif


if isdirectory(expand("~/.vim/plugged/tabular"))
	nmap <Leader>a& :Tabularize /&<CR>
	vmap <Leader>a& :Tabularize /&<CR>
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a=> :Tabularize /=><CR>
	vmap <Leader>a=> :Tabularize /=><CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>a:: :Tabularize /:\zs<CR>
	vmap <Leader>a:: :Tabularize /:\zs<CR>
	nmap <Leader>a, :Tabularize /,<CR>
	vmap <Leader>a, :Tabularize /,<CR>
	nmap <Leader>a,, :Tabularize /,\zs<CR>
	vmap <Leader>a,, :Tabularize /,\zs<CR>
	nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
	vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif

if isdirectory(expand("~/.vim/plugged/ack.vim/"))
	nmap <leader <Esc>:Ack!
endif

if isdirectory(expand("~/.vim/plugged/vim-fugitive/"))
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gr :Gread<CR>
	nnoremap <silent> <leader>gw :Gwrite<CR>
	nnoremap <silent> <leader>ge :Gedit<CR>
	" Mnemonic _i_nteractive
	nnoremap <silent> <leader>gi :Git add -p %<CR>
	nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif

" GVIM- (here instead of .gvimrc)
if has('gui_running')
	set guioptions-=T           " Remove the toolbar
	set guioptions-=m           " Remove the menu bar
	set guioptions-=r           " Remove the right-hand scroll bar
	set guioptions-=L           " Remove the left-hand scroll bar
	set lines=40                " 40 lines of text instead of 24
else
	if &term == 'xterm' || &term == 'screen'
		set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
	endif
	"set term=builtin_ansi       " Make arrow and other keys work
endif
