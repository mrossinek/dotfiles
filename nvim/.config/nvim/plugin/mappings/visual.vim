" visual @
vnoremap @ :<C-u>call mrossinek#functions#ExecuteMacroOverVisualRange()<CR>

" swap some commands
vnoremap v <C-v>
vnoremap <C-v> v

" web search
vnoremap <silent> gs :<C-u>call mrossinek#functions#WebSearch(visualmode(), 1)<Cr>
