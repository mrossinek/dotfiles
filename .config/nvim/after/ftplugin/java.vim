setlocal foldmethod=syntax

command! MakeTage AsyncRun ctags -R --java-kinds=+p --fields=+iaS --extras=+q .

setlocal omnifunc=syntax#Complete

let g:java_checkstyle_classpath = '~/.checkstyle/checkstyle-8.17-all.jar'
let g:java_checkstyle_config = '~/.checkstyle/google_checks.xml'

function! RunCheckStyle()
  let old_errorformat = &errorformat
  try
    let checkstyle_cmd = printf('java -cp %s %s -c %s %s',
	\  g:java_checkstyle_classpath,
	\  'com.puppycrawl.tools.checkstyle.Main',
	\  g:java_checkstyle_config,
	\  expand('%:p'))
    let output = system(checkstyle_cmd)
    setlocal errorformat=%*[\[A-Z*\]]\ %f:%l:%c:\ %m,%*[\[A-Z*\]]%f:%l:\ %m,%-G%.%#
    cexpr output
    if len(getqflist()) > 0
      copen | cc
    elseif v:shell_error != 0
      echohl ErrorMsg | echo output | echohl None
    else
      cclose
    endif
  finally
    let &errorformat = old_errorformat
  endtry
endfunction

command! CheckStyle call RunCheckStyle()
