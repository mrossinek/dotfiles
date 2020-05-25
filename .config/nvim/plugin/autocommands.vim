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

" quit if last window is quickfix
augroup QuickfixQuitting
    autocmd!
    autocmd WinEnter * if winnr('$') == 1 && &buftype == 'quickfix' | quit | endif
augroup end

" TextYankPost
augroup FlashYanked
    autocmd!
    if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('ExtraWhiteSpace', 200)
    endif
augroup end
