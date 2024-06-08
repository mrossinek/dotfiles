require('lspkind').init({})

local cmp = require('cmp')
local lspkind = require('lspkind')

local replace_termcodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

cmp.setup {
    completion = {
        keyword_length = 1,
    },

    enabled = function ()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end,

    sources = {
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'neorg' },
        { name = 'emoji' },
        { name = 'dap' },
    },

    experimental = {
        ghost_text = true,
    },

    view = {
        entries = 'custom',
    },

    mapping = {
        ['<C-p>'] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<C-n>'] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif check_back_space() then
                vim.fn.feedkeys(replace_termcodes('<Tab>'), 'n')
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<S-Tab>'] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"}),
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
        end
    },

    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
}
