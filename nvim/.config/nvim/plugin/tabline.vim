lua << EOF
vim.o.tabline = [[%!luaeval('require("mrossinek.tabline").tabLine()')]]
EOF
set showtabline=2
