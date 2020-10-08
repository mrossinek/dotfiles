" visual @
vnoremap @ :<C-u>call mrossinek#functions#ExecuteMacroOverVisualRange()<CR>

" swap some commands
vnoremap v <C-v>
vnoremap <C-v> v

" web search
vnoremap <silent> gs :<C-u>call mrossinek#functions#WebSearch(visualmode(), 1)<Cr>

" move lines
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
" Source: https://vimtricks.substack.com/p/vimtrick-moving-lines
