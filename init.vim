syntax on
filetype plugin indent on

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.* mkview!
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Fundamental Configs I Cannot Function Without:
	source $HOME/.config/nvim/vim-cfg/vimdamentals.vim

  " Superfluous Stuff:
  source $HOME/.config/nvim/vim-cfg/superfluous.vim

" Omnicomplete And PopupMenu:
	source $HOME/.config/nvim/vim-cfg/omniPUM.vim

" Plugins:
  source $HOME/.config/nvim/plg-cfg/1plugins.vim

" Look And Feel:
	source $HOME/.config/nvim/vim-cfg/looks.vim

" Speed Typor N Fix Typos:
	source $HOME/.config/nvim/vim-cfg/insertText.vim

" Command Line Text:
	source $HOME/.config/nvim/vim-cfg/cmdText.vim

" Testing Stuff:
	source $HOME/.config/nvim/vim-cfg/testing.vim

" DISABLE AUTO LINE COMMENTS:!!! 
	" (but still automatically remove comments on join)
	" This needs to stay at the end to work...for some reason??
	au FileType * set fo-=c fo-=r fo-=o fo+=j
