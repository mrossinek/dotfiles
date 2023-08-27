require('Navigator').setup()

vim.keymap.set({'n', 't', 'i', 'v'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't', 'i', 'v'}, '<A-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't', 'i', 'v'}, '<A-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't', 'i', 'v'}, '<A-j>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't', 'i', 'v'}, '<A-\\>', '<CMD>NavigatorPrevious<CR>')
