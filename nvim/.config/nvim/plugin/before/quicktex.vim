let g:quicktex_tex = {
    \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'m'   : '\( <+++> \) <++>',
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
\}

let g:quicktex_math = {
    \' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'fr'   : '\mathcal{R} ',
    \'eq'   : '= ',
    \'set'  : '\{ <+++> \} <++>',
    \'frac' : '\frac{<+++>}{<++>} <++>',
    \'one'  : '1 ',
    \'st'   : ': ',
    \'in'   : '\in ',
    \'bn'   : '\mathbb{N} ',
\}
