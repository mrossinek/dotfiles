require('lspkind').init({})

local cmp = require('cmp')
local lspkind = require('lspkind')
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
        { name = 'buffer' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'vsnip' },
        { name = 'emoji' },
        { name = 'neorg' },
    },

    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(replace_termcodes('<C-n>'), 'n')
            elseif neogen.jumpable() then
                vim.fn.feedkeys(replace_termcodes("<cmd>lua require('neogen').jump_next()<CR>"), "")
            elseif vim.fn['vsnip#available']() == 1 then
                vim.fn.feedkeys(replace_termcodes('<Plug>(vsnip-expand-or-jump)'), '')
            elseif check_back_space() then
                vim.fn.feedkeys(replace_termcodes('<Tab>'), 'n')
            else
                fallback()
            end
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            return vim_item
        end
    },

    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end
    },
}
