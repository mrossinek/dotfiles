local statusline_highlighting = vim.api.nvim_create_augroup("StatelineHighlighting", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
	group = statusline_highlighting,
	command = "call mrossinek#statusline#StatuslineInitHighlighting()",
})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "BufWritePost" }, {
	group = statusline_highlighting,
	command = "call mrossinek#statusline#StatuslineUpdateHighlighting()",
})

vim.opt.statusline = "%1* %{mrossinek#statusline#StatuslineMode()} %2* %< %{mrossinek#statusline#StatuslineGitInfo()} %a %m %r %= %3* %4.4p%% %{mrossinek#statusline#StatuslineIndicatePos()} %4* %{mrossinek#statusline#StatuslineLSPInfo()} %*"

