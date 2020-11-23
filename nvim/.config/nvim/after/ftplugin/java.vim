setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()

command! MakeTage AsyncRun ctags -R --java-kinds=+p --fields=+iaS --extras=+q .

let g:ale_java_checkstyle_options = '-c ~/.checkstyle/google_checks.xml'
