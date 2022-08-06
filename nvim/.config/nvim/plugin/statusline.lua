local statusline_highlighting = vim.api.nvim_create_augroup("StatelineHighlighting", { clear = true })

vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
    group = statusline_highlighting,
    command = "call mrossinek#statusline#StatuslineInitHighlighting()"
})

vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI", "BufEnter", "BufWritePost"}, {
    group = statusline_highlighting,
    command = "call mrossinek#statusline#StatuslineUpdateHighlighting()",
})

vim.opt.statusline = ""
vim.opt.statusline:append("%1*")
vim.opt.statusline:append(" %{mrossinek#statusline#StatuslineMode()}")
vim.opt.statusline:append(" %2*")
vim.opt.statusline:append("%<")
vim.opt.statusline:append(" %{mrossinek#statusline#StatuslineGitInfo()}")
vim.opt.statusline:append(" %a")
vim.opt.statusline:append(" %m")
vim.opt.statusline:append(" %r")
vim.opt.statusline:append("%=")
vim.opt.statusline:append(" %3*")
vim.opt.statusline:append("%4.4p%%")
vim.opt.statusline:append("%{mrossinek#statusline#StatuslineIndicatePos()}")
vim.opt.statusline:append(" %4*")
vim.opt.statusline:append("%{mrossinek#statusline#StatuslineLSPInfo()}")
vim.opt.statusline:append("%*")
