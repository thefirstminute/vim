" ---======= ::: PLUGINS ::: =======---
" Install Vimplug If Not Installed:
" {{{
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	silent !mkdir -p ~/.config/nvim/plg/
	autocmd VimEnter * PlugInstall
endif
" }}} ===-0-=== END Install Vimplug If Not Installed 

" Loading The Plugins:
" {{{
call plug#begin('~/.config/nvim/plg')
	source $HOME/.config/nvim/plg-cfg/coc.vim
	source $HOME/.config/nvim/plg-cfg/fzf.vim

	" AUTO TEXTS:___________________________________________________________
		source $HOME/.config/nvim/plg-cfg/emmet.vim
		source $HOME/.config/nvim/plg-cfg/ultiSnips.vim

	" LANGUAGE SUPPORT:_____________________________________________________
		"source $HOME/.config/nvim/plg-cfg/php-support.vim

  " OTHER TOOLS: _________________________________________________________
		Plug 'tpope/vim-commentary'  " use 'gc' to comment stuff out
		""Plug 'aserebryakov/vim-todo-lists'
		""source $HOME/.config/nvim/plg-cfg/whichKey.vim
		source $HOME/.config/nvim/plg-cfg/vimSneak.vim
		source $HOME/.config/nvim/plg-cfg/easyAlign.vim
		"Plug 'gioele/vim-autoswap'		" handles swap files better
		Plug 'docunext/closetag.vim'
		Plug 'andymass/vim-matchup', { 'for': ['php', 'html'] }  " shows matching tags in html

	" LOOKS AND VISUAL STUFF: ______________________________________________
		Plug 'dikiaap/minimalist'				" nice dark theme
		Plug 'joshdick/onedark.vim'     " prefer this for airline

		Plug 'machakann/vim-highlightedyank' " I Love This: shows you what you just yanked
		source $HOME/.config/nvim/plg-cfg/airline.vim

		"" Vimdevicons Needs To Load After These Plugins:  
		"" Nerdtree | vim-airline | Ctrlp | Powerline | Denite | Unite | Lightline.Vim | vim-startify | Vimfiler | Flagship
		"source $HOME/.config/nvim/plg-cfg/devIcons.vim " This Needs to be after Coc

call plug#end()
" }}} ===-0-=== END Loading The Plugins 


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
