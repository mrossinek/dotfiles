lua << EOF
local telescope = require('telescope')

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden'
        },
    },
}

telescope.load_extension('bibtex')
telescope.load_extension('dap')
telescope.load_extension('fzy_native')
telescope.load_extension('git_worktree')
telescope.load_extension('file_browser')
EOF

" File Pickers
nnoremap <silent> <CR>ff <cmd>lua require'telescope.builtin'.find_files(require'telescope.themes'.get_dropdown( { previewer = false, find_command = { "rg", "--ignore", "--hidden", "--files", "--no-ignore-vcs", "--glob", "!.git" } } ) )<CR>
nnoremap <silent> <CR>gg <cmd>lua require'telescope.builtin'.git_files(require'telescope.themes'.get_dropdown( { previewer = false } ) )<CR>
nnoremap <silent> <CR>gl <cmd>lua require'telescope.builtin'.live_grep( { path_display = { "shorten" } } )<CR>
nnoremap <silent> <CR>gr <cmd>lua require'telescope.builtin'.grep_string( { path_display = { "shorten" } } )<CR>

" Vim Pickers
nnoremap <silent> <CR>bb <cmd>lua require'telescope.builtin'.buffers()<CR>
nnoremap <silent> <CR>cc <cmd>lua require'telescope.builtin'.command_history()<CR>
nnoremap <silent> <CR>hl <cmd>lua require'telescope.builtin'.help_tags()<CR>
nnoremap <silent> <CR>mn <cmd>lua require'telescope.builtin'.man_pages()<CR>
nnoremap <silent> <CR>sp <cmd>lua require'telescope.builtin'.spell_suggest()<CR>

" Git Pickers
nnoremap <silent> <CR>gc <cmd>lua require'telescope.builtin'.git_commits()<CR>
nnoremap <silent> <CR>gb <cmd>lua require'telescope.builtin'.git_bcommits()<CR>

" LSP Pickers
nnoremap <silent> <CR>rr <cmd>lua require'telescope.builtin'.lsp_references()<CR>
nnoremap <silent> <CR>ds <cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>
nnoremap <silent> <CR>ws <cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>
nnoremap <silent> <CR>ca <cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>

" Treesitter Pickers
nnoremap <silent> <CR>tr <cmd>lua require'telescope.builtin'.treesitter()<CR>

" Lists Pickers
nnoremap <silent> <CR>pp <cmd>lua require'telescope.builtin'.builtin()<CR>
nnoremap <silent> <CR>ss <cmd>lua require'telescope.builtin'.symbols()<CR>

" Plugins
nnoremap <silent> <CR>bt <cmd>lua require'telescope'.extensions.bibtex.bibtex()<CR>

nnoremap <silent> <CR>dm <cmd>lua require'telescope'.extensions.dap.commands()<CR>
nnoremap <silent> <CR>dc <cmd>lua require'telescope'.extensions.dap.configurations()<CR>
nnoremap <silent> <CR>db <cmd>lua require'telescope'.extensions.dap.list_breakpoints()<CR>
nnoremap <silent> <CR>dv <cmd>lua require'telescope'.extensions.dap.variables()<CR>

nnoremap <silent> <CR>wt <cmd>lua require'telescope'.extensions.git_worktree.git_worktrees()<CR>

nnoremap <silent> <CR>fb <cmd>lua require'telescope'.extensions.file_browser.file_browser({ hidden = true })<CR>

" Custom
nnoremap <silent> <CR>df <cmd>lua require'telescope.builtin'.find_files(require'telescope.themes'.get_dropdown( { previewer = false, prompt_title = "~ dotfiles ~", cwd = "~/dotfiles", find_command = { "rg", "--ignore", "--hidden", "--files", "--no-ignore-vcs", "--glob", "!.git" } } ) )<CR>
