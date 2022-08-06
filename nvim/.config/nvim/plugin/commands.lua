vim.api.nvim_create_user_command("MakeTags", "!ctags -R .", {})

vim.api.nvim_create_user_command("StopLSP",
    function()
        vim.lsp.stop_client(vim.lsp.get_active_clients())
    end,
    {}
)

vim.api.nvim_create_user_command("WhichHighlight",
    "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, 'name')'",
    {}
)
