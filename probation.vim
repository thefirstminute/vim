" from sensible.vim {{{
set autoread  "update file if modified elsewhere

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set laststatus=2

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" this may solve the theme and comment overrides!?
" says it's been replaced by: shada
"if !empty(&viminfo)
"  set viminfo^=!
"endif
"set sessionoptions-=options
"set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif
" }}}

nnoremap <Leader>ss :mksession! .sess.vim<CR>
nnoremap <Leader>bgl :set background=light<CR>
nnoremap <Leader>bgd :set background=dark<CR>
nnoremap <Leader>f0 :set foldlevel=0<CR>
nnoremap <Leader>f1 :set foldlevel=1<CR>
nnoremap <Leader>f2 :set foldlevel=2<CR>
nnoremap <Leader>f3 :set foldlevel=2<CR>
nnoremap <Leader>ft :set ft=


" let php_folding = 1     " enable folding for classes and functions
" let php_htmlInStrings=1 " highlight HTML in php
let php_sql_query = 1     " highlight SQL syntax in strings
let g:ftplugin_sql_omni_key = '<C-s>'
let g:sql_type_default = 'mysql'
" let g:PHP_outdentphpescape = 0
" StanAngeloff PHP:
" {{{
let php_var_selector_is_identifier = 1
let g:php_html_load = 1
" }}}


nnoremap <Leader>ut :UndotreeToggle<CR>
