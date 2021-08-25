" encryption function
vnoremap ;ne c<C-R>=system('gpg -ac -o- <<< "' . getreg('"') . '"')<CR>
" decryption function
vnoremap ;nd c<C-R>=system('gpg -d -o- <<< "' . getreg('"') . '"')<CR>
