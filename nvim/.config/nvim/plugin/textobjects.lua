-- Line object
vim.keymap.set("v", "al", ":<C-U>silent! normal! 0v$h<CR>", {})
vim.keymap.set("o", "al", ":normal Val<CR>", {})
vim.keymap.set("v", "il", ":<C-U>silent! normal! ^v$h<CR>", {})
vim.keymap.set("o", "il", ":normal Vil<CR>", {})
vim.keymap.set("v", "aL", ":<C-U>silent! normal! 0v$<CR>", {})
vim.keymap.set("o", "aL", ":normal Val<CR>", {})
vim.keymap.set("v", "iL", ":<C-U>silent! normal! ^v$<CR>", {})
vim.keymap.set("o", "iL", ":normal Vil<CR>", {})

-- | object
vim.keymap.set("v", "a|", ":<C-U>silent! normal! F|vf|<CR>", {})
vim.keymap.set("o", "a|", ":normal va|<CR>", {})
vim.keymap.set("v", "i|", ":<C-U>silent! normal! T|vt|<CR>", {})
vim.keymap.set("o", "i|", ":normal vi|<CR>", {})

-- & object
vim.keymap.set("v", "a&", ":<C-U>silent! normal! F&vf&<CR>", {})
vim.keymap.set("o", "a&", ":normal va&<CR>", {})
vim.keymap.set("v", "i&", ":<C-U>silent! normal! T&vt&<CR>", {})
vim.keymap.set("o", "i&", ":normal vi&<CR>", {})

-- = object
vim.keymap.set("v", "a=", ":<C-U>silent! normal! F=vf=<CR>", {})
vim.keymap.set("o", "a=", ":normal va=<CR>", {})
vim.keymap.set("v", "i=", ":<C-U>silent! normal! T=vt=<CR>", {})
vim.keymap.set("o", "i=", ":normal vi=<CR>", {})

-- : object
vim.keymap.set("v", "a:", ":<C-U>silent! normal! F:vf:<CR>", {})
vim.keymap.set("o", "a:", ":normal va:<CR>", {})
vim.keymap.set("v", "i:", ":<C-U>silent! normal! T:vt:<CR>", {})
vim.keymap.set("o", "i:", ":normal vi:<CR>", {})
