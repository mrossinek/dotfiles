command! -nargs=* Note call notewarrior#NewNote(<f-args>)
command! -range Encrypt <line1>,<line2>call notewarrior#Encrypt()


nnoremap <leader>nn :Note\ 
" encryption function
vnoremap <leader>ne c<C-R>=system('gpg -ac -o- <<< "' . getreg('"') . '"')<CR>
" decryption function
vnoremap <leader>nd c<C-R>=system('gpg -d -o- <<< "' . getreg('"') . '"')<CR>
