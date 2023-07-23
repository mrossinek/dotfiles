require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.integrations.telescope"] = {},
        ["core.highlights"] = {
            config = {
                highlights = {
                    headings = {
                        ["1"] = {
                            title = "+TSTitle",
                            prefix = "+TSTitle",
                        },
                    },
                    quotes = {
                        ["1"] = {
                            prefix = "+Grey",
                            content = "+Grey",
                        },
                    },
                },
            },
        },
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    local leader = keybinds.leader

                    -- hop-link
                    keybinds.remap_key("norg", "n", "<CR>", "<CR><CR>")

                    -- manoeuvre
                    keybinds.remap_key("norg", "n", "<M-k>", "<C-M-k>")
                    keybinds.remap_key("norg", "n", "<M-j>", "<C-M-j>")

                    -- new note
                    keybinds.remap_key("norg", "n", leader .. "nn", "ZZ")

                    -- presenter mode
                    keybinds.remap_key("presenter", "n", "l", "<M-l>")
                    keybinds.remap_key("presenter", "n", "h", "<M-h>")
                    keybinds.unmap("presenter", "n", "q")
                end,
            }
        },
        ["core.concealer"] = {
            config = {
                icon_preset = "diamond",
                markup_preset = "dimmed",
                dim_code_blocks = {
                    enabled = false,
                },
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    org = "~/Org",
                },
                autodetect = true,
                autochdir = true,
            },
        },
        ["core.esupports.metagen"] = {
            config = {
                type = "<leader>om",
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            }
        },
        ["core.qol.toc"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {
            config = {
                extensions = "all",
            },
        },
    },
}
