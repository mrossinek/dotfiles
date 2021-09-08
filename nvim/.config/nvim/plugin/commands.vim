command! MakeTags !ctags -R .

command! DeleteView call mrossinek#functions#DeleteView()

command! StopLSP lua vim.lsp.stop_client(vim.lsp.get_active_clients())

command! WhichHighlight echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
