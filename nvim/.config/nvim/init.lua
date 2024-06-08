require("impatient")

vim.loader.enable()

vim.cmd.colorscheme("mrossinek")

vim.keymap.set("n", "<space>", "<Nop>")
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = "\\"

-- providers
vim.g["python3_host_prog"] = "~/Installations/pynvim/venv/bin/python"
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

if vim.api.nvim_eval("exists('$EXTRA_VIM')") == 1 then
    for _, path in pairs(vim.split(os.getenv("EXTRA_VIM"), ":")) do
        vim.cmd("source "..path)
    end
end
