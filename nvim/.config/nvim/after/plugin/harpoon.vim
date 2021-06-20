lua << EOF
require('harpoon').setup()
EOF

nnoremap <silent> <leader>mm <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>mt <cmd>lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent> <leader>mr <cmd>lua require("harpoon.term").gotoTerminal(2)<CR>
