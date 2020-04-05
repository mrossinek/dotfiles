setlocal spell
setlocal conceallevel=2

" Preview mapping
nnoremap <leader>p :silent !wiki2html_pandoc 1 markdown md /tmp/ % "" - - - &
            \ xdg-open /tmp/%:r.html<CR>
