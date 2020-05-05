" Popup Menu:
" {{{
" no hard return when hitting enter after context menu:
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" make Tab cycle through autocompletes
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set path+=**    " search sub folders & help tab completes
set wildmenu    " tab complete menu
set showfulltag " Show full tag for completion

set completeopt+=menu,longest,preview
set complete+=i " scan included files
set wildignorecase  "search is case insensitive

set wildmode=list:longest,full
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" PHP Generated Code Highlights (HTML & SQL)                                              
let php_sql_query=1                                                                                        
let php_htmlInStrings=1


set iskeyword+=-
set iskeyword+=_
autocmd FileType php,html,css,scss set iskeyword+=@,48-57,192-255
autocmd FileType php,html,css set iskeyword-=$,!,~,+,=
" }}} END POPUP

"make auto completes work in command line
set wildchar=<Tab>

" Luke Smith's placeholder jumper
" {{{
inoremap <F5> <Esc>/<++><Enter>ca<
vnoremap <F5> /<++><Enter>ca<
nnoremap <F5> /<++><Enter>ca<
" }}} ===--0--=== End Luke's


" COMMAND MODE:
" {{{
cab SO so $MYVIMRC
cab PI PlugInstall
cab CS colorscheme
cab VIM e $MYVIMRC
cab SNIP CocCommand snippets.editSnippets
" }}} ===--0--=== End COMMAND MODE


" NORMAL MODE:
" {{{
" comment php (or css) line
nnoremap <Leader>8 I/* <C-o>A */<Esc>
" comment html line
nnoremap <Leader>1 I<!-- <C-o>A --><Esc>
" }}} ===--0--=== End NORMAL MODE


" INSERT MODE:
" {{{

" Insert AutoComplets:
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
inoremap qq <C-x><C-o>
" file complete
inoremap qf <C-x><C-f>
" line complete
inoremap q- <C-x><C-l>
" included files complete
inoremap qi <C-x><C-i>
" }}}


" General:
inoremap &* &amp;

" Brackets N Quotes:
inoremap (, (''),<left><left><left>
inoremap ('; ('');<left><left><left>
inoremap ("; ("");<left><left><left>
inoremap (' ('')<left><left>
inoremap (" ("")<left><left>
inoremap (; ();<left><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {; {<CR>};<ESC>O
inoremap ({ ({<CR>});<ESC>O
inoremap [] []<left>
inoremap [" [""]<left><left>
inoremap [' ['']<left><left>
inoremap [; [""];<left><left><left>
inoremap {} {}<left>
inoremap () ()<left>
inoremap """ ""<left>
inoremap ''' ''<left>
inoremap "", "",<left><left>
inoremap '', '',<left><left>
inoremap ""; "";<left><left>
inoremap ''; '';<left><left>
inoremap '. '.  .'<left><left><left>
inoremap ". ".  ."<left><left><left>

" Comments:
inoremap ##* /* <C-o>A */
inoremap #** /*  */<left><left><left>
inoremap ##! <!-- <C-o>A -->
inoremap #!! <!--  --><left><left><left><left>
inoremap !{{{ <!-- {{{ --><left><left><left><left><left><left><left><left>
inoremap !}}} <!-- }}} --><left><left><left><left><left><left><left><left>
inoremap ;1 <!-- {{{ --><CR><!-- }}} --><up><left><left><left><left><left><left><left><left>
inoremap ;8 /*-- {{{ --*/<CR>/*-- }}} --*/<up><left><left><left><left><left><left><left><left>


" PHP:
autocmd Filetype php,html inoremap ;php  <?php  ?><left><left><left>
autocmd Filetype php,html inoremap ;pp  <?php
autocmd Filetype php,html inoremap ;pc  <Esc>A ?>
autocmd Filetype php,html inoremap ;pec <?php echo  ?><left><left><left>
autocmd Filetype php,html inoremap ;pin <?php include_once '' ?><left><left><left><left>
autocmd Filetype php,html inoremap ;pre <?php require_once '' ?><left><left><left><left>
autocmd Filetype php,html inoremap ;pif <?php if (): ?><left><left><left><left><left>
autocmd Filetype php,html inoremap ;pelse <?php else: ?>
autocmd Filetype php,html inoremap ;pend <?php endif; ?>
autocmd Filetype php,html inoremap ;self <?php echo $_SERVER['PHP_SELF'] ?>
autocmd Filetype php,html inoremap ;get $_GET['']<++><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;post $_POST['']<++><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;req $_REQUEST['']<++><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;sess $_SESSION['']<++><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;isset isset()<left>
autocmd Filetype php,html inoremap ;ifset if(isset()){<++>}<left><left><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;pelif <?php elseif (): ?><left><left><left><left><left>
autocmd Filetype php,html inoremap ;u=u username='$username'
autocmd Filetype php,html inoremap ;k2v foreach ($row as $key => $val) { $$key=$val; }
autocmd Filetype php,html inoremap ;rq require('');<left><left><left>
autocmd Filetype php,html inoremap ;ro require_once('');<left><left><left>

" HTML:
autocmd Filetype php,html inoremap <// </<C-x><C-o>
autocmd Filetype php,html inoremap ;/ <Esc>lmai</<C-x><C-o><Esc>`ai
autocmd Filetype php,html inoremap ;val value=""<left>
autocmd Filetype php,html inoremap ;na name=""<left>
autocmd Filetype php,html inoremap ;cl class=""<left>
autocmd Filetype php,html inoremap ;dc <div class=""></div><left><left><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;ds <div style=""></div><left><left><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;div <div></div><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;a <a href=""><++></a><left><left><left><left><left><left><left><left><left><left>
autocmd Filetype php,html inoremap ;ti title=""<left>
autocmd Filetype php,html inoremap ;id id=""<left>
autocmd Filetype php,html inoremap ;. class=""<left>
autocmd Filetype php,html inoremap ;, style=""<left>
autocmd Filetype php,html inoremap ;sty style=""<left>
autocmd Filetype php,html inoremap ;3 id=""<left>
autocmd Filetype php,html inoremap ;br <br />
autocmd Filetype php,html inoremap ;eb echo '<br />';
autocmd Filetype php,html inoremap ;hr <hr />

" CSS:
autocmd Filetype php,html,css inoremap !I !important
autocmd Filetype php,html,css inoremap ;mp margin:0; padding:0;
autocmd Filetype php,html,css inoremap ;var var(--);<left><left>
autocmd Filetype php,html,css inoremap ;bgc background-color: 
autocmd Filetype php,html,css inoremap ;bbx box-sizing: border-box;
" }}} ===--0--=== End INSERT MODE

"Fix My Stupid Typos With Abbreviations:
" {{{
iab eixt				exit
iab ehco    		echo
iab retrun  		return
iab pritn   		print
iab teh     		the
iab taht    		that
iab fro     		for
iab liek    		like
iab liekwise		likewise
iab styel				style
iab ;t      		't
iab moer    		more
iab previosu  	previous
iab mcuh				much
" }}} ===--0--=== End NORMAL MODE
