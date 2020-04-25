" started trying this because of: https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/.vimrc

" ---======= ::: PLUGINS ::: =======---
" Install Vimplug If Not Installed:
" {{{
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	silent !mkdir -p ~/.config/nvim/pluggos/
	autocmd VimEnter * PlugInstall
endif
" }}} ===-0-=== END Install Vimplug If Not Installed 


" Loading The Plugins:  ::: =======---
" {{{
call plug#begin('~/.config/nvim/pluggos')
	Plug 'kien/ctrlp.vim'

	Plug 'valloric/youcompleteme'
	" Complete The YCM Install:
	" :sudo apt install build-essential cmake vim python3-dev
	" :cd ~/.config/nvim/pluggos/youcompleteme
	" :python3 install.py --all

	" Extra Language Support:
	Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': ['php', 'html'] }
	Plug 'StanAngeloff/php.vim', { 'for': 'php' }

	" Visual Stuff:
	Plug 'machakann/vim-highlightedyank' "shows you what you just yanked - I love this
	Plug 'Yggdroot/indentLine'  "show indent guides
	Plug 'ap/vim-css-color', { 'for': ['php', 'css', 'html', 'vim'] }		"show colour
	Plug 'andymass/vim-matchup', { 'for': ['php', 'html'] }  " shows matching tags in html

" }}} ===-0-=== END Loading The Plugins


" Plugin Configs:  ::: =======---
" {{{

let g:ctrlp_use_caching = 0


nnoremap <silent> sd :YcmCompleter GoTo<CR>
nnoremap <silent> sf :YcmCompleter FixIt<CR>


" }}} ===-0-=== END Plugins Configs
