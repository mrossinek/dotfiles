colorscheme mrossinek

nnoremap <space> <Nop>
let mapleader=" "

if exists('$EXTRA_VIM')
  for path in split($EXTRA_VIM, ':')
    exec 'source '.path
  endfor
endif
