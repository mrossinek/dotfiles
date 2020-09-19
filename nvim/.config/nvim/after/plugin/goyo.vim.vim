let g:goyo_width = '90%'
let g:goyo_height = '90%'

augroup Goyo
    autocmd!
    autocmd! User GoyoEnter nested call mrossinek#plugins#goyo_enter()
    autocmd! User GoyoLeave nested call mrossinek#plugins#goyo_leave()
augroup end

nnoremap gy :Goyo<cr>
