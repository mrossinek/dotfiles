require('lspkind').init({})

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local neogen = require('neogen')

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

    sources = {
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'neorg' },
        { name = 'luasnip', keyword_length = 2},
        { name = 'calc' },
        { name = 'emoji' },
    },

    experimental = {
        ghost_text = true,
        native_menu = false,
    },

    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<Tab>'] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif neogen.jumpable() then
                vim.fn.feedkeys(replace_termcodes("<cmd>lua require('neogen').jump_next()<CR>"), "")
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-expand-or-jump"), "")
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
            elseif neogen.jumpable(-1) then
                vim.fn.feedkeys(replace_termcodes("<cmd>lua require('neogen').jump_prev()<CR>"), "")
            elseif luasnip.jumpable() then
                vim.fn.feedkeys(replace_termcodes("<Plug>luasnip-jump-prev"), "")
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
            require('luasnip').lsp_expand(args.body)
        end
    },
}
