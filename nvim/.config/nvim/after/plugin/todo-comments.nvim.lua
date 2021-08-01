require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- PERF:
    -- HACK:
    -- TODO:
    -- NOTE:
    -- FIX:
    -- WARN:
    keywords = {
        FIX = { icon = " ", color = "error"},
        HACK = { color = "info" },
        NOTE = { color = "hint" },
        PERF = { color = "default" },
        TODO = { color = "todo" },
        WARN = { color = "warning" },
    },
    highlight = {
        keyword = "bg",
        max_line_len = 200,
    },
    colors = {
        default = { "Keyword" },
        error = { "LspDiagnosticsError" },
        hint = { "LspDiagnosticsHint" },
        info = { "LspDiagnosticsInformation" },
        todo = { "Todo" },
        warning = { "LspDiagnosticsWarning" },
    },
}
