" Highlight Groups
function! StatuslineInitHighlighting()
    " clear old StatusLine highlighting
    highlight clear StatusLine
    highlight clear StatusLineNC
    highlight StatusLineNC ctermbg=235
    highlight! link StatusLineTerm StatusLine
    highlight! link StatusLineTermNC StatusLineNC
    " fix TabLine while we are at it
    highlight! TabLineFill ctermbg=236

    " User 1: Mode highlighting
    highlight StatuslineUnmodified cterm=bold ctermfg=white ctermbg=darkgreen
    highlight StatuslineModified cterm=bold ctermfg=white ctermbg=red
    highlight! link User1 StatuslineUnmodified

    " User 2: basic statusline info
    highlight User2 ctermbg=236 ctermfg=220
    highlight link StatusLine User2

    " User 3: info field: match CursorColumn
    highlight! link User3 CursorColumn

    " User 4+5: ALE info fields
    highlight! link StatuslineALEError SpellBad
    highlight! link StatuslineALEWarning SpellCap
    highlight! link User4 StatuslineALEError
    highlight! link User5 StatuslineALEWarning
endfunction

" update highlighting when buffer becomes modified
function! StatuslineUpdateHighlighting()
    if getbufvar(bufnr('%'), '&modified')
        highlight! link User1 StatuslineModified
    else
        highlight! link User1 StatuslineUnmodified
    endif
endfunction

augroup StatuslineHighlighting
    autocmd!
    autocmd VimEnter,ColorScheme * call StatuslineInitHighlighting()
    autocmd TextChanged,TextChangedI,BufEnter,BufWritePost * call StatuslineUpdateHighlighting()
augroup end

" first field: mode information
function! StatuslineMode()
    " in case we are viewing a help file which is readonly
    if &filetype ==# 'help' && &readonly
        return 'HELP'
    endif
    let l:m = mode(1)
    if l:m[0] ==? 'n'
        let l:mode = 'NORMAL'
    elseif l:m =~? '\v(v|V|)'
        let l:mode = 'VISUAL'
    elseif l:m =~? '\v(s|S|)'
        let l:mode = 'SELECT'
    elseif l:m[0] ==? 'i'
        let l:mode = 'INSERT'
    elseif l:m[0] ==? 'r'
        let l:mode = 'REPLACE'
    elseif l:m[0] ==? 'c'
        let l:mode = 'COMMAND'
    elseif l:m[0] ==? 'r'
        let l:mode = 'PROMPT'
    elseif l:m[0] ==? 't'
        let l:mode = 'TERMINAL'
    elseif l:m[0] ==? '!'
        let l:mode = 'SHELL'
    else
        let l:mode = l:m
    endif
    return l:mode
endfunction

" file location wrapper: ensures consistent number padding
function! StatuslineIndicatePos()
    let l:line = line('.')
    let l:height = line('$')
    let l:vpad = len(l:height) - len(l:line)
    let l:column = virtcol('.')
    let l:width = winwidth(0)
    let l:hpad = len(l:width) - len(l:column)
    let l:ret = ' ℒ ' . repeat(' ', l:vpad) . l:line
    let l:ret .= ' ℭ ' . repeat(' ', l:hpad) . l:column
    return l:ret . ' '
endfunction

" ALE wrapper: error and warning counter
function! StatuslineALECount(type)
    " if running: print dots
    if ale#engine#IsCheckingBuffer(bufnr('')) == 1
        if a:type ==# 'error'
            return '  ...  '
        else
            return ''
        endif
    endif

    let counts = ale#statusline#Count(bufnr(''))
    if type(counts) == type({}) && has_key(counts, 'error')
        " Use the current Dictionary format.
        let num_err = counts.error + counts.style_error
        let num_warn = counts.total - num_err
    else
        " Use the old List format.
        let num_err = counts[0]
        let num_warn = counts[1]
    endif

    if a:type ==# 'error' && num_err > 0
        let l:ret = '  E: ' . num_err . ' '
    elseif a:type ==# 'warning' && num_warn > 0
        let l:ret = '  W: ' . num_warn . ' '
    else
        let l:ret = ''
    endif
    return l:ret
endfunction

if has('statusline')
    set statusline=
    set statusline+=%1*
    set statusline+=\ %{StatuslineMode()}
    set statusline+=\ %2*
    set statusline+=\ %f  " filename
    set statusline+=\ %a  " arguments list position
    set statusline+=\ %r  " readonly flag
    set statusline+=\ %m  " modified/modifiable flag
    set statusline+=%=    " right align the rest
    set statusline+=\ %y  " filetype
    set statusline+=\ %3*
    set statusline+=%{&fileencoding?&fileencoding!=#'utf-8':''}  " ignore utf-8
    set statusline+=%4.4p%%  " file position in percentage (padded)
    set statusline+=%{StatuslineIndicatePos()}
    set statusline+=%4*
    set statusline+=%{StatuslineALECount('error')}
    set statusline+=%5*
    set statusline+=%{StatuslineALECount('warning')}
    set statusline+=%*  " reset highlighting
endif
