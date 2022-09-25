nnoremap <silent><expr> <LocalLeader>r  nvim_exec('MagmaEvaluateOperator', v:true)
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>
nnoremap <silent>       <LocalLeader>rq :noautocmd MagmaEnterOutput<CR>

let g:magma_automatically_open_output = v:false
