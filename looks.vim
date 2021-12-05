"autocmd BufReadPre,FileType php,html,css colorscheme minimalist
"autocmd BufReadPre,FileType php,html,css set background=dark
"autocmd BufReadPre,FileType sh,bash colorscheme nord
"autocmd BufReadPre,FileType sh,bash set background=dark
"autocmd BufReadPre,FileType python colorscheme onedark
"autocmd BufReadPre,FileType python set background=dark
" colorscheme alduin
" colorscheme ayu
" colorscheme minimalist
set background=dark

" TokyoNight: https://github.com/folke/tokyonight.nvim
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
" Custom Colors:
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme tokyonight



" autocmd FileType vim,snippets colorscheme angr
" autocmd FileType vim,snippets set background=dark

" autocmd FileType php,html,css colorscheme minimalist
" autocmd FileType php,html,css set background=dark


"highlight Pmenu       ctermfg=white     ctermbg=240    cterm=NONE
"highlight PmenuSel    ctermfg=white     ctermbg=74     cterm=NONE
"highlight TabLineFill ctermfg=black  ctermbg=black
"highlight TabLine     ctermfg=DarkGray ctermbg=black
"highlight TabLineSel  ctermfg=Yellow    ctermbg=DarkGray
"highlight clear       Search
"highlight Search      cterm=undercurl   ctermfg=yellow
"highlight clear             Folded
"highlight Folded            ctermfg=242    ctermbg=NONE    cterm=NONE

"STATUSLINE:
"{{{
set statusline=
set statusline+=[\B%n]         " buffer number
set statusline+=%#error#       " switch to error highlight
set statusline+=%h%m%r%w       " flags: help,modified,readonly,write
set statusline+=%*             " switch back to normal statusline highlight
set statusline+=%#todo#        " switch to todo highlight
set statusline+=%<%.99f        " 99 char tail of the filename
set statusline+=%*             " switch back to normal statusline highlight
set statusline+=               " separate file name and size
set statusline+=:%{FileSize()} " show filesize with function
set statusline+=\              " space
set statusline+=(%F)           " full filename

set statusline+=%=             " left/right separator

set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ "  describe what cursor is on
set statusline+=\              " space
set statusline+=line:%l/%L     " cursor line/total lines
set statusline+=(%P)           " percent through doc

" set statusline+=row:\ %l\ col:\ %c
" set statusline+=\ %{strftime('%a\ %b\ %d\ %I:%M%p')}\  "show time and date
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&fileformat}] "file format
"set statusline+=\ %F\ %M\ %Y\ %R
" ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%


function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
    endif
endfunction
"}}}


augroup FixVims
  autocmd!
  autocmd BufEnter,BufCreate *.* call FixVim()
augroup END

function! FixVim() abort " {{{
  "echo "fixing vim"
  " STOP RE-INSERING COMMENTS YOU FUCK!
  set formatoptions=qlj

  highlight clear             TabLine
  highlight TabLineFill ctermfg=DarkGray ctermbg=DarkGray
  highlight TabLine ctermfg=LightGray ctermbg=DarkGray
  highlight TabLineSel ctermfg=Yellow ctermbg=DarkGray

  highlight Comment           term=italic    cterm=italic
  highlight Search            term=undercurl cterm=undercurl
  highlight MatchParen        term=undercurl cterm=undercurl
  highlight clear             Folded
  highlight Folded            ctermfg=242    ctermbg=NONE    cterm=NONE
  highlight clear             SignColumn
  highlight clear             LineNr
  highlight LineNr            ctermfg=59     ctermbg=NONE    cterm=NONE
  highlight clear             CursorLineNr
  highlight IncSearch         ctermbg=Yellow  term=underline
  highlight Pmenu             ctermfg=white  ctermbg=240     cterm=NONE
  highlight PmenuSel          ctermfg=white  ctermbg=74      cterm=NONE
  highlight clear             SignifySignAdd
  highlight clear             SignifySignDelete
  highlight clear             SignifySignChange
  highlight SignifySignAdd    ctermfg=150    ctermbg=NONE
  highlight SignifySignDelete ctermfg=167    ctermbg=NONE
  highlight SignifySignChange ctermfg=117    ctermbg=NONE
  highlight clear             ColorColumn
  highlight ColorColumn       ctermbg=NONE

endfunction
nnoremap <Leader>fv :call FixVim()<CR>
"}}}
