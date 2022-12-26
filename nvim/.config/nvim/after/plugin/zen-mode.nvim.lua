require("zen-mode").setup {
    window = {
        options = {
            foldcolumn = "0",
            number = false,
            relativenumber = false,
            scrolloff = 999,
            signcolumn = "no",
        },
    },
    plugins = {
        tmux = {
            enabled = true,
        },
        wezterm = {
            enabled = true,
        },
    },
}
