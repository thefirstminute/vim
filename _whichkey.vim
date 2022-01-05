set timeout
set timeoutlen=1500

call which_key#register('_', "g:which_key_map")

highlight Pmenu guibg=#333333 guifg=#EEEEEE

nnoremap <silent> \ :<c-u>WhichKey '_'<CR>
vnoremap <silent> \ :<c-u>WhichKeyVisual '_'<CR>

nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
nnoremap <silent> [ :<c-u>WhichKey '['<CR>


let g:which_key_map =  {}
let g:which_key_map['q'] = [ ':qa!', 'Quit' ]
let g:which_key_map['w'] = [ ':wa',  'Write All' ]
let g:which_key_map['W'] = [ ':xa',  'Write All & Quit' ]


" Nullificate:
"{{{
let g:which_key_map.0 = { 'name' : '+null',
      \ 'h' : [':let @/ = ""',           'remove search Highlight'],
      \ 'n' : [':set nonumber!',         'line-Numbers'],
      \ 'r' : [':set norelativenumber!', 'Relative line nums'],
      \ }
"}}}

" Buffers:
"{{{
let g:which_key_map.b = { 'name' : '+buffer',
      \ 'f' : ['bfirst',                 'First buffer']    ,
      \ 'l' : ['blast',                  'Last buffer']     ,
      \ 'n' : ['bnext',                  'Next buffer']     ,
      \ 'p' : ['bprevious',              'Previous buffer'] ,
      \ 'r' : ['bd',                     'Remove buffer']   ,
      \ 'z' : ['Buffers',                'fzf buffers']      ,
      \ }
"}}}

" Comments:
"{{{
" how to make it know if we're in insert,normal,visual???
" let g:which_key_map.c = { 'name' : '+comment',
"       \ '1' : ['nwy', 'not working yet'],
"       \ '2' : ['nwy', 'not working yet'],
"       \ '3' : ['nwy', 'not working yet'],
"       \ '4' : ['nwy', 'not working yet'],
"       \ '5' : ['nwy', 'not working yet'],
"       \ '6' : ['nwy', 'not working yet'],
"       \ }
"}}}

" Editing:
"{{{
      " \ 'c' : [':Commentary',                     'Commentary'],
let g:which_key_map.e = { 'name' : '+edit',
      \ 'a' : [':LiveEasyAlign',                  'easy Align'],
      \ 'd' : { 'name': '+delete',
          \ 'b' : [':g/^$/d',                     'Blank lines'],
          \ 'e' : [':%s/\r//g',                   'EOL characters'],
          \ 's' : [':%s/span[^\>]*//<cr>:%s/<>//<cr>:%s/<\/>//<cr>:%s/<\/span>//g<cr>/span<cr>', 'Span'],
          \ 't' : [':%s/\s\+$//e',                'Trailing whitespace'],
          \ 'h' : [':%s/<\_.\{-1,\}>//g',         'HTML Tags'],
          \},
      \ 'f' : { 'name': '+format',
        \ 'f' : [':Format',                       'Format (prettier)'],
        \ 'l' : [':%s/>\s*</>\r</g',              'new Lines for each tag'],
        \ 's' : [':sort /.\{-}\ze\w/',              'Sort, ignoring symbols'],
        \ 'd' : [':%sort u',              'Sort, remove Duplicat lines'],
      \ },
      \ 'r' : { 'name': '+replace',
        \ '2' : [':%s/\t/  /g',                   'tabs 2 spaces'],
        \ '4' : [':%s/\t/    /g',                 'tabs 4 spaces'],
        \ 'b' : [':call Replace()',               'replace in buffer'],
        \ 'c' : ['::s/\v_([a-z])/\u\1/g',         'snake_case 2 camelCase'],
        \ 's' : [':s/\v([a-z])([A-Z])/\1_\L\2/g', 'camelCase 2 snake_case'],
        \ 'r' : [':ConvertColorTo rgba',          'ConvertColorTo rgba'],
        \ 'R' : [':ConvertColorTo rgb',           'ConvertColorTo rgb'],
        \ 'h' : [':ConvertColorTo hex',           'ConvertColorTo hex'],
      \ },
      \ }
"}}}

" Files:
"{{{
let g:which_key_map.f = { 'name' : '+files',
      \ 'a' : [':wall',                    'write all'],
      \ 'A' : [':xa',                      'write all And quit'],
      \ 'd' : [':lcd %:p:h',               'set path to current directory'],
      \ 'e' : [':CocCommand explorer',     'explorer'],
      \ 'n' : [':enew',                    'create new'],
      \ 'q' : [':q!',                      'Quit'],
      \ 'S' : [':w !sudo tee %',           'Sudo Save'],
          \ 't' : { 'name': '+type',
              \ 'c' : [':set ft=css',    'css'],
              \ 'h' : [':set ft=html',   'html'],
              \ 'H' : [':set ft=haskel', 'haskel'],
              \ 'l' : [':set ft=lua',    'lua'],
              \ 'p' : [':set ft=php',    'php'],
              \ 's' : [':set ft=sh',     'shell'],
              \ 'v' : [':set ft=vim',    'vim'],
              \ 'y' : [':set ft=python', 'python'],
          \ },
      \ 'w' : [':w',                       'write file'],
      \ }
"}}}

""" Git:
"""{{{
""let g:which_key_map.G = { 'name' : '+Git',
""      \ 'a' : [':G add .',  'Add all'],
""      \ 'b' : [':Gblame',   'Blame'],
""      \ 'c' : [':BCommits', 'Commits for current buffer'],
""      \ 'C' : [':Gcommit',  'Commit'],
""      \ 'd' : [':Gdiff',    'Diff'],
""      \ 'e' : [':Gedit',    'Edit'],
""      \ 'l' : [':Glog',     'Log'],
""      \ 'r' : [':Gread',    'Read'],
""      \ 's' : [':Gstatus',  'Status'],
""      \ 'w' : [':Gwrite',   'Write'],
""      \ 'p' : [':Git push', 'Push'],
""      \ }
"""}}}

" Search:
"{{{
      " \  't':   [':Rg',        'text Rg'],
let g:which_key_map.s = { 'name': '+search',
      \  '/':   [':History/',  'history'],
      \  ';':   [':Commands',  'commands'],
      \  'b':   [':BLines',    'current buffer'],
      \  'B':   [':Buffers',   'open buffers'],
      \  'c':   [':Commits',   'commits'],
      \  'C':   [':BCommits',  'buffer commits'],
      \  'f':   [':Files',     'files'],
      \  'g':   [':GFiles',    'git files'],
      \  'G':   [':GFiles?',   'modified git files'],
      \  'h':   [':History',   'file history'],
      \  'H':   [':History:',  'command history'],
      \  'l':   [':Lines',     'lines'],
      \  'm':   [':Marks',     'marks'],
      \  'M':   [':Maps',      'normal maps'],
      \  'p':   [':Helptags',  'help tags'],
      \  'P':   [':Tags',      'project tags'],
      \  's':   [':Snippets',  'snippets'],
      \  'S':   [':Colors',    'color Schemes'],
      \  'a':   [':Ag',        'Text'],
      \  'T':   [':BTags',     'buffer Tags'],
      \  'w':   [':Windows',   'search Windows'],
      \  'y':   [':Filetypes', 'file tYpes'],
      \  'z':   [':FZF',       'FZF'],
      \  }
"}}}

" C         |ft-c-omni|
" (X)HTML with CSS      |ft-html-omni|
" JavaScript        |ft-javascript-omni|
" PHP         |ft-php-omni|
" Python
" Ruby          |ft-ruby-omni|
" SQL         |ft-sql-omni|
" XML         |ft-xml-omni|
" any language with syntax highlighting |ft-syntax-omni|

" Vim:
"{{{
let g:which_key_map.v = { 'name' : '+vim',
      \ 'd' : [':set background=dark',                        'set background dark'],
      \ 'l' : [':set background=light',                       'set background light'],
      \ 'k' : [':$tabnew ~/.config/nvim/_whichKey.vim', 'open vim-which-key config'],
      \ 'p' : [':PlugInstall',                                'Plug Install'],
      \ 'S' : [':source $MYVIMRC',                            'source vimrc'],
      \ 's' : [':mksession! .sess.vim',                       'save Session'],
      \ 't' : [':set termguicolors!',                         'termguicolors toggle'],
      \ 'v' : [':$tabnew $MYVIMRC',                           'open vimrc'],
      \ 'w' : [':$tabnew ~/Documents/todo/vim.todo',          'Wishlist'],
      \ 'o' : { 'name': '+OmniCompletions',
          \ 'o' : [':setlocal omnifunc=syntaxcomplete#Complete', 'syntax'],
          \ 'c' : [':setlocal omnifunc=csscomplete#CompleteCSS', 'CSS'],
          \ 'h' : [':setlocal omnifunc=htmlcomplete#CompleteTags', 'htmlTags'],
          \ 'j' : [':setlocal omnifunc=javascriptcomplete#CompleteJS', 'JavaScript'],
          \ 'p' : [':setlocal omnifunc=phpcomplete#CompletePHP', 'PHP'],
          \ '3' : [':setlocal omnifunc=python3complete#Complete', 'python3'],
          \ 'P' : [':setlocal omnifunc=pythoncomplete#Complete', 'python'],
          \ 's' : [':setlocal omnifunc=sqlcomplete#Mapsyntax', 'SQL'],
      \ },
      \ 'f' : { 'name': '+set folds',
          \ '0' : [':set foldlevel=0', 'level 0'],
          \ '1' : [':set foldlevel=1', 'level 1'],
          \ '2' : [':set foldlevel=2', 'level 2'],
          \ '3' : [':set foldlevel=3', 'level 3'],
          \ '4' : [':set foldlevel=4', 'level 4'],
          \ 'm' : [':set foldmethod=manual', 'manual'],
          \ 'k' : [':set foldmethod=marker foldmarker={{{,}}}', 'marker {{{'],
          \ 'i' : [':set foldmethod=indent', 'indent'],
          \ 'y' : [':set foldmethod=syntax', 'syntax'],
          \ '{' : [':set foldmethod=marker foldmarker={,}', 'marker {'],
          \ '(' : [':set foldmethod=marker foldmarker=(,)', 'marker ('],
          \ '[' : [':set foldmethod=marker foldmarker=[,]', 'marker ['],
          \ '<' : [':set foldmethod=marker foldmarker=<,>', 'marker <'],
      \ },
      \ 'c' : { 'name': '+colorschemes',
        \ 'c' : [':Colors',         'Colors (FZF)'],
        \ 't' : [':hi ColorColumn ctermbg=NONE guibg=NONE',         'Turn Off colorColumn'],
        \ 'd' : { 'name': '+dark',
          \ '1' : [':colorscheme codedark',         'code dark'],
          \ '2' : [':colorscheme nord',             'nord'],
          \ '3' : [':colorscheme minimalist',       'minimalist'],
          \ '4' : [':colorscheme one',              'one'],
          \ '5' : [':colorscheme onedark',          'onedark'],
          \ '6' : [':colorscheme oceanic_material', 'oceanic_material'],
          \ '7' : [':colorscheme gruvbox',          'gruvbox'],
        \ },
        \ 'n' : { 'name': '+neutral',
          \ '1' : [':colorscheme ayu',              'ayu'],
          \ '2' : [':colorscheme seoul256',         'seoul256'],
          \ '3' : [':colorscheme materialbox',      'materialbox'],
          \ '4' : [':colorscheme nord',             'nord'],
          \ '5' : [':colorscheme one-dark',         'one-dark'],
          \ '6' : [':colorscheme pablo',            'pablo'],
          \ '7' : [':colorscheme rdark-terminal',   'rdark-terminal'],
          \ '8' : [':colorscheme solarized8_high',  'solarized8_high'],
        \ },
        \ 'l' : { 'name': '+light',
          \ '1' : [':colorscheme seoul256-light',   'seoul256-light'],
          \ '2' : [':colorscheme github',           'github'],
          \ '3' : [':colorscheme iceburg',          'iceburg'],
          \ '4' : [':colorscheme lightning',        'lightning'],
          \ '5' : [':colorscheme morning',          'morning'],
        \ },
      \ },
      \ 'C' : { 'name': '+Coc',
        \ 'S' : [':CocCommand snippets.editSnippets', 'edit Snippets'],
        \ 'c' : [':CocClean',                         'clean'],
        \ 'd' : [':CocDiagnostics',                   'Diagnostics'],
        \ 'D' : [':norm! <Plug>(coc-definition)',     'Definition'],
        \ 'i' : [':CocInstall',                       'install'],
        \ 'k' : [':CocDisable',                       'kill'],
        \ 'r' : [':CocRestart',                       'restart'],
      \},
    \ }
"}}}

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

