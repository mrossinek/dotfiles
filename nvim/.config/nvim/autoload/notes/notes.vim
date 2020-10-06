function! notes#notes#index()
    execute 'e' . g:zettelkasten
endfunction

function! notes#notes#new_note(title)
    let l:folder = g:zettelkasten
    let l:fname = strftime('%Y%m%d') . '-' . substitute(a:title, '\v\s+', '_', 'g') . '.md'
    execute 'e' . l:folder . '/' . l:fname
endfunction

function! notes#notes#list_filter()
    " TODO check whether it is possible to one-line this inside of the autocmd
    if expand('%:h') == expand(g:zettelkasten)
        global/\.git/d
    endif
endfunction
