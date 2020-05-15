" Window Behaviour :_________________________________________________________
"{{{ 
set foldmethod=marker
set updatecount=25		" rotate swap files every 25 keystrokes (don't lose as much if crashed)
set title							" show file name in titlebar

" Auto Insert Mode For Git Messages:
au FileType gitcommit 1 | startinsert
" }}}


" Changing Vimdamentals:______________________________________________________
"{{{ 
" Quick Macros:
	nnoremap Q @q
	vnoremap Q :norm @q<CR>
	"don't lose ex mode:
	nnoremap <Leader>xm Q

" Make Y Work Like D:
	nnoremap Y y$

" Open New Line Above Or Below This Line In Insert Mode:
	inoremap ikk <Esc>O
	inoremap ijj <Esc>o

" Simpler Redo:
	nnoremap U <C-r>

" Append To End Of Line In Visual Mode:
	vnoremap A <Esc>A

" Stop Interfering With Them Damned Yanks:
	nnoremap x "_x
	vnoremap x "_x
	nnoremap C "_C
	vnoremap C "_C
	nnoremap c "_c
	vnoremap c "_c
	vnoremap p "_dP

" }}} ===--0--=== End Changing Vimdamentals


" Productivity:_______________________________________________________________
"{{{ 

" }}} ===--0--=== End Productivity

" Folding:____________________________________________________________________
"{{{ 
" fold selection (forces manual so it works always)
	vnoremap za <Esc>:set foldmethod=manual<CR>gvzf
" fold {{{}}} selection (forces marker so it works always)
	nnoremap <Leader>zk <Esc>:set foldmethod=marker<CR>za
"fold php (must start on opening php)
	nnoremap <Leader>fphp :set foldmethod=manual<CR>WV/?><CR>zf
"fold tag
	nnoremap <Leader>ftag :set foldmethod=manual<CR>vatzf
"fold inside of {}
	nnoremap <Leader>z{ :set foldmethod=marker<CR>:set foldmarker={,}<CR>za
"Set Fold Methods:
	nnoremap <Leader>fi :set foldmethod=indent<CR>
	nnoremap <Leader>fm :set foldmethod=manual<CR>
	nnoremap <Leader>fk :set foldmethod=marker<CR>
	nnoremap <Leader>fy :set foldmethod=syntax<CR>
	nnoremap <Leader>f{ :set foldmethod=marker<CR>:set foldmarker={,}<CR>
" }}} ===--0--=== End Folding


" Edit Text:_________________________________________________________________
"{{{ 
" placeholder jumper
	inoremap <F5> <Esc>/<++><Enter>ca<
	vnoremap <F5> /<++><Enter>ca<
	nnoremap <F5> /<++><Enter>ca<

" Insert space(s) up/down/around
	nnoremap <leader>sk m`O<Esc>``
	nnoremap <leader>sj m`o<Esc>``
	nnoremap <leader>ss O<CR><CR><CR><CR><CR><CR><CR><Esc>kkk
	nnoremap <leader>sh i <Esc>l
	nnoremap <leader>sl a <Esc>h

"Change Selected (on current line)
	nnoremap <Leader>cl yiw:s/<C-r>"/
	vnoremap <Leader>cl y:s/<C-r>"/

"Change Selected (in this file)
	nnoremap <Leader>cs yiw:%s/<C-r>"/
	vnoremap <Leader>cs y:%s/<C-r>"/

" copy current file/path/directory
	nnoremap <Leader>yf :let @" = expand("%p")<CR>
	nnoremap <Leader>yp :let @" = expand("%:p")<CR>
	nnoremap <Leader>yd :let @" = expand("%:")<CR>

" Drag Lines
	noremap  <A-k> :m-2<CR>
	vnoremap <A-k> :m-2<CR>gv=gv
	noremap  <A-j> :m+<CR>
	vnoremap <A-j> :m'>+<CR>gv=gv

" Quick Yank Registers:
	" delete to x register
	nnoremap <Leader>x "xx
	vnoremap <Leader>x "xx
	" yank to y register
	nnoremap <Leader>y "yy
	vnoremap <Leader>y "yy
	" put from y register
	nnoremap <Leader>p "yp
	vnoremap <Leader>p "yp

" select to end of line
	nnoremap <Leader>ve v$
	vnoremap <Leader>ve $


" }}} ===--0--=== End Productivity



" Functions:__________________________________________________________________
"{{{ 



" }}} ===--0--=== End Functions

" Find N Open N Navigate Stuff:_______________________________________________
"{{{ 

" jump around buffers
	nnoremap <silent> <M-l> :bn<CR>
	nnoremap <silent> <M-h> :bp<CR>

" Opens an edit command with the path of the currently edited file filled in
	nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled
	nnoremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Open File under cursor in split
	nnoremap <Leader>gf <C-w>f

"Search for Text in current directory
	nnoremap <silent><Leader>sd yiw:vimgrepadd <C-r>" % <bar> copen<CR>
	vnoremap <silent><Leader>sd y:vimgrepadd <C-r>" % <bar> copen<CR>

" Search text in current file http://vim.wikia.com/wiki/Search_for_visually_selected_text
	vnoremap / y/\V<C-R>"<CR>
" Open a search results window for last search:
	nnoremap <silent> <Leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" }}} ===--0--=== End Functions

" Misc:_______________________________________________________________________
"{{{ 

" Show Colunm 80
	nnoremap <Leader>col :set colorcolumn=81

" Clear The Command Line
	nnoremap <Backspace> <Nop>
	vnoremap <Backspace> <Nop>
	nnoremap <Backspace> :noh<CR>:<Backspace>

" Add To Wishlist: (type what you want added then select it)
	vnoremap <Leader>wl d:!echo "<C-r>" " >> ~/.config/nvim/wishlist.todo <CR><CR>:echo "Added to wishlist"<CR>

" window 'focus' makes current pane most of the screen
	nnoremap <silent> <Leader>wf <C-w>j:let &winheight = &lines * 7 / 10<CR><C-w>j:let &winwidth = &columns * 7 / 10<CR>

" }}} ===--0--=== End Misc
