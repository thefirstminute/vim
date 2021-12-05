set t_Co=256
set keymodel=startsel    " Allow select of text in insert mode using shift
set confirm              " confirm before doing 'major' stuff
set noincsearch          " stop jumping to 'best match so far' as typed
set ignorecase smartcase " ignore case for search unless search includes caps
set wrapscan             " Searches wrap around the end of the file
set title                " show current file in titlebar
set nowrap               " don't wrap my text

set autoindent
set smartindent

""" swaps, backups, undos
" {{{
if !isdirectory($HOME . "/.config/nvim/.backup")
    call mkdir($HOME . "/.config/nvim/.backup", "p", 0700)
endif
if !isdirectory($HOME . "/.config/nvim/.undo")
    call mkdir($HOME . "/.config/nvim/.undo", "p", 0700)
endif
if !isdirectory($HOME . "/.config/nvim/.swap")
    call mkdir($HOME . "/.config/nvim/.swap", "p", 0700)
endif
if !isdirectory($HOME . "/.config/nvim/.session")
    call mkdir($HOME . "/.config/nvim/.session", "p", 0700)
endif
set backupdir=~/.config/nvim/.backup/
set directory=~/.config/nvim/.swap/
set undodir=~/.config/nvim/.undo/
set undofile
set undolevels=1000
set undoreload=1000
set swapfile

" }}}

set foldmethod=marker
set foldmarker={{{,}}}
set foldlevel=0
" set nofoldenable

"See invisible chars:
set list
set listchars=tab:⎸\ ,nbsp:⎕
set listchars+=trail:
