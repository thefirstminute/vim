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
" Snippets: Really don't like how Coc handles snippets, going back to UltiSnips
" :CocInstall coc-snippets
" snippets are held in ~/.config/coc/ultisnips/
" Emmet: kept leaving the cursor in the wrong place, just using emmet-vim now
" :CocInstall coc-emmet
" helps with sql etc??
" :CocInstall coc-diagnostic
" highlight css colors and other codes:
" :CocInstall coc-highlight 
" maybe try: 
" coc-explorer coc-pairs coc-prettier coc-eslint coc-todolist coc-vimlsp coc-yank coc-spell-checker coc-python coc-lists coc-actions coc-git 


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


" GoTo code navigation.
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gt <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Explorer
" {{{
""  I think this was crashing my shit??
""  add this to the coc
  "
  "  "explorer.width": 28,
  "  "explorer.icon.enableNerdfont": false,
  "  "explorer.previewAction.onHover": false,
  "  "explorer.icon.enableVimDevicons": false,
  "  "explorer.keyMappings": {
  "    "<cr>": ["expandable?", "expand", "open"],
  "    "v": "open:vsplit"
  "  }
""  nmap <silent> <Leader>ce :CocCommand explorer<CR>
""  let g:coc_explorer_global_presets = {
""  \   'floating': {
""  \      'position': 'floating',
""  \   },
""  \   'floatingLeftside': {
""  \      'position': 'floating',
""  \      'floating-position': 'left-center',
""  \      'floating-width': 30,
""  \   },
""  \   'floatingRightside': {
""  \      'position': 'floating',
""  \      'floating-position': 'right-center',
""  \      'floating-width': 30,
""  \   },
""  \   'simplify': {
""  \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
""  \   }
""  \ }
""  " nmap <space>f :CocCommand explorer --preset floatingRightside<CR>
""  "autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"}}}

""" Snippets:  nope, not loving this -> back to UltiSnips
"" {{{
"" "" need to add this to the coc-settings.json
  " 	"snippets.extends": {
  " 		"cpp": ["c"],
  " 		"php": ["html"]
  " 	},
  " 
  " 	"coc.source.ultisnips.filetypes": ["tex", "php", "html", "css", "sql"],
  " 
  " 	"snippets.ultisnips.directories" :[
  " 		"UltiSnips", "~.config/nvim/my_snippets"
  " 	],
  " 
  " 	"snippets.userSnippetsDirectory": "~/.config/nvim/my_snippets",
  " 
  " 	"snippets.triggerCharacters":["qs"],
  " 
" imap qs <Plug>(coc-snippets-expand-jump)
"let g:coc_snippet_next = 'jk'
"let g:coc_snippet_prev = 'kj'
"
"" END SNIPPETS }}}

