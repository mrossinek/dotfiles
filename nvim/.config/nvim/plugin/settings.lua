vim.opt.colorcolumn = "+0"
vim.opt.complete:append("kspell")
vim.opt.completeopt:remove("preview")
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.formatoptions:append("2nl")
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = "nbsp:⦸,tab:▷┅,extends:»,precedes:«,trail:•"
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.path:append("**")
vim.opt.pumblend = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.shiftwidth = 4
vim.opt.showbreak = "↪ "
vim.opt.showmatch = true
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes:2"
vim.opt.smartcase = true
vim.opt.spelllang = "en_us"
vim.opt.switchbuf = "useopen"
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.viewoptions:remove("curdir")
vim.opt.viewoptions:remove("options")
vim.opt.virtualedit = "block"
vim.opt.wrap = false
vim.opt.backupdir:append(".")
