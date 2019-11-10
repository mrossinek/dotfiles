" Python support is installed into a virtualenv to allow seemless usage across
" system and other virtualenvs
let g:python_host_prog = expand('~/Installations/pynvim2/.direnv/python-2.*/bin/python')
let g:python3_host_prog = expand('~/Installations/pynvim3/.direnv/python-3.*/bin/python')

" OPT Loading
augroup PackOptLoad
    autocmd!
    autocmd FileType ledger packadd vim-ledger
    autocmd FileType ledger doautocmd User MyLedger
    autocmd FileType cs packadd Omnisharp-vim
    autocmd FileType python packadd jedi-vim | call jedi#configure_call_signatures()
    autocmd FileType python packadd pydoc.vim
    autocmd FileType python packadd SimpylFold
    autocmd FileType tex packadd vimtex
    autocmd FileType mail packadd deoplete-khard
    autocmd FileType markdown packadd vim-markdown
    autocmd FileType text packadd vim-grammarous
    autocmd FileType text doautocmd User MyGrammarous
augroup end
