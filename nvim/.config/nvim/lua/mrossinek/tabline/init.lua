local tabIcon = function(bufnr)
    local dev
    local file = vim.fn.bufname(bufnr)
    local buftype = vim.fn.getbufvar(bufnr, '&buftype')
    local filetype = vim.fn.getbufvar(bufnr, '&filetype')
    if filetype == "" then
        return ""
    elseif filetype:sub(1, 9) == 'Telescope' then
        dev, _ = require'nvim-web-devicons'.get_icon('telescope')
    elseif buftype == 'terminal' then
        dev, _ = require'nvim-web-devicons'.get_icon('zsh')
    else
        dev, _ = require'nvim-web-devicons'.get_icon(file, vim.fn.getbufvar(bufnr, '&filetype'))
    end
    if dev then
        return dev .. " "
    else
        return ""
    end
end

local tabLine = function()
    local line = " "
    local current_buf = vim.fn.bufnr()
    local current_tab = vim.fn.tabpagenr()
    local buflist = vim.fn.tabpagebuflist()
    for i, buf in pairs(buflist) do
        if vim.fn.buflisted(buf) == 1 then
            if buf == current_buf then
                line = line .. "%#TabLineSel#"
            else
                line = line .. "%#TabLine#"
            end
            line = line .. tabIcon(buf)
            local bufname = vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.bufname(buf), ":~:."))
            line = line .. (bufname or "[Empty]")
            line = line .. "%#TabLine#"
            if i ~= #buflist then
                line = line .. " | "
            end
        end
    end
    line = line .. "%#TabLineFill#%="
    for tab = 1, vim.fn.tabpagenr("$") do
        if tab == current_tab then
            line = line .. "%#TabLineSel#"
        else
            line = line .. "%#TabLine#"
        end
        line = line .. vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.getcwd(-1, tab), ":~:.")) .. " "
    end
    return line
end

local M = {
    tabLine = tabLine,
}

return M
