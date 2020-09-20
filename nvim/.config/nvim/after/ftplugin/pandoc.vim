" Preview mapping
nnoremap <leader>p :silent !pandoc -s --mathjax -f markdown -t html5 -o /tmp/%:t:r.html < %
            \ && xdg-open /tmp/%:t:r.html<CR>

