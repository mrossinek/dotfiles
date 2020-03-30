" Python support is installed into a virtualenv to allow seemless usage across
" system and other virtualenvs
call mrossinek#functions#SetPythonProvider()

" filetype autocommands
augroup filetype_cs
    autocmd!
    autocmd FileType cs packadd Omnisharp-vim
augroup end

augroup filetype_ledger
    autocmd!
    autocmd FileType ledger doautocmd User MyLedger
    autocmd FileType ledger packadd vim-ledger
augroup end

augroup filetype_mail
    autocmd!
    autocmd FileType mail packadd deoplete-khard
    autocmd FileType mail nnoremap <leader>m :setlocal filetype=markdown.mail<CR>
augroup end

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown packadd vim-markdown
augroup end

augroup filetype_python
    autocmd!
    autocmd FileType python packadd SimpylFold
    autocmd FileType python packadd deuterium
    autocmd FileType python packadd jedi-vim
    autocmd FileType python packadd pydoc.vim
augroup end

augroup filetype_rmarkdown
    autocmd!
    autocmd! FileType rmarkdown packadd vim-rmarkdown
augroup end

augroup filetype_tex
    autocmd!
    autocmd FileType tex packadd quicktex
    autocmd FileType tex packadd vimtex
augroup end

augroup writing
    autocmd!
    autocmd FileType text,markdown,pandoc doautocmd User MyGrammarous
    autocmd FileType text,markdown,pandoc packadd vim-grammarous
    autocmd FileType text,markdown,pandoc packadd vim-criticmarkup
    autocmd FileType text,markdown,pandoc packadd vim-verdict
    autocmd FileType markdown,pandoc,rmarkdown inoremap <buffer> ;` ```<CR><CR>```<Up>
augroup end

" localvimrc plugin: configure and load before any other plugin
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let g:localvimrc_event = ['BufWinEnter', 'BufRead']
runtime START plugin/localvimrc.vim
