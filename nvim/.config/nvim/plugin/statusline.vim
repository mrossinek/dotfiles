augroup StatuslineHighlighting
    autocmd!
    autocmd VimEnter,ColorScheme * call mrossinek#statusline#StatuslineInitHighlighting()
    autocmd TextChanged,TextChangedI,BufEnter,BufWritePost * call mrossinek#statusline#StatuslineUpdateHighlighting()
augroup end

if has('statusline')
    set statusline=
    set statusline+=%1*
    set statusline+=\ %{mrossinek#statusline#StatuslineMode()}
    set statusline+=\ %2*
    set statusline+=\ %<    " if line becomes too long, shorten it here
    set statusline+=%{pathshorten(expand('%'))}  " filename
    set statusline+=\ %{mrossinek#statusline#StatuslineGitInfo()}
    set statusline+=\ %a  " arguments list position
    set statusline+=\ %m  " modified/modifiable flag
    set statusline+=\ %r  " readonly flag
    set statusline+=%=    " right align the rest
    set statusline+=\ %y  " filetype
    set statusline+=\ %3*
    set statusline+=%{&fileencoding?&fileencoding!=#'utf-8':''}  " ignore utf-8
    set statusline+=%4.4p%%  " file position in percentage (padded)
    set statusline+=%{mrossinek#statusline#StatuslineIndicatePos()}
    set statusline+=\ %4*
    set statusline+=%{mrossinek#statusline#StatuslineLSPInfo()}
    set statusline+=%*  " reset highlighting
endif
