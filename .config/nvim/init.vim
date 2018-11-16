if has("autocmd")
        autocmd bufwritepost init.vim source $MYVIMRC
endif

" Install minpac:
" mkdir -p ~/.config/nvim/pack/minpac/opt/
" cd ~/.config/nvim/pack/minpac/opt
" git clone git@github.com:k-takata/minpac.git

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})  " enables auto updates

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Plugins

" vim-trailing-whitespace
call minpac#add('bronson/vim-trailing-whitespace')

" indent object
call minpac#add('michaeljsmith/vim-indent-object')

" replace with register
call minpac#add('vim-scripts/ReplaceWithRegister')

" tasklist
call minpac#add('vim-scripts/TaskList.vim')

" undotree
call minpac#add('mbbill/undotree')

" completion
call minpac#add('ervandew/supertab')
let g:SuperTabDefaultCompletionType = "context"
" CPP
call minpac#add('vim-scripts/OmniCppComplete')
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_DefaultNamespaces = ["std"]

" CMake integration
call minpac#add('vhdirk/vim-cmake')

" LaTeX
call minpac#add('lervag/vimtex')

" Markdown
call minpac#add('plasticboy/vim-markdown')

" Git integration
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')

" tpope
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')

" christoomey
call minpac#add('christoomey/vim-sort-motion')
call minpac#add('christoomey/vim-titlecase')
let g:titlecase_map_keys = 0
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

" tmux integration
call minpac#add('christoomey/vim-tmux-navigator')
let g:tmux_navigator_no_mappings = 1
call minpac#add('christoomey/vim-tmux-runner')
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
nnoremap <leader>tc  :VtrSendCommandToRunner<cr>
nnoremap <leader>tl  :VtrSendLinesToRunner<cr>
vnoremap <leader>tl  :VtrSendLinesToRunner<cr>
nnoremap <leader>to  :VtrOpenRunner<cr>
nnoremap <leader>tk  :VtrKillRunner<cr>
nnoremap <leader>tf  :VtrFocusRunner<cr>
nnoremap <leader>td  :VtrDetachRunner<cr>
nnoremap <leader>ta  :VtrAttachToPane<cr>
nnoremap <leader>tcl :VtrClearRunner<cr>
nnoremap <leader>tfl :VtrFlushCommand<cr>
nnoremap <leader>tro :VtrReorientRunner<cr>

" distraction free
call minpac#add('junegunn/goyo.vim')
let g:goyo_width = "90%"
let g:goyo_height = "90%"
nnoremap gy :Goyo<cr>

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

" basic setup
set colorcolumn=81
set complete+=kspell
set completeopt-=preview
set cursorline
set hidden
set ignorecase
set nowrap
set number
set relativenumber
set scrolloff=2
set showmatch
set sidescrolloff=5
set signcolumn=yes
set updatetime=100
cabbrev h vert h
cabbrev Man vert Man

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" some functions/mappings
nnoremap <leader>so :source %<cr>
nnoremap <leader>ut :UndotreeToggle<cr>
nnoremap <leader>n :noh<cr>

function! FixLastSpellingError()
        normal! mm[s1z=`m"
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>
nnoremap <leader>sl :setlocal spelllang=

function! ToggleScrollingMode()
        if &scrolloff!=100
                :normal M
                setlocal scrolloff=100
        else
                setlocal scrolloff=2
        endif
endfunction
nnoremap <leader>sc :call ToggleScrollingMode()<cr>
nnoremap <leader>scb :setlocal scb!<cr>

" custom text objects
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

" file editing
set undofile
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" configure mkview
set viewoptions-=options
augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* mkview!
        autocmd BufWinEnter *.* silent! loadview
augroup END

" visual @
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
        echo "@".getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
endfunction

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

" tags
command! MakeTags !ctags -R .

" terminal mappings
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

" file browsing: netrw basics
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
