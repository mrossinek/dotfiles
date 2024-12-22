lua << EOF
local lsp_status = require('lsp-status')
lsp_status.config {
    status_symbol = '  ',
    indicator_hint = '',
    indicator_info = '',
}
lsp_status.register_progress()

vim.diagnostic.config({
    virtual_text = {
        source = "always",
    },
})

-- blink.cmp capabilities
local capabilities = require('blink.cmp').get_lsp_capabilities()

local nvim_command = vim.api.nvim_command
local on_attach_vim = function(client)
  lsp_status.on_attach(client)
end

local lspconfig = require('lspconfig')

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = "single"
    }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)

local on_references = vim.lsp.handlers["textDocument/references"]
vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
    on_references, {
        loclist = true,
    }
)

local function preview_location_callback(_, _, result)
    if result == nil or vim.tbl_isempty(result) then
        return nil
    end
    vim.lsp.util.preview_location(result[1], {border = "single"})
end

function preview_definition()
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua preview_definition()<CR>", {noremap = true})

lspconfig.clangd.setup{
    handlers = lsp_status.extensions.clangd.setup(),
    on_attach=on_attach_vim,
    capabilities=capabilities
}

lspconfig.fortls.setup{
    -- fortls currently is unable to handle settings and instead relies on them being passed via cmdline arguments:
    -- https://github.com/neovim/nvim-lspconfig/issues/219#issuecomment-623955655
    cmd = {
        "fortls",
        "--nthreads", "2",
        "--symbol_skip_mem",
        "--autocomplete_no_prefix",
        "--incremental_sync",
        "--use_signature_help",
        "--variable_hover",
        "--hover_signature",
        "--enable_code_actions"
    },
    root_dir = lspconfig.util.root_pattern('.git', '.fortls'),
    on_attach=on_attach_vim,
    capabilities=capabilities
}

lspconfig.pyright.setup{
    settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
            },
        },
    },
    on_attach=function(client)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        on_attach_vim(client)
    end,
    capabilities=capabilities
}

lspconfig.ruff.setup{
    on_attach=on_attach_vim,
    capabilities=capabilities,
}

lspconfig.rust_analyzer.setup{
    on_attach=on_attach_vim,
    capabilities=capabilities,
}

lspconfig.lua_ls.setup{
    on_attach=on_attach_vim,
    capabilities=capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig.texlab.setup{
    on_attach=on_attach_vim,
    capabilities=capabilities
}

lspconfig.vimls.setup{
    on_attach=on_attach_vim,
    capabilities=capabilities
}

lspconfig.gopls.setup{
    on_attach=on_attach_vim,
    capabilities=capabilities
}

lspconfig.efm.setup{
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "stylua --color Never ${--range-start:charStart} ${--range-end:charEnd} -",
                    formatStdin = true,
                    formatCanRange = true,
                },
            },
            python = {
                -- {
                --     formatCommand = "black --no-color --quiet -",
                --     formatStdin = true,
                -- },
                -- {
                --     formatCommand = "isort --quiet -",
                --     formatStdin = true,
                -- },
                {
                    lintCommand = "mypy --show-column-numbers",
                    lintStdin = false,
                    lintFormats = {
                        '%f:%l:%c: %trror: %m',
                        '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m',
                    },
                },
                -- {
                --     lintCommand = "pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}",
                --     lintStdin = false,
                --     lintFormats = { '%.%#:%l:%c: %t%.%#: %m' },
                -- },
            },
        },
        lintDebounce = "1s",
        formatDebounce = "1s",
    },
    filetypes = {"lua", "python"},
    on_attach=on_attach_vim,
}

EOF

" LSP
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-l> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.format({async = True})<CR>

" code actions
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua vim.lsp.buf.range_code_action()<CR>


" lsp-diagnostics
sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarning text= texthl=DiagnosticSignWarning
sign define DiagnosticSignInformation text= texthl=DiagnosticSignInformation
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint

nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>dd <cmd>call mrossinek#functions#ToggleDiagnostics()<CR>

autocmd CursorHold * lua
            \ local ok, result = pcall(vim.api.nvim_buf_get_var, 0, 'show_diagnostics')
            \ if not ok or result then
            \     vim.diagnostic.open_float(nil, {scope = "cursor", focusable = false, border = "single"})
            \ end
