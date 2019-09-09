" MINPAC {{{
" Install minpac:
" mkdir -p ~/.config/nvim/pack/minpac/opt/
" cd ~/.config/nvim/pack/minpac/opt
" git clone git@github.com:k-takata/minpac.git

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})  " enables auto updates

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" }}}

" PYTHON {{{
" Python support is installed into a virtualenv to allow seemless usage across
" system and other virtualenvs
let g:python_host_prog = '/home/max/Installations/pynvim2/.direnv/python-2.7.16/bin/python'
let g:python3_host_prog = '/home/max/Installations/pynvim3/.direnv/python-3.7.4/bin/python'
" }}}

" PLUGINS {{{

" START {{{

" vifm
call minpac#add('vifm/vifm.vim')
let g:vifm_replace_netrw = 1

" startify
call minpac#add('mhinz/vim-startify')

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
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-vinegar')

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
let g:peekaboo_delay = 500
" markbar: mark preview
call minpac#add('Yilin-Yang/vim-markbar')
let g:markbar_explicitly_remap_mark_mappings = v:true

" undotree
call minpac#add('mbbill/undotree')
nnoremap <leader>ut :UndotreeToggle<cr>

" distraction free
call minpac#add('junegunn/goyo.vim')
let g:goyo_width = '90%'
let g:goyo_height = '90%'
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction
function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction
augroup Goyo
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup end
nnoremap gy :Goyo<cr>

call minpac#add('chrisbra/NrrwRgn')
let g:nrrw_rgn_pad = 10

" linediff
call minpac#add('AndrewRadev/linediff.vim')

" smart search highlighting
call minpac#add('romainl/vim-cool')

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
                        \       'java': ['javac', 'checkstyle'],
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
let g:ale_fixers =      {
                        \       'python': ['autopep8'],
                        \
                        \}
call minpac#add('w0rp/ale')
nnoremap <leader>ad :ALEDetail<cr>
let g:deoplete#enable_at_startup = 1
call minpac#add('Shougo/deoplete.nvim')

" tagbar
call minpac#add('majutsushi/tagbar')
nnoremap <leader>ct :TagbarToggle<cr>
" mnemonic: Ctags Toggle

" CMake integration
call minpac#add('vhdirk/vim-cmake')

" vim-verdict
" call minpac#add('https://gitlab.com/mrossinek/vim-verdict')
" ^ is added locally from source
packadd vim-verdict

" Git integration
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-fugitive')
call minpac#add('shumphrey/fugitive-gitlab.vim')
call minpac#add('junegunn/gv.vim')
augroup git
        autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" TMUX
call minpac#add('tmux-plugins/vim-tmux-focus-events')
call minpac#add('christoomey/vim-tmux-navigator')
let g:tmux_navigator_no_mappings = 1
" call minpac#add('https://gitlab.com/mrossinek/vim-tmux-controller')
" ^ is added locally from source
packadd vim-tmux-controller
nnoremap <S-CR> :VtcSendLines<cr><CR>
" call minpac#add('https://gitlab.com/mrossinek/displayp.vim')
" ^ is added locally from source
call minpac#add('wellle/tmux-complete.vim')

" DESIGN
if $USER ==# 'root'
    let s:THEME='dark'
else
    let s:THEME=$THEME
endif
" colorscheme
call minpac#add('NLKNguyen/papercolor-theme')
let &background=s:THEME
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

" airline
call minpac#add('vim-airline/vim-airline')
let g:airline_theme=s:THEME
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    if g:airline_theme ==? 'dark'
        for colors in values(a:palette.normal)
            " replace all colors using 234 with 236
            if colors[3] == 234
                let colors[1] = '#303030'
                let colors[3] = 236
            endif
        endfor
        for colors in values(a:palette.commandline)
            " replace all colors using 234 with 236
            if colors[3] == 234
                let colors[1] = '#303030'
                let colors[3] = 236
            endif
        endfor
        for colors in values(a:palette.inactive)
            " shift inactive colors by one in order to avoid clash with 236
            if !exists('s:shifted_inactive')
                let colors[3] = colors[3] - 1
            endif
        endfor
        let s:shifted_inactive = 1
    endif
endfunction
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols_ascii = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_symbols.dirty = '+'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' ln'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

" ANSI color support
call minpac#add('powerman/vim-plugin-AnsiEsc')

" Colorizer
call minpac#add('chrisbra/Colorizer')

" }}}

" OPT {{{

" ledger
call minpac#add('ledger/vim-ledger', {'type': 'opt'})
let g:ledger_bin = 'hledger'
let g:ledger_commodity_sep = ' '
let g:ledger_default_commodity = 'CHF'
let g:ledger_extra_options = '--pedantic --explicit --check-payees'
augroup Ledger
        autocmd User MyLedger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
        autocmd User MyLedger vnoremap <silent> <Tab> :LedgerAlign<CR>
        autocmd User MyLedger nnoremap <silent> <leader>e :s/CHF/EUR/Ig\|noh<CR>
        autocmd User MyLedger vnoremap <silent> <leader>e :s/CHF/EUR/Ig\|noh<CR>
augroup end

" C++
call minpac#add('deoplete-plugins/deoplete-clang', {'type': 'opt'})

" Haskell
call minpac#add('eagletmt/neco-ghc', {'type': 'opt'})

" Python
call minpac#add('deoplete-plugins/deoplete-jedi', {'type': 'opt'})
call minpac#add('fs111/pydoc.vim', {'type': 'opt'})
call minpac#add('tmhedberg/SimpylFold', {'type': 'opt'})
let g:SimpylFold_docstring_preview = 1

" LaTeX
call minpac#add('lervag/vimtex', {'type': 'opt'})

" Markdown
call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})

" Vim
call minpac#add('Shougo/neco-vim', {'type': 'opt'})

" Wiki
call minpac#add('vimwiki/vimwiki', {'type': 'opt'})
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_list = [{'path': '~/Files/Notes/', 'index': 'Index',
                        \ 'ext': '.md'}]
call minpac#add('tbabej/taskwiki', {'type': 'opt'})
let g:taskwiki_maplocalleader = ',t'
let g:taskwiki_extra_warriors = {'B': {
                        \ 'data_location': '~/.bugs/data',
                        \ 'taskrc_location': '~/.config/bugwarrior/taskrc'
                        \ }}

" grammer checker: languagetool
call minpac#add('rhysd/vim-grammarous')
let g:grammarous#languagetool_cmd = 'languagetool'
augroup Grammarous
    autocmd User MyGrammarous nmap <leader>gg :GrammarousCheck<CR>
    autocmd User MyGrammarous nmap <leader>gf <Plug>(grammarous-fixit)
    autocmd User MyGrammarous nmap <leader>gr <Plug>(grammarous-remove-error)
    autocmd User MyGrammarous nmap <leader>gd <Plug>(grammarous-disable-rule)
    autocmd User MyGrammarous nmap <leader>gn <Plug>(grammarous-move-to-next-error)
    autocmd User MyGrammarous nmap <leader>gp <Plug>(grammarous-move-to-previous-error)
augroup end

" Zeal
call minpac#add('KabbAmine/zeavim.vim')

" OPT Loading
augroup PackOptLoad
        autocmd!
        autocmd FileType ledger packadd vim-ledger
        autocmd FileType ledger doautocmd User MyLedger
        autocmd FileType c packadd deoplete-clang
        autocmd FileType cpp packadd deoplete-clang
        autocmd FileType cs packadd Omnisharp-vim
        autocmd FileType haskell packadd neco-ghc
        autocmd FileType python packadd deoplete-jedi
        autocmd FileType python packadd pydoc.vim
        autocmd FileType python packadd SimpylFold
        autocmd FileType tex packadd vimtex
        autocmd FileType markdown packadd vim-markdown
        autocmd FileType text packadd vim-grammarous
        autocmd FileType text doautocmd User MyGrammarous
        autocmd FileType vim packadd neco-vim
augroup end

" }}}

" }}}

" BASICS {{{
set colorcolumn=81
set complete+=kspell
set completeopt-=preview
set cursorline
set hidden
set ignorecase
set smartcase
set nowrap
set number
set relativenumber
set scrolloff=2
set shiftwidth=4
set showmatch
set sidescrolloff=5
set signcolumn=yes
set spelllang=en_us
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

" }}}

" ABBREVIATIONS {{{
cabbrev h vert help
cabbrev M vert Man

" }}}

" NAVIGATION {{{
nnoremap <C-E> 2<C-E>
nnoremap <C-Y> 2<C-Y>

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

" }}}

" FUNCTIONS {{{

function! FixLastSpellingError()
        normal! mm[s1z=`m"
endfunction

function! ToggleScrollingMode()
        if &scrolloff!=100
                :normal! M
                EnableNonCountedBasicMotions
                setlocal scrolloff=100
        else
                DisableNonCountedBasicMotions
                setlocal scrolloff=2
        endif
endfunction

function! ExecuteMacroOverVisualRange()
        echo '@'.getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! ToggleBackground()
    execute('silent! !source ~/.background_toggle')
    call ThemeChecker()
endfunction

function! ThemeChecker()
    if exists('$TMUX')
        let s:THEME = substitute(split(execute('!tmux showenv THEME'), '=')[1], '\n', '', '')
    else
        let s:THEME=$THEME
    endif
    let &background=s:THEME
    execute('AirlineTheme ' . s:THEME)
endfunction
nnoremap <leader>b :call ThemeChecker()<cr>

augroup colortheme
    autocmd ColorScheme * hi clear SignColumn
    autocmd VimEnter * nnoremap yob :call ToggleBackground()<cr>
augroup end
" }}}

" COMMANDS {{{
command! MakeTags !ctags -R .

" }}}

" MAPPINGS {{{
" additional function keys
map <F13> <S-CR>
map <F14> <C-CR>

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

" simpler editing
nnoremap <leader>ew :e <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>es :sp <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>ev :vsp <C-R>=expand("%:p:h")."/"<CR>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h")."/"<CR>

" visual @
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" swap some commands
" visual block mode is more useful than plain visual mode
nnoremap v <C-v>
nnoremap <C-v> v
vnoremap v <C-v>
vnoremap <C-v> v

" }}}

" TEXT OBJECTS {{{

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

" }}}

" SESSIONS {{{
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

" }}}

" TERMINAL {{{
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

" }}}

" NETRW {{{
" let g:netrw_altv=1
" let g:netrw_banner=0
" let g:netrw_browse_split=4
" let g:netrw_liststyle=3

" }}}

" Disable non counted basic motions {{{
" https://gist.github.com/jeetsukumaran/96474ebbd00b874f0865
"
" Notes:
"   (1) To enhance the ergonomics of this sufficiently to make it practical, at
"       least, until your brain grows a new lobe dedicated to counting line offsets
"       in the background while you work, you should either make sure you have
"       something like the following in your `~/.vimrc`:
"
"           set number
"           if has('autocmd')
"           augroup vimrc_linenumbering
"               autocmd!
"               autocmd WinLeave *
"                           \ if &number |
"                           \   set norelativenumber |
"                           \ endif
"               autocmd BufWinEnter *
"                           \ if &number |
"                           \   set relativenumber |
"                           \ endif
"               autocmd VimEnter *
"                           \ if &number |
"                           \   set relativenumber |
"                           \ endif
"           augroup END
"           endif
"
"       or you have installed a plugin like
"       (vim-numbers)[https://github.com/myusuf3/numbers.vim].
"
"   (2) You might want to relax the constraint for horizontal motions, or
"       add other motions. You can customize the list of motions by
"       specifying the keys in the
"       `g:keys_to_disable_if_not_preceded_by_count` variable. For example,
"       the following only enforces count-prefixed motions for "j" and "k":
"
"         let g:keys_to_disable_if_not_preceded_by_count = ["j", "k"]

function! DisableIfNonCounted(move) range
    if v:count
        return a:move
    else
        " You can make this do something annoying like:
           " echoerr "Count required!"
           " sleep 2
        return ""
    endif
endfunction

function! SetDisablingOfBasicMotionsIfNonCounted(on)
    let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k", "l", "h"])
    if a:on
        for key in keys_to_disable
            execute "noremap <expr> <silent> " . key . " DisableIfNonCounted('" . key . "')"
        endfor
        let g:keys_to_disable_if_not_preceded_by_count = keys_to_disable
        let g:is_non_counted_basic_motions_disabled = 1
    else
        for key in keys_to_disable
            try
                execute "unmap " . key
            catch /E31:/
            endtry
        endfor
        let g:is_non_counted_basic_motions_disabled = 0
    endif
endfunction

function! ToggleDisablingOfBasicMotionsIfNonCounted()
    let is_disabled = get(g:, "is_non_counted_basic_motions_disabled", 0)
    if is_disabled
        call SetDisablingOfBasicMotionsIfNonCounted(0)
    else
        call SetDisablingOfBasicMotionsIfNonCounted(1)
    endif
endfunction

command! ToggleDisablingOfNonCountedBasicMotions :call ToggleDisablingOfBasicMotionsIfNonCounted()
command! DisableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(1)
command! EnableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(0)

DisableNonCountedBasicMotions
" }}}
