-- visual @
vim.keymap.set("v", "@", ":<C-u>call mrossinek#functions#ExecuteMacroOverVisualRange()<CR>", {})

-- visual block mode is more useful than plain visual mode
vim.keymap.set("v", "v", "<C-v>", {})
vim.keymap.set("v", "<C-v>", "v", {})

-- move lines
-- Source: https://vimtricks.substack.com/p/vimtrick-moving-lines
vim.keymap.set("v", "<c-j>", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "<c-k>", ":m '<-2<CR>gv=gv", {})

-- web search
vim.keymap.set("v", "gs",
    ":call mrossinek#functions#WebSearch(visualmode(), 1)<CR>",
    { silent = true }
)
