let g:vimwiki_autowriteall = 0
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1

let wiki = {}
let wiki.path = '~/Files/Notes/'
let wiki.path_html = '~/Files/Notes/'
let wiki.index = 'Index'
let wiki.ext = '.md'
let wiki.syntax = 'markdown'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki.automatic_nested_syntaxes = 1
" the following binary is provided by https://gitlab.com/mrossinek/notewarrior
let wiki.custom_wiki2html = '/usr/local/bin/wiki2html_pandoc'

let g:vimwiki_list = [wiki]
