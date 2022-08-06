function! mrossinek#functions#FixLastSpellingError()
    normal! mm[s1z=`m"
endfunction

function! mrossinek#functions#ToggleScrollingMode()
    if &scrolloff!=100
        :normal! M
        setlocal scrolloff=100
    else
        setlocal scrolloff=2
    endif
endfunction

function! mrossinek#functions#ExecuteMacroOverVisualRange()
    echo '@'.getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! mrossinek#functions#GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
endfunction

function! mrossinek#functions#ToggleList(bufname, pfx)
    let buflist = mrossinek#functions#GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx ==# 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo 'Location List is Empty.'
        return
    endif
    let winnr = winnr()
    exec(a:pfx.'open')
    if winnr() != winnr
        wincmd p
    endif
endfunction

function! mrossinek#functions#WebSearch(type, ...)
    " adapted from https://www.reddit.com/r/vim/comments/ebaoku/function_to_google_any_text_object/
    let sel_save = &selection
    let &selection = 'inclusive'
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent execute 'normal! `<' . a:type . '`>y'
    elseif a:type ==? 'line'
        silent execute "normal! '[V']y"
    else
        silent execute 'normal! `[v`]y'
    endif

    let filetype = ''
    if &filetype !=? 'text'
        let filetype = &filetype . '+'
    endif
    let search = filetype . substitute(trim(@@), ' \+', '+', 'g')

    silent execute "!xdg-open 'https://search.brave.com/search?q=" . search . "'"
    if v:shell_error > 0
        silent execute "!open 'https://search.brave.com/search?q=" . search . "'"
    endif

    let &selection = sel_save
    let @@ = reg_save
endfunction

function! mrossinek#functions#ToggleDiagnostics()
    if !exists('b:show_diagnostics') || b:show_diagnostics == v:true
        let b:show_diagnostics = v:false
        lua vim.diagnostic.disable()
    else
        let b:show_diagnostics = v:true
        lua vim.diagnostic.enable()
    endif
endfunction

" Function to permanently delete the `mkview` of the current file.
" Source: https://stackoverflow.com/a/28460676
function! mrossinek#functions#DeleteView()
    let path = fnamemodify(bufname('%'),':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echomsg "Deleted: ".path
    echomsg "Be sure to disable the `RememberFolds` autocmd group!"
endfunction
