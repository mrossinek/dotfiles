lua << EOF
require("git-worktree").setup({
    change_directory_command = "tcd",
    update_on_change_command = ":Telescope git_files",
})
EOF
