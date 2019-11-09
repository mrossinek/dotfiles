packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})  " enables auto updates

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Python support is installed into a virtualenv to allow seemless usage across
" system and other virtualenvs
let g:python_host_prog = expand('~/Installations/pynvim2/.direnv/python-2.7.16/bin/python')
let g:python3_host_prog = expand('~/Installations/pynvim3/.direnv/python-3.7.4/bin/python')


" START
" local vimrc
call minpac#add('embear/vim-localvimrc')

" random vim help page
call minpac#add('mhinz/vim-randomtag')

" tpope
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-vinegar')

" wincent
call minpac#add('wincent/replay')
call minpac#add('wincent/loupe')
call minpac#add('wincent/vcs-jump')

" exchange
call minpac#add('tommcdo/vim-exchange')

" replace with register
call minpac#add('vim-scripts/ReplaceWithRegister')

" vim-trailing-whitespace
call minpac#add('bronson/vim-trailing-whitespace')

" indent object
call minpac#add('michaeljsmith/vim-indent-object')

" peekaboo: register preview
call minpac#add('junegunn/vim-peekaboo')
" markbar: mark preview
call minpac#add('Yilin-Yang/vim-markbar')

" undotree
call minpac#add('mbbill/undotree')

" distraction free
call minpac#add('junegunn/goyo.vim')
call minpac#add('chrisbra/NrrwRgn')

" linediff
call minpac#add('AndrewRadev/linediff.vim')

" error marking
call minpac#add('mh21/errormarker.vim')

" async
call minpac#add('skywind3000/asyncrun.vim')

" completion
call minpac#add('ervandew/supertab')
call minpac#add('dense-analysis/ale')
call minpac#add('Shougo/deoplete.nvim')

" tagbar
call minpac#add('majutsushi/tagbar')

" CMake integration
call minpac#add('vhdirk/vim-cmake')

" Git integration
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-fugitive')
call minpac#add('shumphrey/fugitive-gitlab.vim')
call minpac#add('junegunn/gv.vim')

" TMUX
call minpac#add('tmux-plugins/vim-tmux-focus-events')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('https://gitlab.com/mrossinek/vim-tmux-controller')
call minpac#add('https://gitlab.com/mrossinek/displayp.vim')
call minpac#add('wellle/tmux-complete.vim')

" DESIGN
" colorscheme
call minpac#add('NLKNguyen/papercolor-theme')
let &background='dark'
let g:PaperColor_Theme_Options = {
            \   'theme': {
            \     'default': {
            \       'transparent_background': 1,
            \     },
            \     'default.dark': {
            \       'override' : {
            \       'color00' : ['#303030', '236'],
            \       'cursor_fg' : ['#303030', '236'],
            \       'cursorlinenr_bg' : ['#303030', '236'],
            \       'linenumber_bg' : ['#303030', '236'],
            \       'vertsplit_bg' : ['#303030', '236'],
            \       'statusline_active_fg' : ['#303030', '236'],
            \       'todo_bg' : ['#303030', '236'],
            \       'wildmenu_fg': ['#303030', '236'],
            \       'cursorline' : ['#444444', '238'],
            \       'cursorcolumn' : ['#444444', '238'],
            \       'popupmenu_bg' : ['#444444', '238'],
            \       }
            \     }
            \   }
            \ }
colorscheme PaperColor

" ANSI color support
call minpac#add('powerman/vim-plugin-AnsiEsc')

" Colorizer
call minpac#add('chrisbra/Colorizer')

" Zeal
call minpac#add('KabbAmine/zeavim.vim')

" OPT
" ledger
call minpac#add('ledger/vim-ledger', {'type': 'opt'})

" Python
call minpac#add('davidhalter/jedi-vim', {'type': 'opt'})
call minpac#add('fs111/pydoc.vim', {'type': 'opt'})
call minpac#add('tmhedberg/SimpylFold', {'type': 'opt'})

" LaTeX
call minpac#add('lervag/vimtex', {'type': 'opt'})

" Mail
call minpac#add('nicoe/deoplete-khard', {'type': 'opt'})

" Markdown
call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})

" Wiki
call minpac#add('vimwiki/vimwiki', {'type': 'opt'})
call minpac#add('tbabej/taskwiki', {'type': 'opt'})

" grammer checker: languagetool
call minpac#add('rhysd/vim-grammarous', {'type': 'opt'})

" vim-verdict
call minpac#add('https://gitlab.com/mrossinek/vim-verdict', {'type': 'opt'})

" OPT Loading
augroup PackOptLoad
    autocmd!
    autocmd FileType ledger packadd vim-ledger
    autocmd FileType ledger doautocmd User MyLedger
    autocmd FileType cs packadd Omnisharp-vim
    autocmd FileType python packadd jedi-vim | call jedi#configure_call_signatures()
    autocmd FileType python packadd pydoc.vim
    autocmd FileType python packadd SimpylFold
    autocmd FileType tex packadd vimtex
    autocmd FileType mail packadd deoplete-khard
    autocmd FileType markdown packadd vim-markdown
    autocmd FileType text packadd vim-grammarous
    autocmd FileType text doautocmd User MyGrammarous
augroup end
