scriptencoding utf-8

" Highlight Groups
function! mrossinek#statusline#StatuslineInitHighlighting()
    " clear old StatusLine highlighting
    highlight clear StatusLine
    highlight clear StatusLineNC
    highlight StatusLineNC ctermbg=235 guibg='#262626'
    highlight! link StatusLineTerm StatusLine
    highlight! link StatusLineTermNC StatusLineNC

    " User 1: Mode highlighting
    highlight StatuslineUnmodified cterm=bold ctermfg=White ctermbg=DarkGreen gui=bold guifg=White guibg=DarkGreen
    highlight StatuslineModified cterm=bold ctermfg=White ctermbg=Red gui=bold guifg=White guibg=Red
    highlight! link User1 StatuslineUnmodified

    " User 2: basic statusline info
    highlight User2 ctermbg=236 guibg='#303030' ctermfg=220 guifg='#ffd700'
    highlight! link StatusLine User2

    " User 3: info field: match CursorColumn
    highlight! link User3 CursorColumn

    " User 4: LSP info
    highlight User4 ctermbg=236 guibg='#303030' ctermfg=45 guifg='#00d7ff'
    highlight! link StatuslineLSPInfo User4
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
function! mrossinek#statusline#StatuslineLSPInfo()
  if luaeval('#vim.lsp.get_clients({buffer=0}) > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" GitGutter wrapper
function! mrossinek#statusline#StatuslineGitInfo()
    let l:head = get(b:, 'gitsigns_head', '')
    let l:status = get(b:, 'gitsigns_status', '')
    if l:head == '' || l:status == ''
        return ''
    endif
    return printf('{ %s} [%s]', l:head, l:status)
endfunction
