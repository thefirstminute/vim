" Interesting Idea For Presentations:
command! GO normal M17jzzH

" Editing N Modding Vimrc:
cab SO source $MYVIMRC<CR>:call CapsOff()<CR>
cab PI PlugInstall<CR>:call CapsOff()<CR>
cab VIM e $MYVIMRC<CR>:call CapsOff()<CR>

" Remove Trailing Whitespace:
cab WS %s/\s\+$//e<CR>:call CapsOff()<CR>

" New Lines For Each Tag::
cab HTMLPRETTY :%s/>\s*</>\r</g<CR>:call CapsOff()<CR>

" Remove <Span>S:
cab nospan :%s/span[^\>]*//<cr>:%s/<>//<cr>:%s/<\/>//<cr>:%s/<\/span>//g<cr>/span<cr>

" Swap Camelcase To Snake_case Must Visually Select First:
cab SNAKE :s/\%V\v([a-z])([A-Z])/\1_\L\2/g<CR>:call CapsOff()<CR>
" Swap Snake_case To Camelcase Must Visually Select First:
cab CAMEL :s/\%V\v_([a-z])/\u\1/g<CR>:call CapsOff()<CR>

" REMOVE SPACES AT THE END OF LINES:
cab EOL :keeppatterns %substitute/\s\+$//e<CR>:call CapsOff()<CR>:echo "Removed EOL Spaces"<CR>

" Remove Line Returns At End Of Line:
cab EOLR :%s/\r//g<CR>:call CapsOff()<CR>:echo "removed end of line chars"<CR>

" No Empty Lines: (Remove Blank Lines)
cab NOEMPTY :g/^$/d<CR>:call CapsOff()<CR>:echo "Removed Empty Lines"<CR>

" Turn Color Column On:
cab COL set colorcolumn=81<CR>:call CapsOff()<CR>
