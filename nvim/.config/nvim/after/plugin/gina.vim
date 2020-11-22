" Echo chunk info with j/k
call gina#custom#mapping#nmap(
      \ 'blame', 'j',
      \ 'j<Plug>(gina-blame-echo)'
      \)
call gina#custom#mapping#nmap(
      \ 'blame', 'k',
      \ 'k<Plug>(gina-blame-echo)'
      \)
