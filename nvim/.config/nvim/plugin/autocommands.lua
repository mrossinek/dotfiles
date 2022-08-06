local flash_yanked = vim.api.nvim_create_augroup("FlashYanked", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = flash_yanked,
    callback = function() require'vim.highlight'.on_yank({
        higroup="ExtraWhitespace",
        timeout=200,
    }) end,
})

local restore_cursor = vim.api.nvim_create_augroup("RestoreCursor", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
    group = restore_cursor,
    command = [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
})
