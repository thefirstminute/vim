" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align' " use ga to align to whatever, like: gaip= or vipga= etc...

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
vmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" can have conflict with folds, allow EA to set folds to manual
let g:easy_align_bypass_fold = 1
