function! notewarrior#NewNote(...)
    let l:fname = expand('~/Files/Notes/') . join(a:000, '-') . '.md'
    execute 'e ' . l:fname
endfunction
