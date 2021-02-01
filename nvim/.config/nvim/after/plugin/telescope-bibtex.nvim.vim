lua << EOF
require('telescope').load_extension('bibtex')
EOF

nnoremap <silent> <CR>bt <cmd>lua require'telescope'.extensions.bibtex.bibtex()<CR>
