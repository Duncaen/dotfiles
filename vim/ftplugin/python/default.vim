inoreabbrev <buffer> ifmain if __name__ == '__main__':
" inoreabbrev <buffer> init def __init__(self):
" inoreabbrev <buffer> class class \1:
"
function! s:django_views_settings()
endfunction

function! s:django_urls_settings()
endfunction

function! s:django_models_settings()
				call pymode#rope#autoimport('from django.db import models')
endfunction

for f in ['views', 'models', 'urls']
				execute 'autocmd BufNewFile,BufRead '.f.'.py call s:django_'.f.'()<CR>'
endfor
