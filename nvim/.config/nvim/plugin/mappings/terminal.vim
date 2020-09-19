" Esc key
tnoremap <Esc> <C-\><C-n>
tnoremap <A-e> <Esc>

" seemless window switching
tnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
tnoremap <A-H> <C-\><C-n><C-w>H
tnoremap <A-J> <C-\><C-n><C-w>J
tnoremap <A-K> <C-\><C-n><C-w>K
tnoremap <A-L> <C-\><C-n><C-w>L

" pasting
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
tnoremap <A-R> <C-\><C-n>0pi
