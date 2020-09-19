" ALL object (Note: inner does not make sense here)
vnoremap aa :<C-U>silent! normal! ggVG<CR>
onoremap aa :normal Vaa<CR>

" Line object
vnoremap al :<C-U>silent! normal! 0v$h<CR>
onoremap al :normal Val<CR>
vnoremap il :<C-U>silent! normal! ^v$h<CR>
onoremap il :normal Vil<CR>
vnoremap aL :<C-U>silent! normal! 0v$<CR>
onoremap aL :normal VaL<CR>
vnoremap iL :<C-U>silent! normal! ^v$<CR>
onoremap iL :normal ViL<CR>

" | object
vnoremap a\| :<C-U>silent! normal! F\|vf\|<CR>
onoremap a\| :normal va\|<CR>
vnoremap i\| :<C-U>silent! normal! T\|vt\|<CR>
onoremap i\| :normal vi\|<CR>

" & object
vnoremap a& :<C-U>silent! normal! F&vf&<CR>
onoremap a& :normal va&<CR>
vnoremap i& :<C-U>silent! normal! T&vt&<CR>
onoremap i& :normal vi&<CR>

" = object
vnoremap a= :<C-U>silent! normal! F=vf=<CR>
onoremap a= :normal va=<CR>
vnoremap i= :<C-U>silent! normal! T=vt=<CR>
onoremap i= :normal vi=<CR>

" : object
vnoremap a: :<C-U>silent! normal! F:vf:<CR>
onoremap a: :normal va:<CR>
vnoremap i: :<C-U>silent! normal! T:vt:<CR>
onoremap i: :normal vi:<CR>
