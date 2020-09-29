nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files( { find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } } )<CR>
nnoremap <silent> <leader>gg <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <leader>gr <cmd>lua require('telescope.builtin').live_grep( { shorten_path = true } )<CR>
nnoremap <silent> <leader>cc <cmd>lua require'telescope.builtin'.command_history()<CR>
nnoremap <silent> <leader>tr <cmd>lua require('telescope.builtin').treesitter()<CR>
nnoremap <silent> <leader>rr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <silent> <leader>ds <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap <silent> <leader>ws <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>

hi link TelescopeSelection CursorLine
hi TelescopeMatching guifg=Cyan ctermfg=Cyan
