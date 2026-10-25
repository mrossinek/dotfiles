" nvim-treesitter's main branch dropped its Vimscript functions, but neorg still
" calls this one to indent code blocks
function! nvim_treesitter#indent() abort
    return luaeval("require'nvim-treesitter'.indentexpr()")
endfunction
