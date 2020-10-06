command! Note call notes#notes#index()
command! -nargs=1 NoteNew call notes#notes#new_note(<f-args>)

let g:zettelkasten = '~/Files/Notes'

" TODO use telescope.nvim for link completion

" mnemonic: Zettelkasten
" Note: I don't like the normal ZZ mapping (:wq)
map ZZ <Plug>Note
nnoremap <unique> <script> <silent> <Plug>Note :Note<CR>

nnoremap <leader>nn :NoteNew 
" encryption function
vnoremap <leader>ne c<C-R>=system('gpg -ac -o- <<< "' . getreg('"') . '"')<CR>
" decryption function
vnoremap <leader>nd c<C-R>=system('gpg -d -o- <<< "' . getreg('"') . '"')<CR>

augroup MyNotes
    autocmd FileType dirvish call notes#notes#list_filter()
    autocmd BufWritePost ~/Files/Notes/*.md execute ':silent ! git add ' . expand('%:t') . ' ; git commit -m "Auto-commit: saved "' . expand('%:t')
augroup end
