" set coloring for terminal cursor
augroup TermHighlight
    autocmd!
    autocmd TermOpen * highlight! link TermCursor Cursor
    autocmd TermOpen * highlight! TermCursorNC ctermfg=15 ctermbg=6 cterm=NONE
augroup END
