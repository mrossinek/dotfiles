" additional function keys
map <F13> <S-CR>
map <F14> <C-CR>

" window movement
nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L

" zoom-win like functionality
" mnemonic: window maximize
nnoremap <C-W>m :winc _ <bar> winc <bar> <cr>
" mnemonic: window all
nnoremap <C-W>a :winc =<cr>

" simpler splitting
nnoremap <A--> :new<cr>
nnoremap <A-\|> :vnew<cr>

" scrolling
nnoremap <leader>sc :call mrossinek#functions#ToggleScrollingMode()<cr>
nnoremap <leader>scb :setlocal scb!<cr>
nnoremap <C-E> 2<C-E>
nnoremap <C-Y> 2<C-Y>

" folding
nnoremap \\ za

" sourcing
nnoremap <leader>so :source %<cr>

" spelling
nnoremap <leader>sp :call mrossinek#functions#FixLastSpellingError()<cr>
nnoremap <leader>sl :setlocal spelllang=

" visual block mode is more useful than plain visual mode
nnoremap v <C-v>
nnoremap <C-v> v

" quickfix/location list toggles
nnoremap <silent> <leader>l :call mrossinek#functions#ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>q :call mrossinek#functions#ToggleList("Quickfix List", 'c')<CR>

" quickfix navigation
nnoremap <C-J> :cnext<CR>
nnoremap <C-K> :cprevious<CR>

" buffer navigation
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>

" web search
nnoremap <silent> gs :set opfunc=mrossinek#functions#WebSearch<CR>g@

" vim sanity
nnoremap Y y$

" improve jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" prefer virtual replace mode of replace mode
nnoremap gR R
nnoremap R gR
