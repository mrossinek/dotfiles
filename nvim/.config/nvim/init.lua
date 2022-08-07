require("impatient")

vim.cmd.colorscheme("mrossinek")

vim.keymap.set("n", "<space>", "<Nop>")
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = "\\"

vim.g["python3_host_prog"] = "~/Installations/pynvim/venv/bin/python"

if vim.api.nvim_eval("exists('$EXTRA_VIM')") == 1 then
    for path in vim.split(os.getenv("$EXTRA_VIM"), ":") do
        vim.cmd("exec 'source '"..path)
    end
end
