setlocal foldmethod=syntax

command! MakeTage !ctags -R --java-kinds=+p --fields=+iaS --extra=+q .

setlocal omnifunc=syntax#Complete
