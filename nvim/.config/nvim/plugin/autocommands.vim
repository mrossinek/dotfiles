" file editing
augroup FileEditing
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({
                    \ higroup="ExtraWhiteSpace",
                    \ timeout=200})
    endif
augroup end
