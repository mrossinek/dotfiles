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
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" GitGutter wrapper
function! mrossinek#statusline#StatuslineGitInfo()
    if gina#component#repo#branch() == ''
        return ''
    endif
    let l:branch_symbol = ''
    let l:added_symbol = '+'
    let l:modified_symbol = '~'
    let l:removed_symbol = '-'
    let [l:added, l:modified, l:removed] = GitGutterGetHunkSummary()
    let l:branch_name = gina#component#repo#branch()
    return printf('{%s %s} [%d%s %d%s %d%s]',
                \ l:branch_symbol, l:branch_name,
                \ l:added, l:added_symbol, l:modified,
                \ l:modified_symbol, l:removed, l:removed_symbol)
endfunction
