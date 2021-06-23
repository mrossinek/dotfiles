lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
}


local lsp_status = require('lsp-status')
lsp_status.config {
    status_symbol = '  ',
    indicator_hint = '',
    indicator_info = '',
}
lsp_status.register_progress()
lsp_status.capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_command = vim.api.nvim_command
local on_attach_vim = function(client)
  lsp_status.on_attach(client)
end

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{
    handlers = lsp_status.extensions.clangd.setup(),
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities
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
    capabilities=lsp_status.capabilities
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
    capabilities=lsp_status.capabilities
}

lspconfig.sumneko_lua.setup{
    cmd = {"/usr/bin/lua-language-server"};
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities,
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
    capabilities=lsp_status.capabilities
}

lspconfig.vimls.setup{
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities
}
EOF

" lsp-diagnostics
sign define LspDiagnosticsSignError text=
sign define LspDiagnosticsSignWarning text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint text=

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd    <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> K     <cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>
nnoremap <silent> <c-l> <cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>
nnoremap <silent> gh    <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gr    <cmd>lua require'lspsaga.rename'.rename()<CR>

nnoremap <silent><leader>ca <cmd>lua require'lspsaga.codeaction'.code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require'lspsaga.codeaction'.range_code_action()<CR>

" formatting
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

" LSP Saga
autocmd CursorHold * lua
            \ local ok, result = pcall(vim.api.nvim_buf_get_var, 0, 'show_diagnostics')
            \ if not ok or result then
            \     require("lspsaga.diagnostic").show_line_diagnostics()
            \ end

nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> <leader>dd <cmd>call mrossinek#functions#ToggleDiagnostics()<CR>
