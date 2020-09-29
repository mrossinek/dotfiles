nnoremap <silent> <leader>gf <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <leader>gg <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <leader>gr <cmd>lua require('telescope.builtin').live_grep( { shorten_path = true } )<CR>
nnoremap <silent> <leader>gt <cmd>lua require('telescope.builtin').treesitter()<CR>
nnoremap <silent> <leader>g] <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <silent> <leader>gd <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <silent> <leader>gw <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>
