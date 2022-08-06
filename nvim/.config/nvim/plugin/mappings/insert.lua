-- window movement
vim.keymap.set("i", "<A-H>", "<C-\\><C-n><C-w>H", {})
vim.keymap.set("i", "<A-J>", "<C-\\><C-n><C-w>J", {})
vim.keymap.set("i", "<A-K>", "<C-\\><C-n><C-w>K", {})
vim.keymap.set("i", "<A-L>", "<C-\\><C-n><C-w>L", {})

-- simpler splitting
vim.keymap.set("i", "<A-->", "<C-\\><C-n>:new<cr>:startinsert<cr>", {})
vim.keymap.set("i", "<A-|>", "<C-\\><C-n>:vnew<cr>:startinsert<cr>", {})

-- undo break points
vim.keymap.set("i", ".", ".<C-G>u", {})
vim.keymap.set("i", ",", ",<C-G>u", {})
vim.keymap.set("i", "!", "!<C-G>u", {})
vim.keymap.set("i", "?", "?<C-G>u", {})

-- delete sentence backwards
vim.keymap.set("i", "<C-s>", "<C-o>d(", {})
