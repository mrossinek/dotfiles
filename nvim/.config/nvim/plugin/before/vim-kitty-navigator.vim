let g:kitty_navigator_no_mappings = 1

nnoremap <silent> <M-h> :KittyNavigateLeft<cr>
nnoremap <silent> <M-j> :KittyNavigateDown<cr>
nnoremap <silent> <M-k> :KittyNavigateUp<cr>
nnoremap <silent> <M-l> :KittyNavigateRight<cr>

inoremap <silent> <M-h> <C-\><C-n>:KittyNavigateLeft<cr>
inoremap <silent> <M-j> <C-\><C-n>:KittyNavigateDown<cr>
inoremap <silent> <M-k> <C-\><C-n>:KittyNavigateUp<cr>
inoremap <silent> <M-l> <C-\><C-n>:KittyNavigateRight<cr>

vnoremap <silent> <M-h> <C-\><C-n>:KittyNavigateLeft<cr>
vnoremap <silent> <M-j> <C-\><C-n>:KittyNavigateDown<cr>
vnoremap <silent> <M-k> <C-\><C-n>:KittyNavigateUp<cr>
vnoremap <silent> <M-l> <C-\><C-n>:KittyNavigateRight<cr>

tnoremap <silent> <M-h> <C-\><C-n>:KittyNavigateLeft<cr>
tnoremap <silent> <M-j> <C-\><C-n>:KittyNavigateDown<cr>
tnoremap <silent> <M-k> <C-\><C-n>:KittyNavigateUp<cr>
tnoremap <silent> <M-l> <C-\><C-n>:KittyNavigateRight<cr>
