let s:abolish_snakecase = g:Abolish.snakecase

function! s:snakecase(word)
  return substitute(s:abolish_snakecase(a:word),'/','_','g')
endfunction

function! s:dotcase(word)
  return substitute(s:snakecase(a:word),'_','.','g')
endfunction

function! s:pathcase(word)
  return substitute(s:snakecase(a:word),'_','/','g')
endfunction

call extend(Abolish, {'pathcase': function('s:pathcase')}, "keep")
call extend(Abolish, {'dotcase': function('s:dotcase')}, "force")
call extend(Abolish, {'snakecase': function('s:snakecase')}, "force")
call extend(Abolish.Coercions, {'/': Abolish.pathcase}, "keep")
call extend(Abolish.Coercions, {'.': Abolish.dotcase}, "force")
call extend(Abolish.Coercions, {'_': Abolish.snakecase}, "force")
