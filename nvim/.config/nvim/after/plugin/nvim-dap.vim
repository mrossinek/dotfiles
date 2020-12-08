lua << EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  -- TODO figure out how to remove hard-coded python version
  command = os.getenv('HOME') .. '/Installations/pynvim3/.direnv/python-3.9.0/bin/python';
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
