setlocal colorcolumn=120
setlocal foldmethod=syntax

command! MakeTage AsyncRun ctags -R --java-kinds=+p --fields=+iaS --extras=+q .

setlocal omnifunc=syntax#Complete

let g:ale_java_checkstyle_options = '-c ~/.checkstyle/google_checks.xml'
