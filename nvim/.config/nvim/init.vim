lua << EOF
require('impatient')
EOF

colorscheme mrossinek

nnoremap <space> <Nop>
let mapleader=" "
let maplocalleader="\\"

let python3_host_prog = "~/Installations/pynvim/venv/bin/python"

if exists('$EXTRA_VIM')
  for path in split($EXTRA_VIM, ':')
    exec 'source '.path
  endfor
endif
