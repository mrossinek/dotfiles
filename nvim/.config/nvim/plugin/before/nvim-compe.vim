set completeopt=menu,menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 3
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 200
let g:compe.source_timeout = 20
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:false

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.spell = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.nvim_treesitter = v:false
let g:compe.source.neorg = v:true

inoremap <silent><expr> <Tab> compe#complete()
inoremap <silent><expr> <CR>  compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
