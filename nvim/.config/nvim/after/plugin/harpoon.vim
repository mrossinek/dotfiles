lua << EOF
require('harpoon').setup()
EOF

nnoremap <silent> <leader>mm <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <leader>mt <cmd>lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent> <leader>mr <cmd>lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent> <leader>ma <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <leader>m1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <leader>m2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <leader>m3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <leader>m4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent> <leader>m5 <cmd>lua require("harpoon.ui").nav_file(5)<CR>
