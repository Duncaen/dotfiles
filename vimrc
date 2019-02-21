set nocompatible
filetype off

" ============================================================================
" Basic settings
" ============================================================================

set tabstop=4
set shiftwidth=4

set autoread                " automatically read changed files

" syntax
syntax off                  " no syntax highlighting by default
sil! colorscheme shblah     " default colorscheme

" interface
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
set completeopt=menuone,longest

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.db,*.o,*.a

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
" map <c-p> <plug>(ctrlp)
" let g:ctrlp_map = ''

function! FzyCommand(choice_command, vim_command)
	try
		let output = system(a:choice_command . " | fzy ")
	catch /Vim:Interrupt/
		" Swallow errors from ^C, allow redraw! below
	endtry
	redraw!
	if v:shell_error == 0 && !empty(output)
		exec a:vim_command . ' ' . output
	endif
endfunction

let lrigdir = "name =~ \"(\.git|\.hg|CVS)\""
let lrigfil = "name =~ \"\.(so|swp|tar|gz|zip|db|o|a)$\""
let lrfile = printf("lr -Ut 'type == f && ! %s || %s && prune'", lrigfil, lrigdir)
let lrdirs = printf("lr -Ut 'type == d && !(%s && !prune)'", lrigdir)
nnoremap <c-p>p :call FzyCommand(lrfile, ':e')<cr>
nnoremap <c-p>d :call FzyCommand(lrdirs, ':e')<cr>

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
call s:map_change_option('m', 'colorcolumn',
\ 'let &l:colorcolumn = input("colorcolumn (". &l:colorcolumn ."): ")<bar>redraw')

" ============================================================================
" FILETYPES
" ============================================================================

" void-packages template file
autocmd BufNewFile,BufRead template set ft=sh sts=0 sw=0 noet

" dont indent case in switch
set cinoptions+=:0
