function! mrossinek#functions#FixLastSpellingError()
    normal! mm[s1z=`m"
endfunction

function! mrossinek#functions#ToggleScrollingMode()
    if &scrolloff!=100
        :normal! M
        setlocal scrolloff=100
    else
        setlocal scrolloff=2
    endif
endfunction

function! mrossinek#functions#ExecuteMacroOverVisualRange()
        echo '@'.getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! mrossinek#functions#GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! mrossinek#functions#ToggleList(bufname, pfx)
  let buflist = mrossinek#functions#GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx ==# 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo 'Location List is Empty.'
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
