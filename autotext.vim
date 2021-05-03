""" Templated text:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
"Read File Into Current File:
nnoremap <leader>rf  :-1read ~/Documents/templates/
"Find Documents:
nnoremap <leader>doc  :tabnew ~/Documents/templates/
"}}}

set omnifunc=syntaxcomplete#Complete

""" PopUpMenu:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
set wildmenu    " tab complete menu

" ignore things that just slow us down
set wildignore+=.hg,.git,.svn,*.pyc,*.zip,*.swp
set wildignore+=*/node_modules/*,*/vendor/*,*/tmp/*

set wildmode=list:longest,full

set complete+=i " scan included files
set path+=**    " search sub folders & help tab completes
set showfulltag " Show full tag for completion

" add hypenated and snake case words
set iskeyword+=-
set iskeyword+=_

" no hard return when hitting enter after context menu:
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"" make Tab cycle through autocompletes
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Navigate the complete menu items with up or down arrows
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
" Select the complete menu item with right
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
" Cancel the complete menu item with left
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

"set completeopt=menuone,longest,preview,noinsert
set completeopt=longest,menuone,preview
"set completeopt=longest,menuone

function! Smarty_Tab()
  if pumvisible()
    return "\<C-N>"
  else
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
    elseif exists('&omnifunc') && &omnifunc != ''
      return "\<C-X>\<C-O>"
    else
      return "\<C-X>\<C-I>"                         " plugin matching
    endif
  endif
endfunction
inoremap ;<Tab> <C-R>=Smarty_Tab()<CR>


au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType php,html,css,scss set iskeyword+=@,48-57,192-255
au FileType php,html,css set iskeyword-=$,!,~,+,=

"au FileType python set omnifunc=pythoncomplete#Complete
"au FileType python set commentstring=#\ %s
"au FileType python set tabstop=4
"au FileType python set shiftwidth=4
"au FileType python set softtabstop=4
"au FileType python set foldlevel=3
"au FileType python retab


"}}}


""" OmAuComs:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
" Calling omni the easy way
" put yanked
inoremap qv <C-r>"
" put 2nd last yanked
inoremap qb <C-r>0
" prev complete
inoremap qp <C-p>
" next complete
inoremap qn <C-n>
" tag complete
inoremap q] <C-x><C-]>
" omni complete
inoremap qo <C-x><C-o>
" file complete
inoremap qf <C-x><C-f>
" line complete
inoremap q- <C-x><C-l>
" included files complete
inoremap qi <C-x><C-i>

function! QuickOmni()
  let line = getline('.')                         " current line
  let substr = strpart(line, -1, col('.')+1)      " from the start of the current line to one character right of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  " check Omini Options
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif

endfunction
inoremap qq <c-r>=QuickOmni()<CR>

"}}}

" making noticeable consistent comments:   ₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪₪
"{{{
set colorcolumn=80
" doing this in looks:
"hi ColorColumn ctermbg=NONE guibg=NONE
inoremap ;<right> <space><space><space><Esc>:exec 'norm '.(&cc - 10 - strlen(getline('.'))).'A₪'
inoremap ;<left> <space><Esc>:exec 'norm 8a₪'
"highlight chars at 81st column 2mat ErrorMsg '\%81v.'
"}}}

inoremap ;; ;<Esc>l
inoremap ;: <Esc>A;<Esc>


" Fix My Typos:
" {{{
" never quite got this working, probably need a function
"nnoremap <Leader>ty diw:!echo "iab <C-r>" .input("Replace <C-r>" with: "). >> ~/.config/nvim/typos.vim'<CR>
"<CR><CR>:echo "Let Me Fix That For You"<CR>
"nnoremap <expr> <Leader>yj "mm". input("How many lines down? ") ."jyy'mp"
cab TYPO vs ~/.config/nvim/_qtext.vim
iab ;t          't
iab ;s          's
iab hwile       while
iab ehco        echo
iab eixt        exit
iab fasle       false
iab fro         for
iab htis        this
iab liek        like
iab liekwise    likewise
iab mcuh        much
iab moer        more
iab previosu    previous
iab pritn       print
iab retrun      return
iab styel       style
iab taht        that
iab teh         the
"}}}

" Abbreviations:

" {{{
iab fcn         function
iab icl         include
" }}}

" OmAuComs: (Calling omni the easy way)
" {{{
" put yanked
inoremap qv <C-r>"
" put 2nd last yanked
inoremap qb <C-r>0
" prev complete
inoremap qp <C-p>
" next complete
inoremap qn <C-n>
" tag complete
inoremap q] <C-x><C-]>
" omni complete
inoremap qo <C-x><C-o>
" file complete
inoremap qf <C-x><C-f>
" line complete
inoremap q- <C-x><C-l>
" included files complete
inoremap qi <C-x><C-i>
" }}}

" General:
" {{{
augroup genAu
  autocmd!
" Brackets N Quotes:
inoremap (', (''),<left><left><left>
inoremap ('; ('');<left><left><left>
inoremap ("; ("");<left><left><left>
inoremap ('' ('')<left><left>
inoremap ("" ("")<left><left>
inoremap (; ();<left><left>
inoremap {; {};<left><left>
inoremap {;<CR> {<CR>};<ESC>O
inoremap {{<CR> {<CR>}<ESC>O
inoremap ({ ({<CR>});<ESC>O
inoremap [[ []<left>
inoremap ["" [""]<left><left>
inoremap ['' ['']<left><left>
inoremap ["; [""];<left><left><left>
inoremap ['; [''];<left><left><left>
inoremap {{<space> {}<left>
inoremap ((<space> ()<left>
inoremap """ ""<left>
inoremap ''' ''<left>
inoremap "", "",<left><left>
inoremap '', '',<left><left>
inoremap ""; "";<left><left>
inoremap ;eb ='';
inoremap ''; '';<left><left>
inoremap '.. '.  .'<left><left><left>
inoremap ".. ".  ."<left><left><left>

" Vim Folds:
inoremap ;1 <Esc>m`O<!-- {{{ --><Esc>jo<!-- }}} --><Esc>``a
nnoremap <Leader>f1 ddO<!-- {{{ --><CR><!-- }}} --><Esc>P
vnoremap <Leader>f1 dO<!-- {{{ --><CR><!-- }}} --><Esc>P

inoremap ;' <Esc>m`O" {{{ "<Esc>jo" }}} "<Esc>``a
nnoremap <Leader>f' ddO" {{{ "<CR>" }}} "<Esc>P
vnoremap <Leader>f' dO" {{{ "<CR>" }}} "<Esc>P

inoremap ;8 <Esc>m`O/* {{{ */<Esc>jo/* }}} */<Esc>``a
nnoremap <Leader>f8 ddO/* {{{ */<CR>/* }}} */<Esc>P
vnoremap <Leader>f8 dO/* {{{ */<CR><CR>/* }}} */<Esc>kP

" Comments:
inoremap ##* /* <C-o>A */
inoremap #** /*  */<left><left><left>
inoremap ##! <!-- <C-o>A -->
inoremap #!! <!--  --><left><left><left><left>
inoremap #{{{ ###  {{{ ###<left><left><left><left><left><left><left><left>
inoremap #}}} ###  }}} ###<left><left><left><left><left><left><left><left>
inoremap !{{{ <!-- {{{ --><left><left><left><left><left><left><left><left>
inoremap !}}} <!-- }}} --><left><left><left><left><left><left><left><left>
inoremap *{{{ /* {{{ */<left><left><left><left><left><left><left><left>
inoremap *}}} /* }}} */<left><left><left><left><left><left><left><left>
inoremap ;1 <!-- {{{ --><CR><!-- }}} --><up><left><left><left><left><left><left><left><left>
inoremap ;8 /*-- {{{ --*/<CR>/*-- }}} --*/<up><left><left><left><left><left><left><left><left>
inoremap ;3 # {{{<CR><CR># }}}<up>
inoremap ;' " {{{<CR><CR>" }}}<up>

augroup END

" using tcomment now:
"nnoremap <Leader>8 I/* <C-o>A */<Esc>
"vnoremap <Leader>8 di/* <C-r>" */<Esc>
"nnoremap <Leader>1 I<!-- <C-o>A --><Esc>
"vnoremap <Leader>1 di<!-- <C-r>" --><Esc>



"" " }}}

" Web:
" {{{
augroup webAu
  autocmd!
  " Comments:

  " HTML:
  autocmd FileType html,php inoremap <// </<c-x><c-o>
  autocmd FileType html,php inoremap ,/ </<esc>m`2T<yiw``pa><esc>T>i
  autocmd Filetype php,html inoremap Qdd die('<style> body { background-color: #333; color:#EEE; }</style>');
  autocmd Filetype php,html inoremap Qval value=""<left>
  autocmd Filetype php,html inoremap Qna name=""<left>
  autocmd Filetype php,html inoremap Qcl class=""<left>
  autocmd Filetype php,html inoremap Qdc <div class=""></div><left><left><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qds <div style=""></div><left><left><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qdiv <div></div><left><left><left><left><left><left>
  autocmd Filetype html,php inoremap Qp <p></p><left><left><left><left>
  autocmd Filetype html,php inoremap Qh1 <h1></h1><left><left><left><left><left>
  autocmd Filetype html,php inoremap Qh2 <h2></h2><left><left><left><left><left>
  autocmd Filetype html,php inoremap Qh3 <h3></h3><left><left><left><left><left>
  autocmd Filetype html,php inoremap Qh4 <h4></h4><left><left><left><left><left>
  autocmd Filetype html,php inoremap Qh5 <h5></h5><left><left><left><left><left>
  autocmd Filetype html,php inoremap Qa <a href=""><++></a><Esc>9<left>i
  autocmd Filetype php,html inoremap Qti title=""<left>
  autocmd Filetype php,html inoremap Qid id=""<left>
  autocmd Filetype php,html inoremap Q. class=""<left>
  autocmd Filetype php,html inoremap Q, style=""<left>
  autocmd Filetype php,html inoremap Qst style=""<left>
  autocmd Filetype php,html inoremap Q3 id=""<left>
  autocmd Filetype php,html inoremap Qbr <br />
  autocmd Filetype php,html inoremap Qeb echo '<br />';
  autocmd Filetype php,html inoremap Qhr <hr />
  autocmd FileType html,php inoremap &* &amp;
  autocmd FileType html,php inoremap ;br<CR> <br><CR>
  autocmd FileType html,php inoremap ;br<space> <br>
  autocmd FileType html inoremap ;c <esc>mmI<!-- <Esc>A --><Esc>`mi
  "autocmd FileType html,php iab <script <script type="text/javascript"><CR><CR></script><up>

  " PHP:
  autocmd Filetype php inoremap ;row $row[''];<left><left><left>
  autocmd Filetype php inoremap ;arr $arr[''];<left><left><left>
  autocmd Filetype php,html inoremap Qphp <?php  ?><left><left><left>
  autocmd Filetype php,html inoremap Qpo <?php
  autocmd Filetype php,html inoremap Qpc <Esc>m`A ?><Esc>``i
  autocmd Filetype php,html inoremap Qec <?php echo  ?><left><left><left>
  autocmd Filetype php,html inoremap pecho <?php echo  ?><left><left><left>
  autocmd Filetype php,html inoremap Qif <?php if (): ?><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qelse <?php else: ?>
  autocmd Filetype php,html inoremap Qelif <?php elseif (): ?><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qend <?php endif; ?>
  autocmd Filetype php,html inoremap Qself <?php echo $_SERVER['PHP_SELF'] ?>
  autocmd Filetype php,html inoremap Qget $_GET['']<++><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qpost $_POST['']<++><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qreq $_REQUEST['']<++><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qsess $_SESSION['']<++><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qisset isset()<left>
  autocmd Filetype php,html inoremap Qifset if(isset()){<++>}<left><left><left><left><left><left><left><left>
  autocmd Filetype php,html inoremap Qk2v foreach ($row as $key => $val) { $$key=$val; }
  autocmd Filetype php,html inoremap Qrq require('');<left><left><left>
  autocmd Filetype php,html inoremap Qro require_once('');<left><left><left>
  autocmd Filetype php,html inoremap Qio include_once('');<left><left><left>
  autocmd Filetype php,html inoremap u=u username='$username'
  autocmd Filetype php,html inoremap Qpre echo '<pre>' . var_export($array, true) . '</pre>';<Esc>8b

  " CSS:
  autocmd Filetype php,html,css inoremap !I !important
  autocmd FileType php,css inoremap ;c <esc>mmI/*--- <Esc>A ---*/<Esc>`mi
  autocmd Filetype php,html,css inoremap Qmp margin:0; padding:0;
  autocmd Filetype php,html,css inoremap Qmq @media screen and (max-width: 770px) {}<left>
  autocmd Filetype php,html,css inoremap Qvar var(--);<left><left>
  autocmd Filetype php,html,css inoremap Qbgc background-color:
  autocmd Filetype php,html,css inoremap Qbbx box-sizing: border-box;
  autocmd FileType php,html,css inoremap Qvc var(--color);<left><left>

  " SQL:
  autocmd Filetype sql,php inoremap Qjoin $qry="<CR>SELECT s.var2 AS location, s.var3 AS shipping, d.var2 AS discount<CR>FROM user_vars s<CR>LEFT JOIN user_vars d<CR>ON s.usr=d.usr AND d.thing='store-discount'<CR>WHERE s.usr='$customer' AND s.thing='stockist-info'<CR>ORDER BY s.id ASC";


"  autocmd FileType php,html,css iab cssmiddle .MIDDLE {<CR>display: flex;<CR>flex-wrap: wrap;<CR>align-content: center;<CR>justify-content: center;<CR>height: 100%;<CR>}
"  autocmd FileType php,html,css iab mp0 margin:0; padding:0;

augroup END
"}}}

" Vim:
" {{{
augroup vimQtexts
  autocmd!
  autocmd FileType vim inoremap ;c <esc>mmI" --- <esc>`mi
  autocmd FileType vim inoremap ;b <Esc>I"{{{<CR><Esc>o"}}}<Esc>
  autocmd FileType vim vnoremap <Leader>cb dO"{{{<Esc>po"}}}<Esc>
  autocmd FileType vim nnoremap <Leader>cb ddO"{{{<Esc>po"}}}<Esc>
augroup END
"}}}
