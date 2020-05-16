colorscheme minimalist

set showtabline=2         " show tabs if more than 1
set laststatus=2          " show status bar
set cmdheight=2           " taller command line

" vice looks like it might be a decent colorscheme
"set background=dark
set termguicolors
set t_Co=256

hi Search cterm=undercurl,standout ctermfg=Yellow	guifg=Yellow
hi Comment cterm=italic,reverse

hi MatchParen cterm=undercurl ctermbg=none ctermfg=none 

hi IncSearch guibg=Yellow ctermbg=Yellow term=underline
hi Pmenu ctermbg=gray guibg=gray ctermfg=lightgray guifg=lightgray
hi PmenuSel ctermbg=darkgray guibg=darkgray ctermfg=white guifg=white

highlight ColorColumn ctermbg=6 guibg=lightgrey
