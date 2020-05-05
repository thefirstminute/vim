set showtabline=2         " show tabs if more than 1
set laststatus=2          " show status bar
set cmdheight=2           " taller command line

" vice looks like it might be a decent colorscheme
"set background=dark
set termguicolors
set t_Co=256
colorscheme minimalist

"sql syntax highlighting inside string
let php_sql_query = 1

set guifont=Ubuntu_Mono_Regular:h15:w5		" courier_new:h14:w5:b:cRUSSIAN

hi Search cterm=undercurl,standout ctermfg=Yellow	guifg=Yellow
hi Comment cterm=italic,reverse

hi MatchParen cterm=undercurl ctermbg=none ctermfg=none 

hi IncSearch guibg=Yellow ctermbg=Yellow term=underline
hi Pmenu ctermbg=gray guibg=gray ctermfg=lightgray guifg=lightgray
hi PmenuSel ctermbg=darkgray guibg=darkgray ctermfg=white guifg=white

set tabpagemax=15
"hi TabLine				ctermfg=255     ctermbg=239     cterm=NONE      guifg=#EEEEEE       guibg=#4E4E4E   gui=bold
"hi TabLineFill    ctermfg=255     ctermbg=239     cterm=NONE      guifg=#EEEEEE       guibg=#4E4E4E   gui=NONE
"hi TabLineSel     ctermfg=255     ctermbg=239     cterm=bold			guifg=#4E4E4E       guibg=#EEEEEE   gui=NONE


"STATUSLINE:
" was using this before airline...
"set statusline=
"set statusline+=[%n]						"buffer number
""set statusline+=%#error#				"switch to error highlight
"set statusline+=%#todo#					"switch to todo highlight
"set statusline+=%h%m%r%w        "flags: help,modified,readonly,write
"set statusline+=%*							"switch back to normal statusline highlight
""set statusline+=%<%.99f					"99 char tail of the filename
"set statusline+=%F							"full filename
"""set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"""set statusline+=%{&fileformat}] "file format
"set statusline+=:%{FileSize()}	"show filesize with function
"set statusline+=%=							"left/right separator
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  "describe what cursor is on
"set statusline+=%c-    				"cursor column
"set statusline+=%l/%L  				"cursor line/total lines
"set statusline+=\ 							"space
""set statusline+=%<							"space
"set statusline+=%P							"percent through doc
"""set statusline+=\ %{strftime('%a\ %b\ %d\ %I:%M%p')}\  "show time and date


"function! FileSize()
"    let bytes = getfsize(expand("%:p"))
"    if bytes <= 0
"        return ""
"    endif
"    if bytes < 1024
"        return bytes
"    else
"        return (bytes / 1024) . "K"
"    endif
"endfunction
