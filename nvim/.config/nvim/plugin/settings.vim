scriptencoding utf-8

set autoindent
set colorcolumn=+0
set complete+=kspell
set completeopt-=preview
set cursorline
set expandtab
set foldcolumn=1
set foldlevel=99
set foldmethod=indent
set formatoptions+=2,n
set hidden
set ignorecase
set inccommand=nosplit
set laststatus=3
set list
set listchars=nbsp:⦸
set listchars+=tab:▷┅
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•
set mouse=a
set number
set path+=**                           " fuzzy finding
set pumblend=10
set relativenumber
set scrolloff=2
set shiftwidth=4
set showbreak=↪\ 
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smartcase
set spelllang=en_us
set switchbuf=usetab
set termguicolors
set textwidth=80
set undofile
set updatetime=100
set viewoptions-=curdir
set viewoptions-=options
set virtualedit=block
set wildmenu                           " fuzzy finding
set nowrap

" don't make backups before writing
set nobackup
" don't keep backups after writing
set nowritebackup
" But in case backups ever get turned on...
set backupdir=~/.config/nvim/backup//
set backupdir+=.
