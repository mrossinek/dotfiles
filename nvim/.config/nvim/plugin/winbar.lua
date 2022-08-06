vim.opt.winbar = ""
vim.opt.winbar:append(" %2*")
vim.opt.winbar:append("%<")
vim.opt.winbar:append("%{pathshorten(expand('%'))}")
vim.opt.winbar:append("%=")
vim.opt.winbar:append(" %y")
vim.opt.winbar:append(" %3*")
vim.opt.winbar:append("%{&fileencoding?&fileencoding!=#'utf-8':''}")
vim.opt.winbar:append("%*")
