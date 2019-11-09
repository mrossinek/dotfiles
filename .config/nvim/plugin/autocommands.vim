" file editing
augroup FileEditing
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end

" rememvber folds
augroup RememberFolds
    autocmd!
    autocmd BufWinLeave *.* mkview!
    autocmd BufWinEnter *.* silent! loadview
augroup end

" color theme
augroup ColorTheme
    autocmd!
    " make sign column transparent
    autocmd ColorScheme * highlight clear SignColumn
    " italize comments
    autocmd ColorScheme * highlight Comment cterm=italic gui=italic
    " make search highlights more consistent
    autocmd ColorScheme * highlight clear Search
    autocmd ColorScheme * highlight Search cterm=underline ctermfg=190 gui=underline guifg=190
augroup end

" quit if last window is quickfix
augroup QuickfixQuitting
    autocmd!
    autocmd WinEnter * if winnr('$') == 1 && &buftype == 'quickfix' | quit | endif
augroup end
