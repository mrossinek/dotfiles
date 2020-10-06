local M = {}

--[[
Usage:
mappings.apply_keymap(42, <function>, {
  n = {
    ["<leader>x"] = "just do this string",
    ["<CR>"] = function(picker, prompt_bufnr)
      actions.close_prompt()
>     local filename = ...
      vim.cmd(string.format(":e %s", filename))
    end,
  },
  i = {
  }
})
--]]
function M.link_note()
    require('telescope.builtin').find_files {
        shorten_path = false,
        cwd = vim.g.zettelkasten,
        prompt = "Zettelkasten",
        height = 10,

        layout_strategy = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },

        attach_mappings = function(prompt_bufnr, map)
            local get_selection = function()
                local selection = require('telescope.actions').get_selected_entry(prompt_bufnr)
                require('telescope.actions').close(prompt_bufnr)
                -- append selected file name in buffer
                vim.cmd("normal a" .. selection.value)
            end

            map('n', '<CR>', get_selection)
            map('i', '<CR>', get_selection)

            return true
        end
    }
end

return setmetatable({}, {
  __index = function(_, k)
    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})
