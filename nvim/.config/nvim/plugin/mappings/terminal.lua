-- Esc key
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {})

-- buffer navigation
vim.keymap.set("t", "<C-S>", "<C-\\><C-n>:e #<CR>", {})
vim.keymap.set("t", "<C-N>", "<C-\\><C-n>:bnext<CR>", {})
vim.keymap.set("t", "<C-P>", "<C-\\><C-n>:bprevious<CR>", {})

-- window movement
vim.keymap.set("t", "<A-H>", "<C-\\><C-n><C-w>H", {})
vim.keymap.set("t", "<A-J>", "<C-\\><C-n><C-w>J", {})
vim.keymap.set("t", "<A-K>", "<C-\\><C-n><C-w>K", {})
vim.keymap.set("t", "<A-L>", "<C-\\><C-n><C-w>L", {})

-- output naviation as done in tmux
vim.keymap.set("t", "<C-K>", "<C-\\><C-n>?% <CR>", {})
vim.keymap.set("t", "<C-J>", "<C-\\><C-n>/% <CR>", {})

-- pasting
vim.keymap.set("t", "<A-r>", "'<C-\\><C-n>\"'.nr2char(getchar()).'pi'", { expr = true })
vim.keymap.set("t", "<A-R>", "<C-\\><C-n>0pi", {})
