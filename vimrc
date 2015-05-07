set nocompatible
filetype off

silent! if plug#begin('~/.vim/plugged')

" Defaults
Plug 'tpope/vim-sensible'

if hostname() != "pi"
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Colors
  Plug 'junegunn/seoul256.vim'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'jnurmine/Zenburn'
  Plug 'fugalh/desert.vim', { 'dir': '~/.vim/plugged/desert.vim/colors' }
endif

" Navigation
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-bufferline'
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
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript'] }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'fatih/vim-go'
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'Shougo/neocomplcache.vim'
if hostname() != "pi"
  Plug 'SirVer/ultisnips'
endif
Plug 'honza/vim-snippets'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

call plug#end()
endif

" ============================================================================
" Basic settings
" ============================================================================

" Leader
let mapleader      = ','
let maplocalleader = ','

" Vim
set number
set lazyredraw
" set visualbell
set timeoutlen=500 " time to wait for key code, mapped key sequence
set history=1000                    " Store a ton of history (default is 20)
set cursorline                      " Highlight current line
set virtualedit=onemore             " Allow for cursor beyond last character
set guifont=Source\ Code\ Pro\ 9
filetype plugin indent on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Directories
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Search
set hlsearch
set incsearch
set ignorecase smartcase

set hidden
set scrolloff=5

" Formating
" set whichwrap=b,s " Default
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set smartindent
set list
set foldlevelstart=99
set foldmethod=indent

" set listchars=tab:\|\ ,
" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪
set diffopt=filler,vertical

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

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

" highlight clear SignColumn           " SignColumn should match background
" highlight clear LineNr               " Current line number row will have same background color in relative mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

" Directories
if has('persistent_undo')
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

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" Reload vim rc
nmap <Leader>s :source $MYVIMRC

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
call s:map_change_option('l', 'list')
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
