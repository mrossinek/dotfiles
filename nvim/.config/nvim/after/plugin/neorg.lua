require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.highlights"] = {},
        ["core.integrations.telescope"] = {},
        ["core.integrations.treesitter"] = {
            config = {
                highlights = {
                    Heading = {
                        ["1"] = {
                            Title = "+TSTitle",
                            Prefix = "+TSTitle",
                        },
                    },
                    Quote = {
                        ["1"] = {
                            [""] = "+Grey",
                            Content = "+Grey",
                        },
                    },
                },
            },
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
                neorg_leader = "<leader>o",
            }
        },
        ["core.norg.concealer"] = {
            config = {
                icon_preset = "diamond",
                dim_code_blocks = false,
            },
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    org = "~/Org",
                },
                autodetect = true,
                autochdir = true,
            },
        },
        ["core.norg.esupports.metagen"] = {
            config = {
                type = "<leader>om",
            },
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "org",
            }
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            }
        },
        -- ["core.norg.qol.toc"] = {},
    },
}

local neorg_callbacks = require('neorg.callbacks')

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

keybinds.map_event_to_mode("norg", {
    n = {

        -- TODOs
        { "gtd", "core.norg.qol.todo_items.todo.task_done" },
        { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
        { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
        { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },

        -- Links
        { "ZZ", "core.norg.dirman.new.note" },

        { "<CR><CR>", "core.norg.esupports.hop.hop-link" },

        { "<C-s>", "core.integrations.telescope.find_linkable" },

        { "<C-M-k>", "core.norg.manoeuvre.item_up" },
        { "<C-M-j>", "core.norg.manoeuvre.item_down" },

        },
    i = {

        -- Telescope integration
        { "<C-l>", "core.integrations.telescope.insert_link" },
        },

    }, { silent = true, noremap = true })

-- Map the below keys on presenter mode
keybinds.map_event_to_mode("presenter", {
    n = {
        { "<M-l>", "core.presenter.next_page" },
        { "<M-h>", "core.presenter.previous_page" },
        { "<Esc>", "core.presenter.close" },
    },
}, {
    silent = true,
    noremap = true,
    nowait = true,
})

end)
