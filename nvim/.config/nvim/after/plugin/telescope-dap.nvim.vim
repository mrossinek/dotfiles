lua << EOF
require('telescope').load_extension('dap')
EOF

nnoremap <silent> <CR>dm <cmd>lua require'telescope'.extensions.dap.commands()<CR>
nnoremap <silent> <CR>dc <cmd>lua require'telescope'.extensions.dap.configurations()<CR>
nnoremap <silent> <CR>db <cmd>lua require'telescope'.extensions.dap.list_breakpoints()<CR>
nnoremap <silent> <CR>dv <cmd>lua require'telescope'.extensions.dap.variables()<CR>
