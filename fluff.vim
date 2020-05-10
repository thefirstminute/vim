" ORGANIZE THIS PILE OF FLUFF: !!!!
set foldmethod=marker

" s can be another leader, and besides; C & cl will do the same thing...
" USING VIM-SNEAK NOW
"vnoremap s <Nop>
"nnoremap s <Nop>
"vnoremap S <Nop>
"nnoremap S <Nop>

" Insert space(s) up/down/around
nnoremap <leader>sk m`O<Esc>``
nnoremap <leader>sj m`o<Esc>``
nnoremap <leader>sa O<CR><CR><CR><CR><CR><CR><CR><Esc>kkk
nnoremap <leader>sh i <Esc>
nnoremap <leader>sl a <Esc>h

" Quick Macros:
nnoremap Q @q
vnoremap Q :norm @q<CR>
"don't lose ex mode:
nnoremap <Leader>xm Q

" make Y work like D
nnoremap Y y$

" simpler redo:
nnoremap U <C-r>

" when jumping to next find, center on screen
nnoremap n nzz
nnoremap N Nzz

" stop interfering with them Damned Yanks
nnoremap x "_x
vnoremap x "_x
nnoremap C "_C
vnoremap C "_C
nnoremap c "_c
vnoremap c "_c
vnoremap p "_dP

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

" auto insert mode for git messages:
au FileType gitcommit 1 | startinsert

" Add To Wishlist: (type what you want added then select it)
vnoremap <Leader>wl d:!echo "<C-r>" " >> ~/.config/nvim/wishlist.todo <CR><CR>:echo "Added to wishlist"<CR>


" window 'focus' makes current pane most of the screen
nnoremap <silent> <Leader>wf <C-w>j:let &winheight = &lines * 7 / 10<CR><C-w>j:let &winwidth = &columns * 7 / 10<CR>


" Opens an edit command with the path of the currently edited file filled in
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled
nnoremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Open File under cursor in split
nnoremap <Leader>gf <C-w>f


"Search for Text in current directory
nnoremap <silent>sd yiw:vimgrepadd <C-r>" % <bar> copen<CR>
vnoremap <silent>sd y:vimgrepadd <C-r>" % <bar> copen<CR>


" Search text in current file http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> <Leader>/ y/\V<C-R>"<CR>
" Open a search results window for last search:
nnoremap <silent> <Leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>


"indent html head
nnoremap <Leader>ih /<head><CR>V100<<Esc>jV/<\/head<CR>=
"indent html body
nnoremap <Leader>ib /<body<CR>V100<<Esc>jV/<\/body<CR>=
" indent inside tag
nnoremap <Leader>it vitB$oW0=


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


" Folding:
" {{{
" toggle folds
nnoremap <Leader><Space> za :noh<CR>
" fold selection (forces manual so it works always)
vnoremap za <Esc>:set foldmethod=manual<CR>gvzf
" fold {{{}}} selection (forces marker so it works always)
nnoremap <Leader>zk <Esc>:set foldmethod=marker<CR>za
" fold selection (forces manual so it works always)
vnoremap <Leader>zf <Esc>:set foldmethod=manual<CR>gvzf
"fold the body tag
nnoremap <Leader>zb :set foldmethod=manual<CR>/<body<CR>jV/<\/body<CR>kzc
"fold the head tag
nnoremap <Leader>zh :set foldmethod=manual<CR>/<head><CR>jV/<\/head<CR>kzc
"fold php (must start on opening php)
nnoremap <Leader>zp :set foldmethod=manual<CR>WV/?><CR>zf
"fold tag
nnoremap <Leader>zt :set foldmethod=manual<CR>vatzf
"fold inside of {}
nnoremap <Leader>z{ :set foldmethod=marker<CR>:set foldmarker={,}<CR>za
"Set Fold Methods:
nnoremap <Leader>fi :set foldmethod=indent<CR>
nnoremap <Leader>fm :set foldmethod=manual<CR>
nnoremap <Leader>fk :set foldmethod=marker<CR>
nnoremap <Leader>fy :set foldmethod=syntax<CR>
nnoremap <Leader>f{ :set foldmethod=marker<CR>:set foldmarker={,}<CR>
"}}}


" Capslock Off When Exiting Insert:
" {{{
" https://www.reddit.com/r/vim/comments/bzbv98/detect_whether_caps_locks_is_on/
" thanks @ransom_cynic
function! CapsStatus()
	let St = systemlist('xset -q | grep "Caps Lock" | awk ''{print $4}''')[0]
	return St
endfunction

function! CapsOff()
	if CapsStatus() == "on"
		call system("xdotool key Caps_Lock")
		redraw
		highlight Cursor guifg=white guibg=black
	endif
endfunction

autocmd InsertLeave * call CapsOff()
" }}} END CapsOff

" Escape -> turn off caps & clear the bs from searches etc
nmap <Esc> :call CapsOff()<CR>:noh<CR>:<Backspace>

" Wrapping Text:
"{{{
nmap <Leader>wt viw<Leader>wt
vnoremap <Leader>wt <Esc>:call TagSelection()<CR>

function! TagSelection()
	let tag = input("Tag name (include attributes)? ")
	if strlen(tag) == 0
		return
	endif

	" Save
	let saveB = @b
	" <C-R> seems to automatically reindent the line for some filetypes
	" this will disable it until we have applied our changes
	let saveIndent = &indentexpr
	let curl = line(".")
	let curc = col(".")
	let &indentexpr = ''

	" If the visual selection is over multiple lines, then place the
	" data between the tags on newlines:
	"   <tag>
	"   data
	"   </tag>
	let newline = ''
	if getline("'>") != getline("'<")
		let newline = "\n"
		let curl = line("'>")
	endif

	" Strip off all but the first word in the tag for the end tag
	let @b = newline . substitute(tag, '^[ \t"]*\(\<\S*\>\).*', '<\/\1>\e', "")
	let curc = curc + strlen(@b)
	exec "normal `>a\<C-R>b"
	let @b = substitute(tag, '^[ \t"]*\(\<.*\)', '<\1>\e', "") . newline
	let curc = curc + strlen(@b)
	exec "normal `<i\<C-R>b"

	" Now format the area
	exec "normal `<V'>j="

	" Restore
	let @b = saveB
	let &indentexpr = saveIndent
	call cursor(curl, curc)
endfunction
"WRAPPING TEXT }}}

" needs set hidden to keep buffers in background
"nnoremap <M-l> :bnext<CR>
"nnoremap <M-h> :bprev<CR>

"So I can move around in insert
inoremap <M-k> <C-o>gk
inoremap <M-h> <C-o>h
inoremap <M-l> <C-o>l
inoremap <M-j> <C-o>gj


" delete to x register
nnoremap <Leader>x "xx
vnoremap <Leader>x "xx

" yank to y register
nnoremap <Leader>y "yy
vnoremap <Leader>y "yy

" put from y register
nnoremap <Leader>p "yp
vnoremap <Leader>p "yp

" remove trailing whitespace
cab WS %s/\s\+$//e

" check for php issues:
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
nnoremap <Leader>php err:update<bar>sil! make<bar>cwindow<cr>

" yank source of url (still need to complete the rest of url)
nnoremap <Leader>url :r !curl -s http

" Set working directory to current file path
nnoremap <leader>wd :lcd %:p:h<CR>

" Select all
nnoremap <Leader>sa ggVG

" select inside multi-line tag, but DON'T include the surrounding tag
nnoremap <Leader>vit vitB$oW0

" select previously put text 
nnoremap <Leader>sp '[V']

" Start an external command with a single bang
nnoremap ! :!

" toggle relativenumber
nnoremap <silent> <Leader>rn :set relativenumber!<CR>
vnoremap <silent> <Leader>rn <Esc>:set relativenumber!<CR>gv


" CHANGE TAG (need to start on first letter of opeining tag)
nnoremap <Leader>ct mA:norm %<CR>ci</CHANGEZTAG<Esc>`AcwCHANGEZTAG<Esc>:%s/CHANGEZTAG//g<left><left>

" Remove spaces at the end of lines
nnoremap <Leader>r<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>:echo "Removed EOL Spaces"<CR>

" remove end of line chars from file
nnoremap <Leader>eol :%s/\r//g<CR>:echo "removed end of line chars"<CR>

" Remove spaces at the end of lines
nnoremap <Leader>rbl :g/^$/d<CR>:echo "Removed Blank Lines"<CR>


" open help buffers to right:
augroup helpfiles
	au!
	au BufRead,BufEnter */doc/* wincmd L
augroup END


" Toggle background transparency - this doesn't quite work right
let t:is_transparent = 0
function! Background_toggle()
	if t:is_transparent == 0
		hi Normal guibg=NONE ctermbg=NONE
		let t:is_transparent = 1
	else
		set termguicolors
		colorscheme minimalist
	endif
endfunction
nnoremap <Leader>bg :call Background_toggle()<CR>


" === convert current selection upper, lower title case with ~
"https://vim.fandom.com/wiki/Switching_case_of_characters
function! TwiddleCase(str)
	if a:str ==# toupper(a:str)
		let result = tolower(a:str)
	elseif a:str ==# tolower(a:str)
		let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
	else
		let result = toupper(a:str)
	endif
	return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Terminal Mode:
" {{{
tnoremap ii <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
"cnoreabbrev t terminal
nnoremap <Leader>T :10sp<CR>:terminal<CR>
nnoremap <Leader>VT :vs<CR>:terminal<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" }}}


" Testing Stuff:
" {{{

command! GO normal M17jzzH
cab SO source $MYVIMRC<CR>

" new lines for each tag:
cab HTMLPRETTY :%s/>\s*</>\r</g

" remomve <span>s
nnoremap <leader>ds :%s/span[^\>]*//<cr>:%s/<>//<cr>:%s/<\/>//<cr>:%s/<\/span>//g<cr>/span<cr>


" swap camelCase into snake_case
nnoremap <Leader>scc :s/\v([a-z])([A-Z])/\1_\L\2/g<CR>
vnoremap <Leader>scc :s/\%V\v([a-z])([A-Z])/\1_\L\2/g<CR>
" swap snake_case into camelCase
nnoremap <Leader>ssc :s/\v_([a-z])/\u\1/g<CR>
vnoremap <Leader>ssc :s/\%V\v_([a-z])/\u\1/g<CR>


"Switch Buffer
set wildcharm=<C-z>
nnoremap <leader>bs :buffer <C-z><S-Tab>
" opens in split
nnoremap <leader>bS :vbuffer <C-z><S-Tab>

nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>

"Buffer Delete:
nnoremap <leader>bdd :bd!<CR>

" Toggle quickfix window.
function! QuickFix_toggle()
	for i in range(1, winnr('$'))
		let bnum = winbufnr(i)
		if getbufvar(bnum, '&buftype') == 'quickfix'
			cclose
			return
		endif
	endfor
	copen
endfunction
nnoremap <silent> <Leader>qf :call QuickFix_toggle()<CR>

" open help buffers to right:
augroup helpfiles
	au!
	au BufRead,BufEnter */doc/* wincmd L
augroup END

" END TESTING STUFF }}}
