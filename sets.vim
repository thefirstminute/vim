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
set directory=~/.config/nvim/dump/swaps/
set backupdir=~/.config/nvim/dump/backups/
set undodir=~/.config/nvim/dump/undos/
set undofile
set undolevels=1000
set undoreload=1000
set foldmethod=marker
set foldlevel=1
set nofoldenable

"See invisible chars:
set list
set listchars=tab:⎸\ ,nbsp:⎕
set listchars+=trail:
