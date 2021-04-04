lua << EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function(adapter)
        return '/usr/bin/python'
    end;
  },
}

-- show virtual text for current frame
vim.g.dap_virtual_text = true
EOF
