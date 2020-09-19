let g:grammarous#languagetool_cmd = 'languagetool'

augroup Grammarous
    autocmd!
    autocmd User MyGrammarous nnoremap <leader>gg :GrammarousCheck<CR>
    autocmd User MyGrammarous nnoremap <leader>gf <Plug>(grammarous-fixit)
    autocmd User MyGrammarous nnoremap <leader>gr <Plug>(grammarous-remove-error)
    autocmd User MyGrammarous nnoremap <leader>gd <Plug>(grammarous-disable-rule)
    autocmd User MyGrammarous nnoremap <leader>gn <Plug>(grammarous-move-to-next-error)
    autocmd User MyGrammarous nnoremap <leader>gp <Plug>(grammarous-move-to-previous-error)
augroup end
