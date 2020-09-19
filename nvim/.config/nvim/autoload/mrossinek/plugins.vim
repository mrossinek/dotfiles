function! mrossinek#plugins#goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! mrossinek#plugins#goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

" This function is called in an autocommand when the FileType of a file is set
" to vimwiki. This function will then check the path of the file being edited
" against all registered wiki paths. If the path is found, nothing happens.
" Otherwise it reverts the FileType to markdown.
function! mrossinek#plugins#vimwiki_assert_filetype()
    let wiki_paths = []
    for wiki in g:vimwiki_list
        let wiki_paths += [trim(expand(wiki.path), '/')]
    endfor
    " trimmed paths are used in order to ensure equal endings in '/' symbols
    let path = trim(expand('%:p:h'), '/')
    if index(wiki_paths, path) == -1
        " disable vimwiki filetype again
        setlocal filetype=markdown
    endif
endfunction
