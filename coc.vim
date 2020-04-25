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
	Plug 'squizlabs/php_codesniffer', { 'on':  'PhpCsFixerFixFile' }


	" Visual Stuff:
	"	Plug 'arcticicestudio/nord-vim' " nice darkish blueish colorscheme

	Plug 'machakann/vim-highlightedyank' "shows you what you just yanked - I love this
	Plug 'Yggdroot/indentLine'  "show indent guides
	Plug 'andymass/vim-matchup', { 'for': ['php', 'html'] }  " shows matching tags in html


  " Other Tools:
  "Plug 'aserebryakov/vim-todo-lists'
	Plug 'ap/vim-buftabline' " nice - slim - way to show buffers in tabline



call plug#end()
" }}} ===-0-=== END Loading The Plugins 

" Plugin Configs:  ::: =======---
" {{{

nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

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

" }}} ===-0-=== END Plugins Configs
