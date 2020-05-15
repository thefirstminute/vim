Plug 'vim-airline/vim-airline'

set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it
"nmap <M-h> <Plug>AirlineSelectPrevTab
"nmap <M-l> <Plug>AirlineSelectNextTab

let g:airline_theme = 'onedark'
let g:NERDTreeStatusline = ''

let g:airline_section_b = '%-{getcwd()}'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '' " '»'
let g:airline_right_sep = '' " '«'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '+' "㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_skip_empty_sections = 1
"let g:airline_section_x =''

" TABLINE:
let g:airline#extensions#tabline#enabled = 1                " show tabline
let g:airline#extensions#tabline#buffer_nr_show = 1         " show buffer number
let g:airline#extensions#tabline#buffer_nr_format = '[%s]'  " buffer number format
let g:airline#extensions#tabline#fnamemod = ':t'            " only file name in tabs
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline_highlighting_cache = 1

"COC:
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
