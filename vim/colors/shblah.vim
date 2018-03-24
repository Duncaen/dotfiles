" ┏━┓╻ ╻┏┓ ╻  ┏━┓╻ ╻   ╻ ╻╻┏┳┓
" ┗━┓┣━┫┣┻┓┃  ┣━┫┣━┫   ┃┏┛┃┃┃┃
" ┗━┛╹ ╹┗━┛┗━╸╹ ╹╹ ╹ ╹ ┗┛ ╹╹ ╹
"                           -- by z3bra
" =====================================
"
" A 16 colors scheme that use your terminal colors

" set background=dark
if version > 580
    highlight clear
    if exists("g:syntax_on")
        syntax reset
    endif
endif
let g:colors_name="shblah"

if &background == "dark"
	hi ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=8
	hi Comment      term=NONE cterm=NONE ctermfg=8    ctermbg=NONE
	hi Constant     term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
	hi Cursor       term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
	hi CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
	hi DiffAdd      term=NONE cterm=NONE ctermfg=2    ctermbg=NONE
	hi DiffChange   term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
	hi DiffDelete   term=NONE cterm=NONE ctermfg=7    ctermbg=1
	hi DiffText     term=NONE cterm=NONE ctermfg=7    ctermbg=4
	hi Directory    term=NONE cterm=NONE ctermfg=4    ctermbg=0
	hi Error        term=NONE cterm=NONE ctermfg=0    ctermbg=1
	hi ErrorMsg     term=NONE cterm=NONE ctermfg=1    ctermbg=0
	hi FoldColumn   term=NONE cterm=NONE ctermfg=0    ctermbg=NONE
	hi Folded       term=NONE cterm=NONE ctermfg=0    ctermbg=NONE
	hi Function     term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	hi Identifier   term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
	hi IncSearch    term=NONE cterm=NONE ctermfg=0    ctermbg=5
	hi NonText      term=NONE cterm=NONE ctermfg=8    ctermbg=NONE
	hi Normal       term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	hi Pmenu        term=NONE cterm=NONE ctermfg=7    ctermbg=7
	hi PreProc      term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	hi Search       term=NONE cterm=NONE ctermfg=0    ctermbg=5
	hi Special      term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
	hi SpecialKey   term=NONE cterm=NONE ctermfg=NONE    ctermbg=NONE
	hi Statement    term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	hi StatusLine   term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	" highlight StatusLineNC term=NONE cterm=NONE ctermfg=0    ctermbg=NONE
	hi String       term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
	hi TabLineSel   term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	hi Todo         term=NONE cterm=NONE ctermfg=7    ctermbg=1
	hi Type         term=NONE cterm=NONE ctermfg=4    ctermbg=NONE
	hi Underlined   term=underline cterm=underline ctermfg=NONE   ctermbg=NONE
	hi VertSplit    term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
	hi Visual       term=NONE cterm=NONE ctermfg=0    ctermbg=7
	hi WarningMsg   term=NONE cterm=NONE ctermfg=3    ctermbg=NONE
	
	hi Pmenu        term=NONE cterm=NONE ctermfg=7    ctermbg=8
	hi PmenuSel     term=NONE cterm=NONE ctermfg=2    ctermbg=8
else
	hi CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
	hi SpecialKey   term=NONE cterm=bold ctermfg=7    ctermbg=NONE
	hi Search    term=NONE cterm=NONE ctermfg=0    ctermbg=5
endif

" General highlighting group links.
hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
hi! link Title           Normal
hi! link LineNr          Comment
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup

" Test the actual colorscheme
syn match Comment      "\"__Comment.*"
syn match Constant     "\"__Constant.*"
syn match Cursor       "\"__Cursor.*"
syn match CursorLine   "\"__CursorLine.*"
syn match DiffAdd      "\"__DiffAdd.*"
syn match DiffChange   "\"__DiffChange.*"
syn match DiffText     "\"__DiffText.*"
syn match DiffDelete   "\"__DiffDelete.*"
syn match Folded       "\"__Folded.*"
syn match Function     "\"__Function.*"
syn match Identifier   "\"__Identifier.*"
syn match IncSearch    "\"__IncSearch.*"
syn match NonText      "\"__NonText.*"
syn match Normal       "\"__Normal.*"
syn match Pmenu        "\"__Pmenu.*"
syn match PreProc      "\"__PreProc.*"
syn match Search       "\"__Search.*"
syn match Special      "\"__Special.*"
syn match SpecialKey   "\"__SpecialKey.*"
syn match Statement    "\"__Statement.*"
syn match StatusLine   "\"__StatusLine.*"
syn match StatusLineNC "\"__StatusLineNC.*"
syn match String       "\"__String.*"
syn match Todo         "\"__Todo.*"
syn match Type         "\"__Type.*"
syn match Underlined   "\"__Underlined.*"
syn match VertSplit    "\"__VertSplit.*"
syn match Visual       "\"__Visual.*"

"__Comment              /* this is a comment */
"__Constant             var = SHBLAH
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           line changed from file.orig
"__DiffText             actual changes on this line
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what you're searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__Underlined           Anything underlined
"__VertSplit            :vsplit will only show ' | '
"__Visual               Selected text looks like this
