setlocal foldmethod=syntax

command! MakeTage AsyncRun ctags -R --java-kinds=+p --fields=+iaS --extra=+q .

setlocal omnifunc=syntax#Complete
