augroup filetype_ledger
    autocmd!
    autocmd FileType ledger doautocmd User MyLedger
    autocmd FileType ledger packadd vim-ledger
augroup end

augroup filetype_mail
    autocmd!
    autocmd FileType mail nnoremap <leader>m :setlocal filetype=markdown.mail<CR>
augroup end

augroup filetype_python
    autocmd!
    autocmd FileType python packadd coveragepy.vim
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
    " autocmd FileType text,markdown,pandoc packadd vim-criticmarkup
    autocmd FileType text,markdown,pandoc packadd vim-verdict
augroup end

