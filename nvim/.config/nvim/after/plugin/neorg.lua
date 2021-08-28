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
                },
            },
        },
        ["core.keybinds"] = {},
        ["core.norg.concealer"] = {
            config = {
                icons = {
                    heading = {
                        level_1 = {
                            icon = "◉",
                        },
                        level_2 = {
                            icon = "◎",
                        },
                        level_3 = {
                            icon = "○",
                        },
                        level_4 = {
                            icon = "✺",
                        },
                    },
                    quote = {
                        icon = "│",
                    },
                },
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
        ["core.norg.esupports"] = {},
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

        { "<CR><CR>", "core.norg.esupports.goto_link" },

        { "<C-s>", "core.integrations.telescope.find_linkable" },

        },
    i = {

        -- Telescope integration
        { "<C-l>", "core.integrations.telescope.insert_link" },
        },

    }, { silent = true, noremap = true })

end)
