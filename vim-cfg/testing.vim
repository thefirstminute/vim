" Stealing From Damian Conway {{{
" Modified DC Blinky Searches:
nnoremap <silent> n nzz:call HLNext(0.7)<cr>										
nnoremap <silent> N Nzz:call HLNext(0.7)<cr>

function! HLNext (blinktime)
	let [bufnum, lnum, col, off] = getpos('.')
	let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
	let target_pat = '\c\%#'.@/
	let ring = matchadd('ErrorMsg', target_pat, 101)
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	call matchdelete(ring)
	redraw
endfunction

"}}}
