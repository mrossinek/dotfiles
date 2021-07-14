" Esc key
tnoremap <Esc> <C-\><C-n>
tnoremap <A-e> <Esc>

" seemless window switching
tnoremap <A-H> <C-\><C-n><C-w>H
tnoremap <A-J> <C-\><C-n><C-w>J
tnoremap <A-K> <C-\><C-n><C-w>K
tnoremap <A-L> <C-\><C-n><C-w>L

" buffer navigation
tnoremap <C-S> <C-\><C-n>:e #<CR>
tnoremap <C-N> <C-\><C-n>:bnext<CR>
tnoremap <C-P> <C-\><C-n>:bprevious<CR>

" pasting
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
tnoremap <A-R> <C-\><C-n>0pi
