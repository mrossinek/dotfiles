lua << EOF
require("git-worktree").setup({
    change_directory_command = "tcd",
    update_on_change_command = ":Telescope git_files",
})

require("telescope").load_extension("git_worktree")
EOF

nnoremap <silent> <CR>wt <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
