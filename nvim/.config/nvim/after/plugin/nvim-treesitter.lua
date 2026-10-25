-- install_dir is configured in init.lua
local languages = {
    "bash",
    "c",
    "cpp",
    "css",
    "fortran",
    "go",
    "html",
    "java",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "yaml",
    "vimdoc",
}
require'nvim-treesitter'.install(languages)

-- The norg parsers are not in nvim-treesitter's registry and tree-sitter-norg
-- has a C++ scanner which `tree-sitter build` cannot compile, so build them
-- here. Neorg ships the matching queries itself.
local norg_parsers = {
    norg = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg',
        revision = '6348056b999f06c2c7f43bb0a5aa7cfde5302712',
     },
    norg_meta = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
        revision = 'a479d1ca05848d0b51dd25bc9f71a17e0108b240',
     },
}

local function build_norg_parsers(force)
    local parser_dir = vim.fn.stdpath('config') .. '/site/parser'
    vim.fn.mkdir(parser_dir, 'p')
    for lang, info in pairs(norg_parsers) do
        local target = parser_dir .. '/' .. lang .. '.so'
        if force or not vim.uv.fs_stat(target) then
            local tmp = vim.fn.tempname()
            local function run(cmd)
                local r = vim.system(cmd, { cwd = tmp }):wait()
                if r.code ~= 0 then
                    error(('%s: %s'):format(table.concat(cmd, ' '), r.stderr))
                end
            end
            local ok, err = pcall(function()
                vim.fn.mkdir(tmp, 'p')
                run({ 'git', 'init', '-q' })
                run({ 'git', 'fetch', '-q', '--depth', '1', info.url, info.revision })
                run({ 'git', 'checkout', '-q', 'FETCH_HEAD' })
                local objects = {}
                for _, src in ipairs({ 'parser.c', 'scanner.c', 'scanner.cc' }) do
                    if vim.uv.fs_stat(tmp .. '/src/' .. src) then
                        local compiler = src:match('%.cc$') and 'c++' or 'cc'
                        run({ compiler, '-c', '-fPIC', '-O2', '-Isrc', 'src/' .. src, '-o', src .. '.o' })
                        table.insert(objects, src .. '.o')
                    end
                end
                run(vim.list_extend({ 'c++', '-shared', '-o', target }, objects))
            end)
            vim.fn.delete(tmp, 'rf')
            if ok then
                vim.notify('Built ' .. lang .. ' parser')
            else
                vim.notify('Failed to build ' .. lang .. ' parser: ' .. err, vim.log.levels.ERROR)
            end
        end
    end
end

vim.api.nvim_create_user_command('NorgBuildParsers', function(args)
    build_norg_parsers(args.bang)
end, { bang = true, desc = 'Build the norg treesitter parsers (! to rebuild)' })
build_norg_parsers(false)

vim.treesitter.language.register('markdown', 'octo')

-- neorg-telescope's search_headings still calls these master-branch helpers;
-- the parsers registry gets reloaded on install/update, hence the autocmd
-- (via a metatable so that it is not mistaken for a language)
local function add_parsers_compat()
    setmetatable(require'nvim-treesitter.parsers', { __index = {
        ft_to_lang = vim.treesitter.language.get_lang,
    } })
end
add_parsers_compat()
vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate', callback = add_parsers_compat })
package.loaded['nvim-treesitter.configs'] = {
    is_enabled = function(module, _, bufnr)
        return module == 'highlight' and vim.treesitter.highlighter.active[bufnr] ~= nil
    end,
}

local no_indent = { markdown = true }
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('nvim-treesitter', { clear = true }),
    callback = function(args)
        if not pcall(vim.treesitter.start, args.buf) then
            return
        end
        if not no_indent[vim.bo[args.buf].filetype] then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- incremental selection
vim.keymap.set("n", "gni", function() vim.treesitter.select('parent') end)
vim.keymap.set("x", "gnn", function() vim.treesitter.select('parent', vim.v.count1) end)
vim.keymap.set("x", "gns", function() vim.treesitter.select('next', vim.v.count1) end)
vim.keymap.set("x", "gnd", function() vim.treesitter.select('child', vim.v.count1) end)

-- You can use the capture groups defined in textobjects.scm
require'nvim-treesitter-textobjects'.setup{}
local function textobject(lhs, capture)
    vim.keymap.set({ "x", "o" }, lhs, function()
        require'nvim-treesitter-textobjects.select'.select_textobject(capture, "textobjects")
    end)
end
textobject("af", "@function.outer")
textobject("if", "@function.inner")
textobject("ac", "@class.outer")
textobject("ic", "@class.inner")

require'treesitter-context'.setup{
    max_lines = 5,
    separator = '─',
    patterns = {
        norg = {
            'heading1',
            'heading2',
            'heading3',
            'heading4',
            'heading5',
            'heading6',
        },
    },
}
