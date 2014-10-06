set nocompatible
filetype off

silent! if plug#begin('~/.vim/plugged')

" Defaults
Plug 'tpope/vim-sensible'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/vim-tomorrow-theme'

" Navigation
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-bufferline'
Plug 'rgarver/Kwbd.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Search
Plug 'mileszs/ack.vim', { 'on': 'Ack' }

" Editing
Plug 'tpope/vim-surround'
Plug 'spf13/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'

" Languages
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript'] }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

call plug#end()
endif

" ============================================================================
" Basic settings
" ============================================================================

let mapleader      = ','
let maplocalleader = ','

set number
set smartindent
set lazyredraw
" set visualbell
set timeoutlen=500
set whichwrap=b,s
set hlsearch
set incsearch
set hidden
set ignorecase smartcase
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set scrolloff=5
set list
" set listchars=tab:\|\ ,
set nojoinspaces
set diffopt=filler,vertical
set autoread
set foldlevelstart=99
set foldmethod=indent
set guifont=Source\ Code\ Pro\ 9
set history=1000                    " Store a ton of history (default is 20)
set cursorline                      " Highlight current line
set virtualedit=onemore             " Allow for cursor beyond last character

" Directories
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Clipboard
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

silent! colo Tomorrow-Night          " default colorscheme

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Mouse
set mouse=a                          " Automatically enable mouse usage
set mousehide                        " Hide the mouse cursor while typing

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
highlight clear SignColumn           " SignColumn should match background
highlight clear LineNr               " Current line number row will have same background color in relative mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

" Directories
set backupdir^=~/.vim/backup//
set directory^=~/.vim/swapfiles//
if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
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
endif

" ============================================================================
" MAPPINGS
" ============================================================================

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

"to create a new line cmd mode without going to insert
nmap <leader>k O<esc>k0
nmap <leader>j o<esc>j0

"Break a line into two and retain cursor position
nmap <leader>b i<cr><esc>k$

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" <F10> | <leader>e NERD Tree
map <leader>e :NERDTreeToggle<CR>
inoremap <F10> <esc>:NERDTreeToggle<cr>
nnoremap <F10> :NERDTreeToggle<cr>

" <F11> | Tagbar
if v:version >= 703
  inoremap <F11> <esc>:TagbarToggle<cr>
  nnoremap <F11> :TagbarToggle<cr>
  let g:tagbar_sort = 0
endif

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" #!! | Shebang
" ----------------------------------------------------------------------------
iabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" ============================================================================
" FUNCTIONS & COMMANDS
" ============================================================================

" ----------------------------------------------------------------------------
" co? : Toggle options (inspired by unimpaired.vim) from: https://github.com/junegunn/dotfiles
" ----------------------------------------------------------------------------
function! s:map_change_option(...)
  let [key, opt] = a:000[0:1]
  let op = get(a:, 3, 'set '.opt.'!')
  execute printf("nnoremap co%s :%s<bar>echo '%s: '. &%s<cr>",
        \ key, op, opt, opt)
endfunction

call s:map_change_option('p', 'paste')
call s:map_change_option('n', 'number')
call s:map_change_option('w', 'wrap')
call s:map_change_option('h', 'hlsearch')
call s:map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call s:map_change_option('t', 'textwidth',
      \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call s:map_change_option('b', 'background',
      \ 'let &background = &background == "dark" ? "light" : "dark"<bar>redraw')


" ----------------------------------------------------------------------------
" <F8> | Color scheme selector from: https://github.com/junegunn/dotfiles
" ----------------------------------------------------------------------------
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list =
          \ sort(map(
          \   filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
          \   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>


" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let me = expand('%:p:h')
  let gitd = finddir('.git', me.';')
  if empty(gitd)
    echo "Not in git repo"
  else
    let gitp = fnamemodify(gitd, ':h')
    echo "Change directory to: ".gitp
    execute 'lcd' gitp
  endif
endfunction
command! Root call s:root()


" ----------------------------------------------------------------------------
" Load plugin settings
" ----------------------------------------------------------------------------
silent! so ~/.vim/settings.vim
