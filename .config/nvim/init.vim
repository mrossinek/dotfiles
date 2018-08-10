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
call minpac#add('vim-scripts/TaskList.vim')

" auto completion
call minpac#add('ncm2/ncm2')
call minpac#add('roxma/nvim-yarp')

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

" basic setup
set colorcolumn=80
set cursorline
set hidden
set ignorecase
set nowrap
set number
set scrolloff=2
set sidescrolloff=5
set showmatch
set signcolumn=yes
set updatetime=100

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
