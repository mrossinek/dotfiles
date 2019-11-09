function! FixLastSpellingError()
    normal! mm[s1z=`m"
endfunction

function! ToggleScrollingMode()
    if &scrolloff!=100
        :normal! M
        setlocal scrolloff=100
    else
        setlocal scrolloff=2
    endif
endfunction

function! ExecuteMacroOverVisualRange()
        echo '@'.getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
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
