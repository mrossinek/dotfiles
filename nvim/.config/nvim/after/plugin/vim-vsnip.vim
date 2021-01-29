let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')

" Expand
imap <expr> <C-j> vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'

" Expand or jump
imap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
