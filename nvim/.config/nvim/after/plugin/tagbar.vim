" mnemonic: Ctags Toggle
nnoremap <leader>ct :TagbarToggle<cr>

" Add support for vimwiki markdown-based files in tagbar
let g:tagbar_type_vimwiki = {
            \ 'ctagstype': 'markdown',
            \ 'ctagsbin' : '/usr/local/bin/markdown2ctags',
            \ 'ctagsargs' : '-f - --sort=no --sro=::',
            \ 'kinds' : [
            \ 's:sections',
            \ ],
            \ 'sro' : '::',
            \ 'kind2scope' : {
            \ 's' : 'section',
            \ },
            \ 'sort': 0,
            \ }
