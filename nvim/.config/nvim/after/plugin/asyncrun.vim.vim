let g:asyncrun_auto = 'make'

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
