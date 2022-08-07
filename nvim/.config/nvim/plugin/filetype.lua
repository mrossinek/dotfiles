local filetype_ledger = vim.api.nvim_create_augroup("filetype_ledger", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_ledger,
    pattern = "ledger",
    command = "doautocmd User MyLedger",
})
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_ledger,
    pattern = "ledger",
    command = "packadd vim-ledger",
})

local filetype_mail = vim.api.nvim_create_augroup("filetype_mail", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_mail,
    pattern = "mail",
    command = "packadd coveragepy.vim",
})

local filetype_python = vim.api.nvim_create_augroup("filetype_python", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_python,
    pattern = "python",
    callback = function() vim.keymap.set("n", "<leader>m", ":setlocal filetype=markdown.mail<CR>", { silent = true }) end
})

local filetype_tex = vim.api.nvim_create_augroup("filetype_tex", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_tex,
    pattern = "tex",
    command = "packadd quicktex",
})
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_tex,
    pattern = "tex",
    command = "packadd vimtex",
})

local filetype_writing = vim.api.nvim_create_augroup("filetype_writing", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_writing,
    pattern = "text,markdown",
    command = "packadd vim-verdict",
})
