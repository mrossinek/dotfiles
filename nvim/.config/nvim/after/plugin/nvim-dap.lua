local dap = require('dap')
local dapui = require('dapui')
dapui.setup()

local dap_python = require('dap-python')
dap_python.setup('/usr/bin/python')
dap_python.test_runner = 'pytest'

-- show virtual text for current frame
vim.g.dap_virtual_text = true

-- automatically open dap UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- keymaps
vim.keymap.set("n", "<leader>d<Space>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>dO", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

vim.keymap.set("n", "<leader>dm", ":lua require'dap-python'.test_method()<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dap-python'.test_class()<CR>")
vim.keymap.set("n", "<leader>ds", ":lua require'dap-python'.debug_selection()<CR>")
