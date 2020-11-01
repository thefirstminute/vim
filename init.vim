" Main Vimdamentals:
	source $HOME/.config/nvim/base.vim
" Speed Typor N Fix Typos:
	source $HOME/.config/nvim/autotext.vim
" Bloat Etc:
	source $HOME/.config/nvim/fluff.vim

" The Plugins And Philosphy Of The Vim:
	" (Pick One)
	" include ctrl p ycm functionality:
	" source $HOME/.config/nvim/ctrlP-YCM.vim
	" include coc functionality: 
	"source $HOME/.config/nvim/coc.vim
	" coc, but using ultisnips and airline - 
    " remove statusline stuff from minimalooks
	source $HOME/.config/nvim/coc-snips.vim

" How Do We Want It To Look:
	"colorscheme desert
	source $HOME/.config/nvim/minimalooks.vim

" DISABLE AUTO LINE COMMENTS:!!! 
	" (but still automatically remove comments on join)
	" This needs to stay at the end to work...for some reason??
	au FileType * set fo-=c fo-=r fo-=o fo+=j
