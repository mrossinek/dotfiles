" Python support is installed into a virtualenv to allow seemless usage across
" system and other virtualenvs
call mrossinek#functions#SetPythonProvider()

" OPT Loading
augroup PackOptLoad
    autocmd!
    autocmd FileType ledger packadd vim-ledger
    autocmd FileType ledger doautocmd User MyLedger
    autocmd FileType cs packadd Omnisharp-vim
    autocmd FileType python packadd jedi-vim | call jedi#configure_call_signatures()
    autocmd FileType python packadd pydoc.vim
    autocmd FileType python packadd SimpylFold
    autocmd FileType python packadd deuterium
    autocmd FileType tex packadd vimtex
    autocmd FileType tex packadd quicktex
    autocmd FileType mail packadd deoplete-khard
    autocmd FileType markdown packadd vim-markdown
    autocmd FileType text packadd vim-grammarous
    autocmd FileType text doautocmd User MyGrammarous
augroup end

" localvimrc plugin: configure and load before any other plugin
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let g:localvimrc_event = ['BufWinEnter', 'BufRead']
runtime START plugin/localvimrc.vim
