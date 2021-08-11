vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local actions = require'lir.actions'

require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['<CR>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['-']     = actions.up,
    ['q']     = actions.quit,

    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
  },
  float = {
    winblend = 0,
  },
  hide_cursor = false,
}

vim.api.nvim_set_keymap(
    'n',
    '-',
    [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]],
    { noremap = true }
)

require'lir.git_status'.setup({
  show_ignored = false,
})
