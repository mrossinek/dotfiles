-- additional function keys
vim.keymap.set("", "<F13>", "<S-CR>", { remap = true })
vim.keymap.set("", "<F14>", "<C-CR>", { remap = true })

-- vim sanity
vim.keymap.set("n", "Y", "y$", {})

-- folding
vim.keymap.set("n", "\\\\", "za", {})

-- visual block mode is more useful than plain visual mode
vim.keymap.set("n", "v", "<C-v>", {})
vim.keymap.set("n", "<C-v>", "v", {})

-- prefer virtual replace mode of replace mode
vim.keymap.set("n", "gR", "R", {})
vim.keymap.set("n", "R", "gR", {})

-- improve jumplist mutations
vim.keymap.set("n", "k", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'", { expr = true })
vim.keymap.set("n", "j", "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'", { expr = true })

-- quickfix/location list toggles
vim.keymap.set("n", "<leader>l",
    ":call mrossinek#functions#ToggleList('Location List', 'l')<CR>",
    { silent = true }
)
vim.keymap.set("n", "<leader>q",
    ":call mrossinek#functions#ToggleList('Quickfix List', 'c')<CR>",
    { silent = true }
)

-- quickfix navigation
vim.keymap.set("n", "<C-J>", ":cnext<CR>", {})
vim.keymap.set("n", "<C-K>", ":cprevious<CR>", {})

-- buffer navigation
vim.keymap.set("n", "<C-N>", ":bnext<CR>", {})
vim.keymap.set("n", "<C-P>", ":bprevious<CR>", {})

-- window movement
vim.keymap.set("n", "<A-H>", "<C-w>H", {})
vim.keymap.set("n", "<A-J>", "<C-w>J", {})
vim.keymap.set("n", "<A-K>", "<C-w>K", {})
vim.keymap.set("n", "<A-L>", "<C-w>L", {})

-- simpler splitting
vim.keymap.set("i", "<A-->", ":new<cr>", {})
vim.keymap.set("i", "<A-|>", ":vnew<cr>", {})

-- zoom-win like functionality
vim.keymap.set("n", "<C-W>m", ":winc _ <bar> winc <bar> <cr>", {})
vim.keymap.set("n", "<C-W>a", ":winc =<cr>", {})

-- scrolling
vim.keymap.set("n", "<leader>sc", ":call mrossinek#functions#ToggleScrollingMode()", {})
vim.keymap.set("n", "<leader>scb", ":setlocal scb!", {})
vim.keymap.set("n", "<C-E>", "2<C-E>", {})
vim.keymap.set("n", "<C-Y>", "2<C-Y>", {})

-- spelling
vim.keymap.set("n", "<leader>sp", ":call mrossinek#functions#FixLastSpellingError()", {})
vim.keymap.set("n", "<leader>sl", ":setlocal spelllang=", {})

-- web search
vim.keymap.set("n", "gs",
    ":set opfunc=mrossinek#functions#WebSearch<CR>g@",
    { silent = true }
)
