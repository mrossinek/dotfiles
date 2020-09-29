lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "java",
        "json",
        "lua",
        "markdown",
        "python",
        "yaml",
    },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gni",
            node_incremental = "gnn",
            scope_incremental = "gns",
            node_decremental = "gnd",
        },
    },
    refactor = {
        highlight_definitions = { enable = true },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition_lsp_fallback = "<c-]>",
                list_definitions = "gnD",
                goto_next_usage = "<C-*>",
                goto_previous_usage = "<C-#>",
            },
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grn",
            },
        },
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}
EOF