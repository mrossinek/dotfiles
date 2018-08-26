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

" tasklist
call minpac#add('vim-scripts/TaskList.vim')

" undotree
call minpac#add('mbbill/undotree')

" completion
call minpac#add('ervandew/supertab')
" CPP
call minpac#add('vim-scripts/OmniCppComplete')

" Git integration
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')

" tpope
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')

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
let mapleader=','
set colorcolumn=80
set complete+=i,kspell
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

" zoom-win like functionality
" mnemonic: window maximize
nnoremap <C-W>m :tabnew %<cr>
" mnemonic: window all
nnoremap <C-W>a :tabclose<cr>

" some functions/mappings
nnoremap <leader>so :source %<cr>
nnoremap <leader>ut :UndotreeToggle<cr>

function! FixLastSpellingError()
        normal! mm[s1z=`m"
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>

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

" file browsing: netrw basics
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
