require("zen-mode").setup {
    window = {
        options = {
            foldcolumn = "0",
            signcolumn = "no",
        },
    },
    plugins = {
        tmux = {
            enabled = true,
        },
        kitty = {
            enabled = true,
        },
    },
}
