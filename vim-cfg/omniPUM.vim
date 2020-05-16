" Popup Menu: _________________________________________________________________
	" no hard return when hitting enter after context menu:
	inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
	" make Tab cycle through autocompletes
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	set path+=**                          " search sub folders & help tab completes
	set showfulltag                       " Show full tag for completion
	set completeopt+=menu,longest,preview " Menu Options
	set complete+=i                       " scan included files
	set wildignorecase                    " search is case insensitive
	set infercase                         " Adjust completions to match case
	set wildcharm=<C-z>										" menu in command line

	set wildmenu                          " tab complete menu
	" Based on https://bitbucket.org/sjl/dotfiles/src/141b96496989091fce4aa5165946f94d31c2374f/vim/vimrc
    set wildignore+=.hg,.git,.svn,.bak,CSV                " Version control
		set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.tar.*

    set wildmode=list:longest,full
    if exists("&wildignorecase")
      set wildignorecase
    endif

	" These are files we are not likely to want to edit or read.
	set suffixes=.git,.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
	"make auto completes work in command line
	set wildchar=<Tab>

" Omni Completes: _____________________________________________________________
set omnifunc=syntaxcomplete#Complete

" gets the coc-config json file to work right:
autocmd FileType json syntax match Comment +\/\/.\+$+

" FIXME PLEASE:
" STILL MESSING WITH THIS TO GET IT RIGHT:
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP


"    set omnifunc=syntaxcomplete#Complete
"    augroup omnifuncs
"      autocmd!
"      autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"      autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"      autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"      "autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
"      autocmd FileType html,php,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"      autocmd FileType html,php,css setlocal omnifunc=csscomplete#CompleteCSS
"      autocmd FileType html,php,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"    augroup end


" augroup omnifuncs
" 	autocmd!
" 	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" 	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" 	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" 	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" 	"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" 	"autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
" 	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" 
" 	autocmd FileType php setlocal omnifunc=MyHTMLComplete
" 	function! MyHTMLComplete(findstart, base)
" 			autocmd FileType javascript setlocal omnifunc=tern#Complete
" 			autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" 			autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
" 			autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" 
" 			if search('<?php', 'bnW') > search('?>', 'bnW')
" 					return phpcomplete#CompletePHP(a:findstart, a:base)
" 			elseif search('<style', 'bnW') > search('</style>', 'bnW')
" 					return csscomplete#CompleteCSS(a:findstart, a:base)
" 			elseif search('<script', 'bnW') > search('</script>', 'bnW')
" 					return tern#Complete(a:findstart, a:base)
" 			else
" 					return htmlcomplete#CompleteTags(a:findstart,a:base)
" 			endif
" 	endfunction
" augroup end
" 

"autocmd FileType html setlocal omnifunc=MyHTMLComplete
"function! MyHTMLComplete(findstart, base)
"    autocmd FileType javascript setlocal omnifunc=tern#Complete
"    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"    if search('<?php', 'bnW') > search('<script>', 'bnW')
"        return phpcomplete#CompletePHP(a:findstart, a:base)
"    else
"        return tern#Complete(a:findstart,a:base)
"    endif
"endfunction

" Keywords And Text: __________________________________________________________

" PHP Generated Code Highlights (HTML & SQL)                                              
let php_sql_query=1                                                                                        
let php_htmlInStrings=1


autocmd FileType php,html,css,scss set iskeyword+=-
autocmd FileType php,html,css,scss set iskeyword+=_
autocmd FileType php,html,css,scss set iskeyword+=@,48-57,192-255
autocmd FileType php,html,css,scss set iskeyword-=$,!,~,+,=

" Insert Mode Triggers: _______________________________________________________
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
"FZF using this now ## inoremap qq <C-x><C-o>
" file complete
"FZF using this now ## inoremap qf <C-x><C-f>
" line complete
" FZF using this now ## inoremap q- <C-x><C-l>
" included files complete
inoremap qi <C-x><C-i>
