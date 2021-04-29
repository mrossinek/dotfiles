lua << EOF
require('harpoon').setup()
EOF

nnoremap <silent> <leader>m <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
