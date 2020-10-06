" Python support is installed into a virtualenv to allow seemless usage across
" system and other virtualenvs
call mrossinek#functions#SetPythonProvider()

colorscheme mrossinek

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
    autocmd FileType markdown,pandoc inoremap <buffer> ;` ```<CR><CR>```<Up>
augroup end

if exists('$EXTRA_VIM')
  for path in split($EXTRA_VIM, ':')
    exec 'source '.path
  endfor
endif
