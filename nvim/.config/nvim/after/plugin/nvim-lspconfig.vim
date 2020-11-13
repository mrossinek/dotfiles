lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = function(bufnr, client_id)
            settings = {
                spacing = 2,
                prefix = "",
            }
            local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_diagnostics')
            if not ok or result then
                return settings
            end
            return false
        end,
        signs = function(bufnr, client_id)
            local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_diagnostics')
            if not ok then
                return true
            end
            return result
        end,
    }
)

local lsp_status = require('lsp-status')
lsp_status.config {
    status_symbol = ' ',
    indicator_hint = '',
    indicator_info = '',
}
lsp_status.register_progress()

local nvim_command = vim.api.nvim_command
local on_attach_vim = function(client)
  lsp_status.on_attach(client)
end

local nvim_lsp = require('nvim_lsp')
nvim_lsp.clangd.setup{
    callbacks = lsp_status.extensions.clangd.setup(),
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities
}

nvim_lsp.fortls.setup{
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities
}

-- overwrite the pylint executable to ensure it is run from the virtualenv
nvim_lsp.pyls.setup{
    settings = {
        pyls = {
            plugins = {
                pylint = {
                    enabled = true,
                    executable = 'pylint',
                }
            }
        }
    },
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities
}

nvim_lsp.vimls.setup{
    on_attach=on_attach_vim,
    capabilities=lsp_status.capabilities
}
EOF

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" lsp-diagnostics
sign define LspDiagnosticsSignError text=
sign define LspDiagnosticsSignWarning text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint text=

nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
