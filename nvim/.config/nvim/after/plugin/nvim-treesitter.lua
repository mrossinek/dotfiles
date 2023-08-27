local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

if (os.getenv("NEORG_DEV") ~= nil) then
    parser_configs.norg = {
        install_info = {
            url = "~/Git/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
        },
    }

    parser_configs.norg_meta = {
        install_info = {
            url = "~/Git/tree-sitter-norg-meta",
            files = { "src/parser.c" },
        },
    }
else
    parser_configs.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main",
        },
    }

    parser_configs.norg_meta = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
            files = { "src/parser.c" },
            branch = "main",
        },
    }
end

parser_configs.markdown.filetype_to_parsername = "octo"

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "fortran",
        "go",
        "html",
        "java",
        "json",
        "markdown",
        "latex",
        "lua",
        "norg",
        "norg_meta",
        "python",
        "yaml",
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = { "markdown" },
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
require'treesitter-context'.setup{
    separator = '─',
    patterns = {
        norg = {
            'heading1',
            'heading2',
            'heading3',
            'heading4',
            'heading5',
            'heading6',
        },
    },
}
