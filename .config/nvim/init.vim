" MINPAC
" Install minpac:
" mkdir -p ~/.config/nvim/pack/minpac/opt/
" cd ~/.config/nvim/pack/minpac/opt
" git clone git@github.com:k-takata/minpac.git

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})  " enables auto updates

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" PLUGINS

" START

" local vimrc
call minpac#add('embear/vim-localvimrc')
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

" random vim help page
call minpac#add('mhinz/vim-randomtag')

" tpope
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')

" replace with register
call minpac#add('vim-scripts/ReplaceWithRegister')

" vim-trailing-whitespace
call minpac#add('bronson/vim-trailing-whitespace')

" indent object
call minpac#add('michaeljsmith/vim-indent-object')

" undotree
call minpac#add('mbbill/undotree')
nnoremap <leader>ut :UndotreeToggle<cr>

" distraction free
call minpac#add('junegunn/goyo.vim')
let g:goyo_width = '90%'
let g:goyo_height = '90%'
nnoremap gy :Goyo<cr>

" error marking
call minpac#add('mh21/errormarker.vim')

" async
call minpac#add('skywind3000/asyncrun.vim')
let g:asyncrun_auto = 'make'
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
nnoremap <leader>qf :call asyncrun#quickfix_toggle(8)<cr>

" completion
call minpac#add('ervandew/supertab')
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters_explicit = 1
let g:ale_linters =     {
                        \       'cpp': ['gcc'],
                        \       'cuda': ['nvcc'],
                        \       'haskell': ['ghc'],
                        \       'help': [],
                        \       'java': ['javac'],
                        \       'markdown': ['prettier'],
                        \       'python': ['flake8'],
                        \       'sh': ['shellcheck'],
                        \       'tex': ['chktex'],
                        \       'text': [],
                        \       'vim': ['vint'],
                        \}
let g:ale_linter_aliases =      {
                                \       'bash': 'sh',
                                \       'c': 'cpp',
                                \       'html': 'markdown',
                                \       'json': 'markdown',
                                \       'latex': 'tex',
                                \       'plaintex': 'tex',
                                \       'plaintext': 'text',
                                \       'zsh': 'sh',
                                \}
call minpac#add('w0rp/ale')

" CMake integration
call minpac#add('vhdirk/vim-cmake')

" Git integration
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-fugitive')
augroup git
        autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" TMUX
call minpac#add('christoomey/vim-tmux-navigator')
let g:tmux_navigator_no_mappings = 1
call minpac#add('christoomey/vim-tmux-runner')
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
nnoremap <leader>tc  :VtrSendCommandToRunner<cr>
nnoremap <leader>tl  :VtrSendLinesToRunner<cr>
vnoremap <leader>tl  :VtrSendLinesToRunner<cr>
nnoremap <leader>ts  :VtrSendFile<cr>
nnoremap <leader>to  :VtrOpenRunner<cr>
nnoremap <leader>tk  :VtrKillRunner<cr>
nnoremap <leader>tf  :VtrFocusRunner<cr>
nnoremap <leader>td  :VtrDetachRunner<cr>
nnoremap <leader>ta  :VtrAttachToPane<cr>
nnoremap <leader>tcl :VtrClearRunner<cr>
nnoremap <leader>tfl :VtrFlushCommand<cr>
nnoremap <leader>tro :VtrReorientRunner<cr>

" DESIGN
" colorscheme
call minpac#add('NLKNguyen/papercolor-theme')
set background=dark
colorscheme PaperColor

" airline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols_ascii = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' ln'

" OPT

" C++
call minpac#add('vim-scripts/OmniCppComplete', {'type': 'opt'})

" Python
call minpac#add('davidhalter/jedi-vim', {'type': 'opt'})

" LaTeX
call minpac#add('lervag/vimtex', {'type': 'opt'})

" Markdown
call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})

" OPT Loading
augroup PackOptLoad
        autocmd!
        autocmd FileType cpp packadd OmniCppComplete
        autocmd FileType python packadd jedi-vim
        autocmd FileType tex packadd vimtex
        autocmd FileType markdown packadd vim-markdown
augroup end

" BASICS
set colorcolumn=81
set complete+=kspell
set completeopt-=preview
set cursorline
set hidden
set nowrap
set number
set relativenumber
set scrolloff=2
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smartcase
set undofile
set updatetime=100

" indentation
set expandtab
set smartindent

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" fuzzy finding
set path+=**
set wildmenu

" ABBREVIATIONS
cabbrev h vert h
cabbrev Man vert Man

" NAVIGATION

" window movement
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
nnoremap <A-H> <C-w>H
nnoremap <A-J> <C-w>J
nnoremap <A-K> <C-w>K
nnoremap <A-L> <C-w>L
inoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
inoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
inoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
inoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
inoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
inoremap <A-H> <C-\><C-n><C-w>H
inoremap <A-J> <C-\><C-n><C-w>J
inoremap <A-K> <C-\><C-n><C-w>K
inoremap <A-L> <C-\><C-n><C-w>L

" zoom-win like functionality
" mnemonic: window maximize
nnoremap <C-W>m :winc _ <bar> winc <bar> <cr>
" mnemonic: window all
nnoremap <C-W>a :winc =<cr>

" FUNCTIONS

function! FixLastSpellingError()
        normal! mm[s1z=`m"
endfunction

function! ToggleScrollingMode()
        if &scrolloff!=100
                :normal! M
                setlocal scrolloff=100
        else
                setlocal scrolloff=2
        endif
endfunction

function! ExecuteMacroOverVisualRange()
        echo '@'.getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
endfunction

" COMMANDS
command! MakeTags !ctags -R .

" MAPPINGS
nnoremap <leader>so :source %<cr>
nnoremap <leader>n :noh<cr>

nnoremap <leader>sp :call FixLastSpellingError()<cr>
nnoremap <leader>sl :setlocal spelllang=

nnoremap <leader>sc :call ToggleScrollingMode()<cr>
nnoremap <leader>scb :setlocal scb!<cr>

" simpler splitting
nnoremap <A--> :new<cr>
inoremap <A--> <C-\><C-n>:new<cr>:startinsert<cr>
nnoremap <A-\|> :vnew<cr>
inoremap <A-\|> <C-\><C-n>:vnew<cr>:startinsert<cr>

" visual @
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" TEXT OBJECTS

" ALL object (Note: inner does not make sense here)
vnoremap aa :<C-U>silent! normal! ggVG<CR>
omap aa :normal Vaa<CR>

" Line object
vnoremap al :<C-U>silent! normal! 0v$h<CR>
omap al :normal Val<CR>
vnoremap il :<C-U>silent! normal! ^v$h<CR>
omap il :normal Vil<CR>
vnoremap aL :<C-U>silent! normal! 0v$<CR>
omap aL :normal VaL<CR>
vnoremap iL :<C-U>silent! normal! ^v$<CR>
omap iL :normal ViL<CR>

" | object
vnoremap a\| :<C-U>silent! normal! F\|vf\|<CR>
omap a\| :normal va\|<CR>
vnoremap i\| :<C-U>silent! normal! T\|vt\|<CR>
omap i\| :normal vi\|<CR>

" SESSIONS
" file editing
augroup files
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" configure mkview
set viewoptions-=options
augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* mkview!
        autocmd BufWinEnter *.* silent! loadview
augroup END

" TERMINAL
" set coloring for terminal cursor
au TermOpen * hi! link TermCursor Cursor
au TermOpen * hi! TermCursorNC ctermfg=15 ctermbg=6 cterm=NONE
" Esc key
tnoremap <Esc> <C-\><C-n>
tnoremap <A-e> <Esc>
" seemless window switching
tnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
tnoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
tnoremap <A-H> <C-\><C-n><C-w>H
tnoremap <A-J> <C-\><C-n><C-w>J
tnoremap <A-K> <C-\><C-n><C-w>K
tnoremap <A-L> <C-\><C-n><C-w>L
" pasting
tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
tnoremap <A-R> <C-\><C-n>0pi

" NETRW
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
