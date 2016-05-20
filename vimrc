set nocompatible
filetype off

silent! if plug#begin('~/.vim/plugged')

" Defaults
Plug 'tpope/vim-sensible'

" Git
Plug 'airblade/vim-gitgutter'

" Colors
Plug 'chriskempson/vim-tomorrow-theme'

" Navigation
if hostname() != "pi"
Plug 'bling/vim-airline'
endif
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Editing
Plug 'tpope/vim-surround'
Plug 'spf13/vim-autoclose'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'

" Languages
if hostname() != "pi"
" Plug 'SirVer/ultisnips'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript'] }
Plug 'fatih/vim-go'
" Plug 'klen/python-mode', { 'for': 'python' }
Plug 'python-rope/ropevim', { 'do': 'python2 setup.py install --user && python3 setup.py install --user' }
endif
Plug 'plasticboy/vim-markdown'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'Shougo/neocomplete.vim'
" Plug 'honza/vim-snippets'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

call plug#end()
endif

" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]

" ============================================================================
" Basic settings
" ============================================================================

" Leader
let mapleader      = ','
let maplocalleader = ','

set showcmd                 " show current command
set number                  " show line numbers
set list                    " show tabs, whitespaces etc
" set lazyredraw            " foo
set timeoutlen=500          " time to wait for key code, mapped key sequence
set history=1000            " store a ton of history (default is 20)
set cursorline              " highlight current line
set scrolloff=5             " scroll 5 lines before reaching top/bottom
set textwidth=0             " dont wrap text automatically
silent! set colorcolumn=80  " show line after 80 chars
set diffopt=filler,vertical " vertical vimdiff
set incsearch               " match search while typing
set hlsearch                " hightligt search results
set smartcase               " search casesensitive if pattern contains uppercase chars

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
set tabstop=2
set shiftwidth=2
set smartindent
set foldlevelstart=99
set foldmethod=indent

silent! colorscheme Tomorrow-Night          " default colorscheme

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
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
" airline
" ============================================================================
let g:airline_powerline_fonts=1

" ============================================================================
" autoclose
" ============================================================================
let g:autoclose_vim_commentmode=1

" ============================================================================
" ctrlp
" ============================================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }

" The Silver Searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ============================================================================
" fugitive
" ============================================================================
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

" ============================================================================
" NERDcommenter
" ============================================================================
let g:NERDSpaceDelims=1 " add a space before comments, pep8 etc.

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
" tabular
" ============================================================================
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
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

" ============================================================================
" tagbar
" <F11> - toggle tagbar
" ,tt - toggle tagbar
" ============================================================================
nmap <silent> <F11> :TagbarToggle<CR>
nmap <leader>tt <F11>

" ============================================================================
" NERDTree
" <F10> - toggle nerdtree
" ,e - toggle nerdtree
" ============================================================================
nmap <silent> <F10> :NERDTreeToggle<CR>
nmap <leader>e <F10>

" ============================================================================
" FILETYPES
" ============================================================================

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet

" ============================================================================
" MAPPINGS
" ============================================================================

" too often i type W instead of w
command! W w

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

"to create a new line cmd mode without going to insert
nmap <leader>k O<ESC>k0
nmap <leader>j o<ESC>j0

"Break a line into two and retain cursor position
nmap <leader>b i<CR><ESC>k$

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

" ,n - next buffer
nmap <Leader>n :bnext<CR>
" ,p - previous buffer
nmap <Leader>p :bprev<CR>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" #!! | Shebang
" ----------------------------------------------------------------------------
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" ============================================================================
" FUNCTIONS & COMMANDS
" ============================================================================

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
nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>


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
