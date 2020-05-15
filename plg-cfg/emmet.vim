Plug 'mattn/emmet-vim', { 'for': ['php', 'html', 'css'] }
let g:user_emmet_expandabbr_key="qe"
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
imap jk <plug>(emmet-move-next)
imap kj <plug>(emmet-move-prev)
let g:user_emmet_settings = {
			\    'html': {
			\        'empty_element_suffix': ' />',
			\    },
			\}
