lua << EOF
local dap = require('dap')
local dap_python = require('dap-python')
dap_python.setup()
dap_python.test_runner = 'pytest'

-- show virtual text for current frame
vim.g.dap_virtual_text = true
EOF
