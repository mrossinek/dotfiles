set winbar=
set winbar+=\ %2*
set winbar+=%<    " if line becomes too long, shorten it here
set winbar+=%{pathshorten(expand('%'))}  " filename
set winbar+=%=    " right align the rest
set winbar+=\ %y  " filetype
set winbar+=\ %3*
set winbar+=%{&fileencoding?&fileencoding!=#'utf-8':''}  " ignore utf-8
set winbar+=%*  " reset highlighting
