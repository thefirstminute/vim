"Fix My Stupid Typos With Abbreviations:
" {{{
iab eixt     exit
iab ehco     echo
iab retrun   return
iab pritn    print
iab teh      the
iab taht     that
iab htan     than
iab fro      for
iab liek     like
iab liekwise likewise
iab styel    style
iab ;t       't
iab moer     more
iab previosu previous
iab mcuh     much
iab ahev     have
iab ahve     have
" }}} ===--0--=== End Typos

" General:
" {{{
inoremap &* &amp;
" }}} ===--0--=== End General

" Brackets N Quotes:
" {{{
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
" }}} ===--0--=== End 


" Comments:
" {{{
autocmd Filetype php,css inoremap ;com /*-- {{{ --*/<CR>/*-- }}} --*/<up><left><left><left><left><left><left><left><left>
autocmd Filetype vim inoremap ;com " :{{{ <CR>" }}}<Esc>0kla
autocmd Filetype php inoremap ;com 

inoremap ##* /* <C-o>A */
inoremap #** /*  */<left><left><left>
inoremap ##! <!-- <C-o>A -->
inoremap #!! <!--  --><left><left><left><left>
inoremap !{ <!-- {{{ --><left><left><left><left><left><left><left><left>
inoremap !} <!-- }}} --><left><left><left><left><left><left><left><left>
inoremap ;1 <!-- {{{ --><CR><!-- }}} --><up><left><left><left><left><left><left><left><left>
inoremap ;" " {{{ --><CR><!-- }}} --><up><left><left><left><left><left><left><left><left>
inoremap ;8 /*-- {{{ --*/<CR>/*-- }}} --*/<up><left><left><left><left><left><left><left><left>
" }}} ===--0--=== End Comments

" PHP:
" {{{
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
" }}} ===--0--=== End PHP

" HTML:
" {{{
" using for closetag.vim now autocmd Filetype php,html inoremap <// </<C-x><C-o>
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
" }}} ===--0--=== End HTML

" CSS:
" {{{
autocmd Filetype php,html,css inoremap !I !important
autocmd Filetype php,html,css inoremap ;mp margin:0; padding:0;
autocmd Filetype php,html,css inoremap ;var var(--);<left><left>
autocmd Filetype php,html,css inoremap ;bgc background-color: 
autocmd Filetype php,html,css inoremap ;bbx box-sizing: border-box;
" }}} ===--0--=== End CSS
