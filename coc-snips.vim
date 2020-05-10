" ---======= ::: PLUGINS ::: =======---
" Install Vimplug If Not Installed:
" {{{
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	silent !mkdir -p ~/.config/nvim/pluggos/
	autocmd VimEnter * PlugInstall
endif
" }}} ===-0-=== END Install Vimplug If Not Installed 

" Loading The Plugins:  ::: =======---
" {{{
call plug#begin('~/.config/nvim/pluggos')
	" Conquer Of Completion: an intellisense engine for Vim/Neovim
	" https://github.com/neoclide/coc.nvim
	" To Install COC You Need:
	" 1. install nodejs: curl -sL install-node.now.sh | sh
	" 2. install yarn: curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
	" 3. PlugInstall the actual plug:
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" 4. installing the extensions:
	" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
	" Basic Web Dev Setup:
	" :CocInstall coc-tsserver coc-json coc-phpls coc-html coc-css
	" Snippets:
	" :CocInstall coc-snippets
		" snippets are held in ~/.config/coc/ultisnips/
	" Emmet:
	" :CocInstall coc-emmet
	" helps with sql etc??
	" :CocInstall coc-diagnostic
	" highlight css colors and other codes:
	" :CocInstall coc-highlight 
	" maybe try: 
	" coc-prettier coc-eslint coc-todolist coc-vimlsp coc-yank coc-spell-checker coc-python coc-lists coc-actions coc-git 

	" Extra Language Support:
	Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': ['php', 'html'] }
	"Plug 'StanAngeloff/php.vim', { 'for': 'php' }
	"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
	"Plug '2072/PHP-Indenting-for-VIm'    " PHP indent script
	"Plug 'squizlabs/php_codesniffer', { 'on':  'PhpCsFixerFixFile' }

	" Auto Texts:
	Plug 'mattn/emmet-vim', { 'for': ['php', 'html', 'css'] }
	Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'  https://github.com/bonsaiben/bootstrap-snippets

	" Visual Stuff:
	"	Plug 'arcticicestudio/nord-vim' " nice darkish blueish colorscheme

	Plug 'machakann/vim-highlightedyank' "shows you what you just yanked - I love this
	"Plug 'Yggdroot/indentLine'  "show indent guides
	Plug 'andymass/vim-matchup', { 'for': ['php', 'html'] }  " shows matching tags in html
	

  " Other Tools:
  "Plug 'tpope/vim-commentary'  " use 'gc' to comment stuff out
  "Plug 'aserebryakov/vim-todo-lists'
	"Plug 'ap/vim-buftabline' " nice - slim - way to show buffers in tabline
	Plug 'vim-airline/vim-airline'  " | Plug 'vim-airline/vim-airline-themes' | Plug 'ryanoasis/vim-devicons'
	Plug 'joshdick/onedark.vim'     " prefer this for airline

	Plug 'justinmk/vim-sneak'				" quickly go to places in doc

call plug#end()
" }}} ===-0-=== END Loading The Plugins 

" Plugin Configs:  ::: =======---
" {{{

nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

" VimSneak:
" {{{
let g:sneak#label = 1
map s <Plug>Sneak_s
map S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" }}}


" BuffTabLine:
" {{{
" already set, but needs: set hidden " easier to work with background buffers
nnoremap <M-l> :bnext<CR>
nnoremap <M-h> :bprev<CR>
" }}}

" StanAngeloff PHP:
" {{{
let php_var_selector_is_identifier=1
let php_html_load=1
" }}}

" IndentLine:
" {{{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
" }}}

" COC:
" {{{
imap qs <Plug>(coc-snippets-expand-jump)

hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=2000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

autocmd FileType css let b:coc_additional_keywords = ["-"]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Snippets: 
" {{{

let g:user_emmet_expandabbr_key='qe'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:coc_snippet_next = 'jk'
let g:coc_snippet_prev = 'kj'

" END SNIPPETS }}}

" }}}

" UltiSnips:
"{{{
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/my_snippets']
let g:UltiSnipsExpandTrigger="qx"
let g:UltiSnipsListSnippets="qs"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardTrigger="kj"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_php_scalar_types = 1
" UltiSnipsEdit
nmap <Leader>ulti :UltiSnipsEdit<CR>
"}}}


" Emmet:
" {{{
let g:user_emmet_expandabbr_key="qe"
imap jk <plug>(emmet-move-next)
imap kj <plug>(emmet-move-prev)
let g:user_emmet_settings = {
			\    'html': {
			\        'empty_element_suffix': ' />',
			\    },
			\}
" }}}

" Airline:
" {{{ 
"BEFORE MESSING:
" let g:NERDTreeStatusline = ''
" let g:airline_theme = 'onedark'
" let g:airline#extenions#tabline#enabled=1  " buffers at the top as tabs
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_skip_empty_sections = 1
" let g:airline#extensions#coc#enabled = 1
" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" let g:airline_highlighting_cache = 1

" set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it
nmap <A-h> <Plug>AirlineSelectPrevTab
nmap <A-l> <Plug>AirlineSelectNextTab

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

" TABLINE:
let g:airline#extensions#tabline#enabled = 1                " show tabline
let g:airline#extensions#tabline#buffer_nr_show = 1         " show buffer number
let g:airline#extensions#tabline#buffer_nr_format = '[%s]'  " buffer number format
"let g:airline#extensions#tabline#fnamemod = ':t'            " only file name in tabs
"let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline_highlighting_cache = 1

"COC:
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" }}}

" }}} ===-0-=== END Plugins Configs
