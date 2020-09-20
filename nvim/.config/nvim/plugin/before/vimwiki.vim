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
let wiki.template_path = ''  " disable html templates
" the following binary is provided by https://gitlab.com/mrossinek/notewarrior
let wiki.custom_wiki2html = '/usr/local/bin/wiki2html_pandoc'

if exists('g:vimwiki_list')
    let g:vimwiki_list += [wiki]
else
    let g:vimwiki_list = [wiki]
endif
