" Main Vimdamentals:
	source $HOME/.config/nvim/base.vim
" Speed Typor And Fix Typos:
	source $HOME/.config/nvim/autotext.vim
" Bloat Etc:
	source $HOME/.config/nvim/fluff.vim
" How Do We Want It To Look:
	source $HOME/.config/nvim/minimalooks.vim

" The Plugins And Philosphy Of The Vim:
	" (Pick One)
	" include ctrl p ycm functionality:
	"source $HOME/.config/nvim/ctrlP-YCM.vim
	" include coc functionality: 
	source $HOME/.config/nvim/coc.vim

" DISABLE AUTO LINE COMMENTS:!!! 
	" (but still automatically remove comments on join)
	" This needs to stay at the end to work...for some reason??
	au FileType * set fo-=c fo-=r fo-=o fo+=j
