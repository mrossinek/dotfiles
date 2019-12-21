" additional function keys
noremap <F13> <S-CR>
noremap <F14> <C-CR>

" window movement
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
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
nnoremap <space> za

" sourcing
nnoremap <leader>so :source %<cr>

" spelling
nnoremap <leader>sp :call mrossinek#functions#FixLastSpellingError()<cr>
nnoremap <leader>sl :setlocal spelllang=

" swap tag jumping
nnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>

" visual block mode is more useful than plain visual mode
nnoremap v <C-v>
nnoremap <C-v> v

" quickfix/location list toggles
nnoremap <silent> <leader>l :call mrossinek#functions#ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>q :call mrossinek#functions#ToggleList("Quickfix List", 'c')<CR>

" buffer navigation
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
