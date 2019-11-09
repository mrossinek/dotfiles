augroup FugitiveBufferDeletion
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup end
