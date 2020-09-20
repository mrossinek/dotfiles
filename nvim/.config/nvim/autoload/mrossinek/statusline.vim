scriptencoding utf-8

" Highlight Groups
function! mrossinek#statusline#StatuslineInitHighlighting()
    " clear old StatusLine highlighting
    highlight clear StatusLine
    highlight clear StatusLineNC
    highlight StatusLineNC ctermbg=235 guibg='#262626'
    highlight! link StatusLineTerm StatusLine
    highlight! link StatusLineTermNC StatusLineNC
    " fix TabLine while we are at it
    highlight! TabLineFill ctermbg=236 guibg='#303030'

    " User 1: Mode highlighting
    highlight StatuslineUnmodified cterm=bold ctermfg=white ctermbg=darkgreen gui=bold guifg=White guibg=DarkGreen
    highlight StatuslineModified cterm=bold ctermfg=white ctermbg=red gui=bold guifg=White guibg=Red
    highlight! link User1 StatuslineUnmodified

    " User 2: basic statusline info
    highlight User2 ctermbg=236 guibg='#303030' ctermfg=220 guifg='#ffd700'
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
function! mrossinek#statusline#StatuslineUpdateHighlighting()
    if getbufvar(bufnr('%'), '&modified')
        highlight! link User1 StatuslineModified
    else
        highlight! link User1 StatuslineUnmodified
    endif
endfunction

" first field: mode information
function! mrossinek#statusline#StatuslineMode()
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
function! mrossinek#statusline#StatuslineIndicatePos()
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
function! mrossinek#statusline#StatuslineALECount(type)
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

" GitGutter wrapper
function! mrossinek#statusline#StatuslineGitInfo()
    if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
        return ''
    endif
    let l:added_symbol = '+'
    let l:modified_symbol = '~'
    let l:removed_symbol = '-'
    let [l:added, l:modified, l:removed] = GitGutterGetHunkSummary()
    return printf('[%d%s %d%s %d%s]', l:added, l:added_symbol, l:modified,
                \ l:modified_symbol, l:removed, l:removed_symbol)
endfunction

" tagbar#currenttag wrapper
function! mrossinek#statusline#StatuslineCurrentTag()
    let l:tag = tagbar#currenttag('%s', '')
    if empty(l:tag)
        return ''
    endif
    let l:file = tagbar#state#get_current_file(1)
    if empty(l:file) || l:file.fpath != expand('%:p')
        return ''
    endif
    if strlen(l:tag) > 20
        let l:tag = '..' . l:tag[-18:]
    endif
    return printf('{%s}', l:tag)
endfunction
