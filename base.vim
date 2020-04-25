syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Changed Vimdamentals:
" {{{
" LEADER: make space the leader, make it stop moving us & give us a bit more time
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
let g:mapleader="\<Space>"
set timeoutlen=1200 " modify leader time

" Escaping Insert Mode & Stay In The Same Place
inoremap ii <Esc>l
inoremap II <Esc>l
inoremap <Esc> <Esc>l
vnoremap ii <Esc>
nnoremap <Leader>i <Esc>
nnoremap <Leader>I <Esc>:call CapsOff()<CR>:<Backspace>

" exit insert mode and start moving up or down:
inoremap jj <Esc>lj
inoremap kk <Esc>lk
"visual block seems more useful for my workflow:
nnoremap <Leader>v v
nnoremap v <C-v>

" copy & paste to 'regular' clipboard & keep visual modes
nmap <C-v> "+P
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "*y :let @+=@*<CR>:echo "a vim noob just copied something"<CR>gv
vnoremap <C-v> "+P

nnoremap <Leader>; :

" Big Jump Navs
" map J so we can still Join lines (and keep cursor in position):
vnoremap <Leader>jl J
nnoremap <Leader>jl mzJ`z
" map K so we can still see info
nnoremap <Leader>kk K
vnoremap <Leader>kk K
nmap J <PageDown>4kzz0
nmap K <PageUp>4jzz0
vmap J <PageDown>4kzz0
vmap K <PageUp>4jzz0


"  END changed Vimdamentals }}}

" SETS: 
" {{{
set hidden								" lets you use buffers in the background easier
set number relativenumber " show relative line numbers
set mouse=na              " yeah, mice are neat, sometimes
set keymodel=startsel     " Allow select of text in insert mode using shift
set confirm               " confirm before doing 'major' stuff
set incsearch!            " stop jumping to 'best match so far' as typed
set ignorecase smartcase  " ignore case for search unless search includes caps
set wrapscan							" Searches wrap around the end of the file
set virtualedit=onemore   " cursor can go after last chraracter
set scrolloff=3           " Keep a few lines visible above/below
set whichwrap+=<,>,h,l,[,]  " navigate around end of lines
set tabstop=2 shiftwidth=2 softtabstop=2 " expandtab
set showmatch             " show matching brackets

set smartindent copyindent " indenting

set lazyredraw            " Speed up macros
set diffopt+=vertical     " Prefer vertical orientation when using :diffsplit

" swaps, backups, undos
set directory=~/.config/nvim/swaps/
set backupdir=~/.config/nvim/backups/
set undodir=~/.config/nvim/undos/
set undofile
set undolevels=1000
set undoreload=1000
" }}} END SETS

" Searching Moving Around And Leaving Buffers:
" {{{
nnoremap <Leader>qq :qa!<CR>
nnoremap <Leader>QQ :qa!<CR>
vnoremap <Leader>qq :qa!<CR>
vnoremap <Leader>QQ :qa!<CR>
nnoremap <Leader>wa :wa<CR>: echo "Saving All"<CR>
nnoremap <Leader>wq :wqa<CR>
nnoremap <Leader>ee :exit<CR>
nnoremap <Leader>oo :only<CR>
nnoremap <Leader>bo :%bd\|e#<CR>
nnoremap <Leader>b  :b
" List Buffers, then start buffer switch
nnoremap <leader>ls :ls<CR>:b
" quick buffer moves
nnoremap <Leader>w <c-w>

" file save
nnoremap <Leader>fs :w<CR>:echo "File Saved"<CR>


" Open a search results window for last search:
nnoremap <silent> <Leader>s :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" Open a search results window for selected:
nnoremap <silent> <Leader>S yiw:execute 'vimgrep <C-r>" **/*'<CR>:copen<CR>
vnoremap <silent> <Leader>S y:execute 'vimgrep <C-r>" **/*'<CR>:copen<CR>

" File Explore:
nnoremap <Leader>fe :wincmd v<bar> :Ex <bar> :vertical resize	28<CR>
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle = 3		" tree-like listing of directories in netrw
let g:netrw_winsize = 18		" set width of explorer window
let g:netrw_banner=0        " no banner in explorer
let g:netrw_list_hide=netrw_gitignore#Hide()
" END bufers & searchings }}}

" Modify Text:
"{{{

" indent behaviours
vnoremap = =gv
vnoremap < <gv
vnoremap > >gv
nnoremap > m`>>``ll
nnoremap < m`<<``hh

" Drag Lines
noremap  <A-k> :m-2<CR>
vnoremap <A-k> :m-2<CR>gv=gv
noremap  <A-j> :m+<CR>
vnoremap <A-j> :m'>+<CR>gv=gv

"}}}
