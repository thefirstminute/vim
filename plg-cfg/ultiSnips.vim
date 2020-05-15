Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'  https://github.com/bonsaiben/bootstrap-snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/my_snippets']
let g:UltiSnipsExpandTrigger="qx"
" FZF using this now ## let g:UltiSnipsListSnippets="qs"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardTrigger="kj"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_php_scalar_types = 1
" UltiSnipsEdit
nmap <Leader>ulti :UltiSnipsEdit<CR>
