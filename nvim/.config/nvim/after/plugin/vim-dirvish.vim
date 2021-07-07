call dirvish#add_icon_fn({p -> luaeval("require('nvim-web-devicons').get_icon(vim.fn.fnamemodify('" .. p .. "', ':e')) or ' '")})
let g:dirvish_relative_paths = 1

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
              \ nnoremap <silent><buffer> t ddO<Esc>:let @"=substitute(@", '\n', '', 'g')<CR>:r ! find "<C-R>"" -maxdepth 1 -print0 \| xargs -0 ls -Fd<CR>:silent! keeppatterns %s/\/\//\//g<CR>:silent! keeppatterns %s/[^a-zA-Z0-9\/]$//g<CR>:silent! keeppatterns g/^$/d<CR>:noh<CR>
augroup END
