local tabLine = function()
    local line = " "
    local current_tab = vim.fn.tabpagenr()
    for tab = 1, vim.fn.tabpagenr("$") do
        if tab == current_tab then
            line = line .. "%#TabLineSel#"
        else
            line = line .. "%#TabLine#"
        end
        line = line .. vim.fn.pathshorten(vim.fn.getcwd(-1, tab)) .. " "
    end
    return line
end

local M = {
    tabLine = tabLine,
}

return M
