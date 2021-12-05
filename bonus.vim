
"augroup AutoSaveFolds
" autocmd!
"  autocmd BufWinLeave *.* mkview!
"  autocmd BufWinEnter *.* silent! loadview
"augroup END

augroup misselanus
  autocmd!
  " auto insert mode and enter saves for git messages:
  au FileType gitcommit 1 | startinsert
  au FileType gitcommit 1 | inoremap <CR> <Esc>:wq<CR>

  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END


" Copy N Paste:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
nmap <C-v> "+P
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap <C-c> "*y :let @+=@*<CR>:echo "a vim noob just copied something"<CR>gv
vnoremap <C-v> "+P

" yank from 'x' lines up/down and paste line here
nnoremap <expr> <Leader>yk "mm". input("How many lines up? ") ."kyy'mp"
nnoremap <expr> <Leader>yj "mm". input("How many lines down? ") ."jyy'mp"
" move from 'x' lines up/down and put line here
nnoremap <expr> <Leader>pk "mm". input("How many lines up? ") ."kdd'mp"
nnoremap <expr> <Leader>pj "mm". input("How many lines down? ") ."jdd'mp"

" delete from 'x' lines up/down
nnoremap <expr> <Leader>dk "mm". input("How many lines up? ") ."kdd`m"
nnoremap <expr> <Leader>dj "mm". input("How many lines down? ") ."jdd`m"

" select previously put text
nnoremap <Leader>sp '[V']
"}}}


""" Insert Mode Normalish:
"{{{
"So I can move around in insert
inoremap <M-k> <C-o>gk
inoremap <M-h> <C-o>h
inoremap <M-l> <C-o>l
inoremap <M-j> <C-o>gj

" exit insert mode and start moving up, down...
inoremap ;h <Esc>^i
inoremap ;l <Esc>$a
inoremap ;j <Esc>jl
inoremap ;k <Esc>kl
inoremap ;w <Esc> W
inoremap ;e <Esc> E
inoremap ;b <Esc>B
inoremap ;. <Esc>f>la
inoremap ;' <Esc>f'la
inoremap ;" <Esc>f"la
inoremap ;o <Esc>o
inoremap ;O <Esc>O
inoremap ;J <Esc>:call CapsOff()<CR>:<Backspace>jl
inoremap ;K <Esc>:call CapsOff()<CR>:<Backspace>kl

"delete word
inoremap ;dw <Esc>bciw
"delete line
inoremap ;dl <Esc>^C
"delete to end of line
inoremap ;de <Esc>lC
"delete to start of line
inoremap ;ds <Esc>lc^

"go to next empty tag
inoremap ;nt <Esc>/><<CR>a
"go to next empty quotes
inoremap ;n" <Esc>/""<CR>a
inoremap ;nq <Esc>/""<CR>a
inoremap ;n' <Esc>/''<CR>a
"}}}


" Quick Buffer Actions:
"{{{
" quit & close
nnoremap <Leader>qq :qa!<CR>
vnoremap <Leader>qq :qa!<CR>
nnoremap <Leader>ee :exit<CR>

" open buffers in vertical split
nnoremap <leader>vs :vert sb#<CR>
" next and previous buffer
nnoremap <a-j> :bn<CR>
nnoremap <a-k> :bp<CR>
" go Back to last Buffer
nnoremap <leader>bb <c-^>
" delete buffer
nnoremap <leader>bdd :bd!<CR>
" only leave this buffer
nnoremap <Leader>oo :only<CR>
" kill all other buffers
nnoremap <Leader>bo :%bd\|e#<CR>
" Close this buffer but go back to last one
nnoremap <leader>bc :bp <BAR> bd #<CR>

" moving around 'windows'
nnoremap <Leader>w <c-w>
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j
vnoremap <Leader>w <c-w>
vnoremap <C-l> <c-w>l
vnoremap <C-h> <c-w>h
vnoremap <C-k> <c-w>k
vnoremap <C-j> <c-w>j

" Tabs:
nnoremap <Leader>tn :$tabnew<CR>:<BS>
nnoremap <Leader>tH :tabfirst<CR>:<BS>
nnoremap <Leader>tL :tablast<CR>:<BS>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <a-l> :tabnext<CR>:<BS>
nnoremap <a-h> :tabprevious<CR>:<BS>
"}}}


" Change Register Behaviour:
"{{{
" stop interfering with them Damned Yanks
nnoremap x "_x
vnoremap x "_x
nnoremap C "_C
vnoremap C "_C
nnoremap c "_c
vnoremap c "_c
vnoremap p "_dP

" yank to y register
nnoremap <Leader>y "yy
vnoremap <Leader>y "yy
" put from y register
nnoremap <Leader>p "yp
vnoremap <Leader>p "yp

"Yank to clipboard:
vnoremap <leader>Y "+y :let @+=@*<CR>gv
"}}}


""" Misc Cool Commands:    ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{

"toggle wrapping text
nnoremap <silent><Leader>wt :set wrap! linebreak!<CR>

" Start an external command with a single bang
nnoremap ! :!

" toggle relativenumber
nnoremap <silent><buffer> <Leader>rn :set relativenumber!<CR>
vnoremap <silent><buffer> <Leader>rn <Esc>:set relativenumber!<CR>gv

" window 'focus' makes current pane most of the screen
nnoremap <silent> <Leader>wf <C-w>j:let &winheight = &lines * 7 / 10<CR><C-w>j:let &winwidth = &columns * 7 / 10<CR>


"Resize splits with arrow keys
nnoremap <silent> <right> :exe "vertical resize +6"<CR>
nnoremap <silent> <left> :exe "vertical resize -6"<CR>
nnoremap <silent> <up> :exe "resize +2"<CR>
nnoremap <silent> <down> :exe "resize -2"<CR>

" write a read only file:
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"mark position before search, go back with 's
nnoremap / ms/

"Change Selected (on current line)
nnoremap <Leader>cl yiw:s/<C-r>"/
vnoremap <Leader>cl y:s/<C-r>"/

"Change Selected (in this file)
nnoremap <Leader>cs yiw:%s/<C-r>"/
vnoremap <Leader>cs y:%s/<C-r>"/

" CHANGE TAG (need to start on first letter of opeining tag)
nnoremap <Leader>ct mA:norm %<CR>ci</CHANGEZTAG<Esc>`AcwCHANGEZTAG<Esc>:%s/CHANGEZTAG//g<left><left>

" Delete This Tag: opeining and closing tags leave inside alone
nnoremap <Leader>dtt mq:norm %<CR>dd'qdd

" Remove spaces at the end of lines
nnoremap <Leader>r<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>:echo "Removed EOL Spaces"<CR>

" remove end of line chars from file
nnoremap <Leader>eol :%s/\r//g<CR>:echo "removed end of line chars"<CR>

" Remove blank lines
nnoremap <Leader>rbl :g/^$/d<CR>:echo "Removed Blank Lines"<CR>

" swap camelCase into snake_case
nnoremap <Leader>scc :s/\v([a-z])([A-Z])/\1_\L\2/g<CR>
vnoremap <Leader>scc :s/\%V\v([a-z])([A-Z])/\1_\L\2/g<CR>
" swap snake_case into camelCase
nnoremap <Leader>ssc :s/\v_([a-z])/\u\1/g<CR>
vnoremap <Leader>ssc :s/\%V\v_([a-z])/\u\1/g<CR>

" go to actual middle of a line:
map gm :call cursor(0, virtcol('$')/2)<CR>

" copy current file/path/directory - then retrieve with <C-r>"
nnoremap <Leader>yf :let @" = expand("%p")<CR>
nnoremap <Leader>yd :let @" = expand("%:p")<CR>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
nnoremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Open a search results window for last search:
nnoremap <silent> <Leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" fold selection (forces manual so it works always)
vnoremap <Leader>za <Esc>:set foldmethod=manual<CR>gvzf

" Open a search results window for selected:
nnoremap <silent> <Leader>S yiw:execute 'vimgrep <C-r>" **/*'<CR>:copen<CR>
vnoremap <silent> <Leader>S y:execute 'vimgrep <C-r>" **/*'<CR>:copen<CR>


" fold braces and markers selection (forces marker so it works always)
nnoremap <Leader>zk :set foldmethod=marker<CR>za
nnoremap <Leader>z{ :set foldmethod=marker<CR>:set foldmarker={,}<CR>za

" select inside multi-line tag, but DON'T include the surrounding tag
nnoremap <Leader>vit vitB$oW0


" center screen and open line:
nnoremap go zzo
nnoremap gO zzO

"}}}


" Command N Terminal:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
cab CURL r !curl -s http
cab tab2space %s/\t/  /g
cab tab4space %s/\t/    /g
cab snake2camel s/\v_([a-z])/\u\1/g
cab camel2snake s/\v([a-z])([A-Z])/\1_\L\2/g

" Bracket Close Comment
command! BC :norm ^mm%y^`mA // END <C-r>"<Esc>
" Tag Close Comment
command! TC :norm ^w%wyt>%A <!-- END <C-r>" --><Esc>

" fix caps
command! W w
command! Q q
"escape command line
cnoremap ;i <c-c>

" Terminal Mode:
tnoremap qq <C-c>
tnoremap ;i <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
"cnoreabbrev t terminal
nnoremap <Leader>T :10sp<CR>:terminal<CR>
nnoremap <Leader>VT :vs<CR>:terminal<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
"}}}


" Functions:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{

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

"bonus clearh highlights and get out of caps lock with escape
map <Esc> <Esc>:call CapsOff()<CR>:noh<CR>:<Backspace>
" }}} END CapsOff

""" Toggle quickfix window:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
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
"}}}

""" SmartTab::   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
" https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap ;<tab> <c-r>=Smart_TabComplete()<CR>
"}}}


" Save Selection To New File:
"{{{
com! -nargs=1 -range Sfile call MoveSelectedLinesToFile(<f-args>)
fun! MoveSelectedLinesToFile(filename)
    exec "'<,'>w! >>" . a:filename
    norm gv
endfunc
"}}}

" TwiddleCase:
"{{{
" convert current selection upper, lower title case with ~
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
"}}}


"}}} END Functions


" File Explorer:
"{{{
"nnoremap <Leader>fe :wincmd v<bar> :Lex! <bar> :vertical resize 28<CR>
nnoremap <Leader>fe :Lex!<CR>
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle = 3   " tree-like listing of directories
let g:netrw_winsize = 23    " set width of explorer window
let g:netrw_banner=0        " no banner in explorer
let g:netrw_list_hide=netrw_gitignore#Hide()

"let g:netrw_localrmdir='rm -r'
"}}}


"Operator Remaps:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
"get parens - easier
onoremap i9 i(
onoremap a9 a(

"get braces - easier
onoremap ib i{
onoremap ab a{

"get quotes - easier
onoremap iq i"
onoremap aq a"

" In Next ...
onoremap in" <esc>/"<cr>n:nohl<cr>ci"
onoremap inq <esc>/"<cr>n:nohl<cr>ci"
onoremap in' <esc>/'<cr>n:nohl<cr>ci'
onoremap in{ <esc>/{<cr>:nohl<cr>ci{
onoremap inb <esc>/{<cr>:nohl<cr>ci{
onoremap in( <esc>/(<cr>:nohl<cr>ci(
onoremap inp <esc>/(<cr>:nohl<cr>ci(
onoremap in[ <esc>/[<cr>:nohl<cr>ci[
onoremap in< <esc>/<<cr>:nohl<cr>ci<
onoremap int <esc>/<<cr>:nohl<cr>%lcit

" Around Next...
onoremap an" <esc>/"<cr>n:nohl<cr>ca"
onoremap anq <esc>/"<cr>n:nohl<cr>ca"
onoremap an' <esc>/'<cr>n:nohl<cr>ca'
onoremap an{ <esc>/{<cr>:nohl<cr>ca{
onoremap anb <esc>/{<cr>:nohl<cr>ca{
onoremap an( <esc>/(<cr>:nohl<cr>ca(
onoremap anp <esc>/(<cr>:nohl<cr>ca(
onoremap an[ <esc>/[<cr>:nohl<cr>ca[
onoremap an< <esc>/<<cr>:nohl<cr>ca<
onoremap ant <esc>/<<cr>:nohl<cr>%lcat

" In Last (previous, but using p slows normal use)...
onoremap il" <esc>?"<cr>n:nohl<cr>ci"
onoremap ilq <esc>?"<cr>n:nohl<cr>ci"
onoremap il' <esc>?'<cr>n:nohl<cr>ci'
onoremap il{ <esc>?{<cr>:nohl<cr>ci{
onoremap ilb <esc>?{<cr>:nohl<cr>ci{
onoremap il( <esc>?(<cr>:nohl<cr>ci(
onoremap ilp <esc>?(<cr>:nohl<cr>ci(
onoremap il[ <esc>?[<cr>:nohl<cr>ci[
onoremap il< <esc>?><cr>:nohl<cr>ci<
onoremap ilt <esc>?</<cr>:nohl<cr>cit

" Around Last (previous, but using p slows normal use)...
onoremap al" <esc>?"<cr>n:nohl<cr>ca"
onoremap alq <esc>?"<cr>n:nohl<cr>ca"
onoremap al' <esc>?'<cr>n:nohl<cr>ca'
onoremap al{ <esc>?}<cr>:nohl<cr>ca{
onoremap alb <esc>?}<cr>:nohl<cr>ca{
onoremap al( <esc>?)<cr>:nohl<cr>ca(
onoremap alp <esc>?)<cr>:nohl<cr>ca(
onoremap al[ <esc>?[<cr>:nohl<cr>ca[
onoremap al< <esc>?><cr>:nohl<cr>ca<
onoremap alt <esc>?</<cr>:nohl<cr>cat

" Delete function
onoremap af <esc>V$%d
onoremap if <esc>jVk$%kd
"}}}


"echo ' Oh Gross!  A Mouse            ~~{,_,"> '
"echo ",.-~*´¨¯¨`*·~-.  What's The Single Most Important Thing You Can Do Right Now!?  .-~*´¨¯¨`*·~-.¸"
"echo '( ๏ Y ๏ )'
"echo '╭∩╮ (òÓ,) ╭∩╮'

