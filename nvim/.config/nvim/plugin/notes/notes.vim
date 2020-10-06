command! Note call notes#notes#index()
command! -nargs=1 NoteNew call notes#notes#new_note(<f-args>)

let g:zettelkasten = '~/Files/Notes'

" mnemonic: Zettelkasten
" Note: I don't like the normal ZZ mapping (:wq)
map ZZ <Plug>Note
nnoremap <unique> <script> <silent> <Plug>Note :Note<CR>

nnoremap <leader>nn :NoteNew 

" encryption function
vnoremap ;ne c<C-R>=system('gpg -ac -o- <<< "' . getreg('"') . '"')<CR>
" decryption function
vnoremap ;nd c<C-R>=system('gpg -d -o- <<< "' . getreg('"') . '"')<CR>

" telescope integration
nnoremap ;nl :lua require('notes.telescope')['link_note']()<CR>
inoremap ;nl :lua require('notes.telescope')['link_note']()<CR>

augroup MyNotes
    autocmd FileType dirvish call notes#notes#list_filter()
    autocmd BufWritePost ~/Files/Notes/*.md call notes#notes#git_save()
augroup end
