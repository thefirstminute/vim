Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Have the file system follow you around so you don't search everywhere
Plug 'airblade/vim-rooter'


"git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
"~/.fzf/install
" sudo snap install ripgrep --classic
" sudo snap install universal-ctags
" sudo snap connect universal-ctags:dot-ctags
" sudo apt install silversearcher-ag
" Only On New Systems: sudo apt install fd-find 
" otherwise download and install: https://github.com/sharkdp/fd/releases

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap qmap <plug>(fzf-maps-i)


nnoremap <leader>zf :Files<CR>
nnoremap <leader>zl :Lines<CR>
nnoremap <leader>zr :Rg<CR>
nnoremap <leader>za :Ag<CR>
nnoremap <leader>zs :Snippets<CR>
nnoremap <leader>zm :Marks<CR>
nnoremap <leader>zb :Buffers<CR>
nnoremap <leader>zt :Tags<CR>
nnoremap <leader>zh :Helptags<CR>

"imap qw <plug>(fzf-complete-word)
" Word completion with custom spec with popup layout option
imap <expr> qw fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9}})
imap qs <Esc>:Snippets<CR>
imap q- <plug>(fzf-complete-line)	
"find text in files:
nnoremap <leader>ft :Rg<CR>

" let g:fzf_tags_command = 'ctags -R'

" Border color
let g:fzf_layout = {'window': { 'width': 0.85, 'height': 0.85,'yoffset':0.5,'xoffset': 0.5 } }
" let g:fzf_preview_window = ''
let g:fzf_preview_window = 'right:55%'

" Path completion with custom source command
"inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> qf fzf#vim#complete#path('rg --files')


" Line Completion: !!!
" fzf#vim#complete#line([spec])	Line completion (all open buffers)

" Replace the default dictionary completion with fzf-based fuzzy completion
" Not Done Yet:
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

"Get Files
command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" " Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



"from the docs...kind of fun, but wtf?
function! s:make_sentence(lines)
	return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#vim#complete({
	\ 'source':  'cat /usr/share/dict/words',
	\ 'reducer': function('<sid>make_sentence'),
	\ 'options': '--multi --reverse --margin 15%,0',
	\ 'left':    20})

