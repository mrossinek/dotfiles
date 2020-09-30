let g:grammarous#languagetool_cmd = 'languagetool'

augroup Grammarous
    autocmd!
    autocmd User MyGrammarous nnoremap <leader>xg :GrammarousCheck<CR>
    autocmd User MyGrammarous nnoremap <leader>xf <Plug>(grammarous-fixit)
    autocmd User MyGrammarous nnoremap <leader>xr <Plug>(grammarous-remove-error)
    autocmd User MyGrammarous nnoremap <leader>xd <Plug>(grammarous-disable-rule)
    autocmd User MyGrammarous nnoremap <leader>xn <Plug>(grammarous-move-to-next-error)
    autocmd User MyGrammarous nnoremap <leader>xp <Plug>(grammarous-move-to-previous-error)
augroup end
