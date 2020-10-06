function! notes#notes#index()
    execute 'e' . g:zettelkasten
endfunction

function! notes#notes#new_note(title)
    let l:folder = g:zettelkasten
    let l:fname = strftime('%Y%m%d') . '-' . substitute(a:title, '\v\s+', '_', 'g') . '.md'
    execute 'e' . l:folder . '/' . l:fname
endfunction
