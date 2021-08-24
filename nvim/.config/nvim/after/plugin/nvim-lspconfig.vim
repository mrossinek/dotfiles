lua << EOF
local lsp_status = require('lsp-status')
lsp_status.config {
    status_symbol = '  ',
    indicator_hint = '',
    indicator_info = '',
}
lsp_status.register_progress()

-- nvim-cmp capab
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

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

-- overwrite the pylint executable to ensure it is run from the virtualenv
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pylint = {
                    enabled = true,
                    executable = 'pylint',
                },
                pycodestyle = {
                    enabled = false,
                },
                pydocstyle = {
                    enabled = true,
                },
                pyls_black = {
                    enabled = true,
                },
                pyls_isort = {
                    enabled = true,
                },
                pyls_mypy = {
                    enabled = true,
                    live_mode = false,
                },
            },
        },
    },
    on_attach=on_attach_vim,
    capabilities=capabilities
}

lspconfig.sumneko_lua.setup{
    cmd = {"/usr/bin/lua-language-server"};
    on_attach=on_attach_vim,
    capabilities=capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
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
EOF

" LSP
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-l> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

" code actions
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua vim.lsp.buf.range_code_action()<CR>
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
call sign_define("LightBulbSign", {"text": "💡", "texthl": "SignColumn", "linehl": "", "numhl": ""})


" lsp-diagnostics
sign define LspDiagnosticsSignError text=
sign define LspDiagnosticsSignWarning text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint text=

nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>dd <cmd>call mrossinek#functions#ToggleDiagnostics()<CR>

autocmd CursorHold * lua
            \ local ok, result = pcall(vim.api.nvim_buf_get_var, 0, 'show_diagnostics')
            \ if not ok or result then
            \     vim.lsp.diagnostic.show_line_diagnostics({focusable = false, border = "single"})
            \ end
