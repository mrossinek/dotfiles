lua << EOF
require("git-worktree").setup()

require("telescope").load_extension("git_worktree")
EOF

nnoremap <silent> <CR>wt <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
