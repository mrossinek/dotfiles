let g:ledger_bin = 'hledger'
let g:ledger_commodity_sep = ' '
let g:ledger_default_commodity = 'CHF'
let g:ledger_extra_options = '--pedantic --explicit --check-payees'

augroup Ledger
    autocmd!
    autocmd User MyLedger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
    autocmd User MyLedger vnoremap <silent> <Tab> :LedgerAlign<CR>
    autocmd User MyLedger nnoremap <silent> <leader>e :s/CHF/EUR/Ig\|noh<CR>
    autocmd User MyLedger vnoremap <silent> <leader>e :s/CHF/EUR/Ig\|noh<CR>
augroup end
