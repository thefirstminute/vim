" INSTALL VIMPLUG IF NOT INSTALLED:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
""" {{{
""if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
""  echo "Downloading junegunn/vim-plug..."
""  silent !mkdir -p ~/.config/nvim/autoload/
""  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
""  silent !mkdir -p ~/.config/nvim/pluggos/
""  autocmd VimEnter * PlugInstall
""endif
""" }}} ===-0-=== END Install Vimplug If Not Installed

" LOADING THE PLUGINS:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
" {{{
call plug#begin('~/.config/nvim/pluggos')

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Have the file system follow you around so you don't search everywhere
  Plug 'airblade/vim-rooter'

  "" bookmarks yanks


  " Text N Text Editing:
  "{{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "Plug 'ajh17/vimcompletesme'
  "Plug 'lifepillar/vim-mucomplete'

  Plug 'mattn/emmet-vim'", { 'for': ['php', 'html', 'css'] }
  Plug 'junegunn/vim-easy-align', { 'on': ['EasyAlign'] }
  Plug 'tpope/vim-surround'
  "Plug 'tpope/vim-commentary' " doesn't comment html inside php
  " this guy is my hero of the week:
  Plug 'tomtom/tcomment_vim'
  "" multi-file find and replace.
  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

  Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'  https://github.com/bonsaiben/bootstrap-snippets

  "}}}

  " Language & Syntax {{{
    "Plug 'sheerun/vim-polyglot', {'for': ['php', 'javascript', 'python']}  "More syntax support

    " PHP {{{
      Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': ['php'] }
      Plug 'StanAngeloff/php.vim', { 'for': 'php' }
      "Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
      " Plug 'stephpy/vim-php-cs-fixer'
      " https://github.com/shawncplus/phpcomplete.vim
      " for improved omniComplete for php??
      " Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
    "}}}

  "}}}


  " Misc Niceness:
  "{{{
  Plug 'andymass/vim-matchup', { 'for': ['php', 'html'] }  " shows matching tags in html
  Plug 'machakann/vim-highlightedyank' "shows you what you just yanked - I love this
  Plug 'ap/vim-css-color' "Show colours on screen
  Plug 'easymotion/vim-easymotion'
  Plug 'aserebryakov/vim-todo-lists'
  Plug 'kurkale6ka/vim-swap'     " swap words around a char/operator using <leader>x


  "Plug 'vim-scripts/colornames'
  Plug 'amadeus/vim-convert-color-to', { 'on': ['ConvertColorTo'] }
  "Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
  "Plug 'dbeniamine/cheat.sh-vim' " cheatsheet in vim
  "Plug 'MattesGroeger/vim-bookmarks'

  "}}}

  " Meh
  " {{{
  "loading whichkey manually...
  "Plug 'liuchengxu/vim-which-key' ", { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!'] }

  " }}}

call plug#end()
" }}} ===-0-=== END Loading The Plugins

" Plug Configs:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{

  " EasyAlign:
  "{{{
    " easyAlign:
    " works with <Space> = : . | & # and ,
    " = Around the 1st occurrences
    " 2= Around the 2nd occurrences
    " *= Around all occurrences
    " **= Left/Right alternating alignment around all occurrences
    " <Enter> Switching between left/right/center alignment modes
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    vmap ga <Plug>(EasyAlign)
    map <Leader>a: :EasyAlign \<CR>
    map <Leader>a= :EasyAlign =<CR>
    "}}}

  " FZF:
  "{{{
    "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    "~/.fzf/install
    " sudo snap install ripgrep --classic
    " sudo snap install universal-ctags
    " sudo snap connect universal-ctags:dot-ctags
    " sudo apt install silversearcher-ag
    " Only On New Systems: sudo apt install fd-find
    " otherwise download and install: https://github.com/sharkdp/fd/releases
    nmap <F1><F1> <plug>(fzf-maps-n)
    xmap <F1><F1> <plug>(fzf-maps-x)
    omap <F1><F1> <plug>(fzf-maps-o)
    imap <F1><F1> <plug>(fzf-maps-i)
    "nmap <c-p> :cclose<CR>:FZF<CR>
    nnoremap <leader>ag :Ag<CR>
    nnoremap <leader>rg :Rg<CR>
    "File Open
    nnoremap <leader>fo :Files<CR>
    "File Line
    nnoremap <leader>fl :Lines<CR>
    "Buffer Search
    nnoremap <leader>bl :BLines<CR>
    "Snippet Search
    nnoremap <leader>sn :Snippets<CR>
    "Marks Search
    nnoremap <leader>ms :Marks<CR>
    "Goto Buffer
    nnoremap <leader>gb :Buffers<CR>
    "Tags Search
    nnoremap <leader>ts :Tags<CR>
    "Help Tags
    nnoremap <leader>ht :Helptags<CR>

    let g:fzf_action = {
          \ 'ctrl-t': 'tab split',
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \}

    "Likey:
    "let g:fzf_layout = {'window': { 'width': 1, 'height': 0.35,'yoffset':100,'xoffset': 0,'options': ['--layout=reverse', '--info=inline']}  }



    "let g:fzf_layout = {'up':'~50%', 'window': { 'width': 1, 'height': 0.35,'yoffset':100,'xoffset': 0, 'highlight': 'Todo', } }

    "https://dev.to/zanets/fancy-fzf-on-neovim-41m8
    "let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }



    "let g:fzf_preview_window = 'right:44%'
    " Preview window on the upper side of the window with 40% height,

    " Empty value to disable preview window altogether
    let g:fzf_preview_window = []
    " \ to toggle preview window
    let g:fzf_preview_window = ['right:44%', '\']

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)

    "command! -bang -nargs=* Rg
    "  \ call fzf#vim#grep(
    "  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    "  \   fzf#vim#with_preview(), <bang>0)

    " Allow passing optional flags into the Rg command.
    "   Example: :Rg myterm -g '*.md'
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ "rg --column --line-number --no-heading --color=always --smart-case " .
      \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)


    " Grab My Koad Blocks:
    " {{{
    " https://stackoverflow.com/questions/48726172/fzf-to-read-file-into-nvim-buffer
    " TODO fix this mess, there HAS to be a better way!
    "command! -bang CSS call fzf#vim#files('~/Documents/templates/css/', <bang>0)
    let g:cssTemplates='~/Documents/templates/css/'
    function! CssGrab (file)
        execute ':r '.g:cssTemplates.a:file
    endfunction
    command! CSS call fzf#run({
        \  'source': 'ls '.g:cssTemplates,
        \  'sink':    function('CssGrab')})

    let g:phpTemplates='~/Documents/templates/php/'
    function! PhpGrab (file)
        execute ':r '.g:phpTemplates.a:file
    endfunction
    command! PHP call fzf#run({
        \  'source': 'ls '.g:phpTemplates,
        \  'sink':    function('PhpGrab')})

    let g:koadTemplates='~/Documents/templates/koadstrap/'
    function! KoadGrab (file)
        execute ':r '.g:koadTemplates.a:file
    endfunction
    command! KOAD call fzf#run({
        \  'source': 'ls '.g:koadTemplates,
        \  'sink':    function('KoadGrab')})
    " }}}



    "imap <expr> qw fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 1, 'xoffset':100 }})
    imap qs <Esc>:Snippets<CR>

    "imap <expr> q- fzf#vim#complete#line({'window': { 'width': 1, 'height': 0.2, 'yoffset':100 }})

    " Path completion
    inoremap <expr> qf fzf#vim#complete#path('rg --files')

    " Replace the default dictionary completion with fzf-based fuzzy completion
    "inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
    inoremap <expr> qd fzf#vim#complete('cat /usr/share/dict/words')
    "inoremap <expr> <c-x><c-s> fzf#vim#complete({
    "      \ 'source':  'cat /usr/share/dict/words',
    "      \ 'reducer': function('<sid>make_sentence'),
    "      \ 'options': '--multi --reverse --margin 15%,0',
    "      \ 'right':    20})




    hi! fzf_fg ctermfg=14
    hi! fzf_fgp ctermfg=3
    hi! fzf_hl ctermfg=5
    hi! fzf_hlp ctermfg=5
    hi! fzf_info ctermfg=6
    hi! fzf_prompt ctermfg=6
    hi! fzf_spinner ctermfg=6
    hi! fzf_pointer ctermfg=3

    let g:fzf_colors = {
      \ 'fg':      ['fg', 'fzf_fg'],
      \ 'hl':      ['fg', 'fzf_hl'],
      \ 'fg+':     ['fg', 'fzf_fgp'],
      \ 'hl+':     ['fg', 'fzf_hlp'],
      \ 'info':    ['fg', 'fzf_info'],
      \ 'prompt':  ['fg', 'fzf_prompt'],
      \ 'pointer': ['fg', 'fzf_pointer'],
      \ 'spinner': ['fg', 'fzf_spinner'] }

  "}}}

  " Commentary N Surround:
  "{{{
  " Use gc or gcc or :Commentary on a selection or line
  " Change surround:  cs'"
    "^would change from single quote to double, for example
  " Delete surround:  ds'
  " Select surround:  ysiw"
  " Line surround:    yss"
  " Bold word:        ysiw<b>
  "}}}

  " EasyAlign:
  "{{{
    " works with <Space> = : . | & # and ,
    " = Around the 1st occurrences
    " 2= Around the 2nd occurrences
    " *= Around all occurrences
    " **= Left/Right alternating alignment around all occurrences
    " <Enter> Switching between left/right/center alignment modes
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    vmap ga <Plug>(EasyAlign)
    map <Leader>al :EasyAlign<CR>
    map <Leader>a: :EasyAlign \<CR>
    map <Leader>a= :EasyAlign =<CR>
  "}}}


  " UltiSnips:
  "{{{
  let g:UltiSnipsSnippetDirectories  = [$HOME.'/.config/nvim/my_snippets/']
  let g:UltiSnipsExpandTrigger       = "qx"
  "let g:UltiSnipsListSnippets        = "qs"

  let g:UltiSnipsJumpForwardTrigger  = "qj"
  let g:UltiSnipsJumpBackwardTrigger = "qk"
  " UltiSnipsEdit
  let g:UltiSnipsEditSplit           = "vertical"
  let g:ultisnips_php_scalar_types   = 1

  function! QuickSnippets()
    "{{{
    let line = getline('.')                         " current line
    let substr = strpart(line, -1, col('.')+1)      " from the start of the current line to one character right of the cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    " nothing to match on empty string
    " look for snippets
    if (Ulti_ExpandOrJump_and_getRes() > 0)
      "expand Snippet
      "return g:ulti_expand_or_jump_res
    elseif (strlen(substr)==0)
      return "\<Esc>:Snippets\<CR>"
    else
      "return "\<Esc>:Emmet emmet-expand-abbr\<CR>"
      "return g:user_emmet_expandabbr_key
      "return "\<plug>(emmet-expand-abbr)"
      "return g:user_emmet_expandabbr
      return "\<Esc>:call emmet#expandAbbr(3,'')\<CR>"
    endif
  endfunction
  inoremap QQ <c-r>=QuickSnippets()<CR>

  let g:ulti_expand_or_jump_res = 0 "default value, just set once
  function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
  endfunction
  "}}}

  " End Ultisnips }}}

  " Emmet {{{
    let g:user_emmet_leader_key=','
    "let g:user_emmet_expandabbr_key="qe"

    let g:user_emmet_next_key = 'qj'
    let g:user_emmet_prev_key = 'qk'

    " enable in all modes:
    let g:user_emmet_mode='a'

    " user_emmet options {{{
    "  let g:user_emmet_expandabbr_key = '<C-y>,'
    "  let g:user_emmet_expandword_key = '<C-y>;'
    "  let g:user_emmet_update_tag = '<C-y>u'
    "  let g:user_emmet_balancetaginward_key = '<C-y>d'
    "  let g:user_emmet_balancetagoutward_key = '<C-y>D'
    "  let g:user_emmet_next_key = '<C-y>n'
    "  let g:user_emmet_prev_key = '<C-y>N'
    "  let g:user_emmet_imagesize_key = '<C-y>i'
    "  let g:user_emmet_togglecomment_key = '<C-y>/'
    "  let g:user_emmet_splitjointag_key = '<C-y>j'
    "  let g:user_emmet_removetag_key = '<C-y>k'
    "  let g:user_emmet_anchorizeurl_key = '<C-y>a'
    "  let g:user_emmet_anchorizesummary_key = '<C-y>A'
    "  let g:user_emmet_mergelines_key = '<C-y>m'
    "  let g:user_emmet_codepretty_key = '<C-y>c'
    " }}}

    let g:user_emmet_settings = {
          \    'html': {
          \        'empty_element_suffix': ' />',
          \        'indentation' : '  '
          \    },
          \    'php' : {
          \        'extends' : 'html',
          \        'filters' : 'html,c',
          \    },
          \    'javascript' : {
          \        'snippets' : {
          \            'jq' : "\\$(function() {\n\t${cursor}${child}\n});",
          \            'jq:each' : "\\$.each(arr, function(index, item)\n\t${child}\n});",
          \            'fn' : "(function() {\n\t${cursor}\n})();",
          \            'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
          \        },
          \    },
          \}

    " stop using /> to close tags
    let g:emmet_html5=1
  " }}}

  " mhinz/vim-grepper
  "{{{
  let g:grepper={}
  let g:grepper.tools=["rg"]

  xmap gr <plug>(GrepperOperator)

  xmap <C-r> <plug>(GrepperOperator)

  " After searching for text, press this mapping to do a project wide find and
  " replace. It's similar to <leader>r except this one applies to all matches
  " across all files instead of just the current file.
  nnoremap <C-r>
    \ :let @s='\<'.expand('<cword>').'\>'<CR>
    \ :Grepper -cword -noprompt<CR>
    \ :cfdo %s/<C-r>s//g \| update
    \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

  " The same as above except it works with a visual selection.
  xmap <C-r>
      \ "sy
      \ gvgr
      \ :cfdo %s/<C-r>s//g \| update
       \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
  "}}}

  " easymotion
  "{{{
  let g:EasyMotion_smartcase = 1
  " s{char}{char} to move to {char}{char}
  map  s <Plug>(easymotion-overwin-f2)
  nmap s <Plug>(easymotion-overwin-f2)
  "}}}

"}}}
