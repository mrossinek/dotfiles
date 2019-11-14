" Original Theme: PaperColor
" Original Author: Nikyle Nguyen <NLKNguyen@MSN.com>
" License: MIT
" Source: http://github.com/NLKNguyen/papercolor-theme

hi clear
syntax reset

" define colors
let color00 = '236'  " #303030
let color01 = '125'  " #af005f
let color02 = '70'  " #5faf00
let color03 = '179'  " #d7af5f
let color04 = '74'  " #5fafd7
let color05 = '244'  " #808080
let color06 = '173'  " #d7875f
let color07 = '252'  " #d0d0d0
let color08 = '240'  " #585858
let color09 = '71'  " #5faf5f
let color10 = '148'  " #afd700
let color11 = '140'  " #af87d7
let color12 = '214'  " #ffaf00
let color13 = '205'  " #ff5faf
let color14 = '37'  " #00afaf
let color15 = '66'  " #5f8787
let color16 = '74'  " #5fafd7
let color17 = '178'  " #d7af00
let cursor_fg = '236'  " #303030
let cursor_bg = '251'  " #c6c6c6
let cursorline = '238'  " #444444
let cursorcolumn = '238'  " #444444
let cursorlinenr_fg = '226'  " #ffff00
let cursorlinenr_bg = '236'  " #303030
let popupmenu_fg = '251'  " #c6c6c6
let popupmenu_bg = '238'  " #444444
let search_fg = '190'  " #d7ff00
let search_bg = '236'  " #303030
let linenumber_fg = '240'  " #585858
let linenumber_bg = '236'  " #303030
let vertsplit_fg = '66'  " #5f8787
let vertsplit_bg = '236'  " #303030
let statusline_active_fg = '236'  " #303030
let statusline_active_bg = '66'  " #5f8787
let statusline_inactive_fg = '250'  " #bcbcbc
let statusline_inactive_bg = '237'  " #3a3a3a
let todo_fg = '208'  " #ff8700
let todo_bg = '236'  " #303030
let error_fg = '125'  " #af005f
let error_bg = '52'  " #5f0000
let matchparen_bg = '239'  " #4e4e4e
let matchparen_fg = '251'  " #c6c6c6
let visual_fg = '16'  " #000000
let visual_bg = '103'  " #8787af
let folded_fg = '177'  " #d787ff
let folded_bg = '53'  " #5f005f
let wildmenu_fg = '236'  " #303030
let wildmenu_bg = '148'  " #afd700
let spellbad = '52'  " #5f0000
let spellcap = '53'  " #5f005f
let spellrare = '22'  " #005f00
let spelllocal = '17'  " #00005f
let diffadd_fg = '112'  " #87d700
let diffadd_bg = '22'  " #005f00
let diffdelete_fg = '125'  " #af005f
let diffdelete_bg = '52'  " #5f0000
let difftext_fg = '87'  " #5fffff
let difftext_bg = '30'  " #008787
let diffchange_fg = '252'  " #d0d0d0
let diffchange_bg = '23'  " #005f5f
let tabline_bg = '236'  " #303030
let tabline_active_fg = '233'  " #121212
let tabline_active_bg = '37'  " #00afaf
let tabline_inactive_fg = '250'  " #bcbcbc
let tabline_inactive_bg = '240'  " #585858
let buftabline_bg = '236'  " #303030
let buftabline_current_fg = '233'  " #121212
let buftabline_current_bg = '37'  " #00afaf
let buftabline_active_fg = '37'  " #00afaf
let buftabline_active_bg = '240'  " #585858
let buftabline_inactive_fg = '250'  " #bcbcbc
let buftabline_inactive_bg = '240'  " #585858

" format attributes
let s:ft_bold    = ' cterm=bold gui=bold '
let s:ft_none    = ' cterm=none gui=none '
let s:ft_reverse = ' cterm=reverse gui=reverse '
let s:ft_italic  = ' cterm=italic gui=italic '
let s:ft_italic_bold = ' cterm=italic,bold gui=italic,bold '

" define derived colors
" BASIC COLORS:
let s:fg_background = ' ctermfg=' . color00 . ' '
let s:bg_background = ' ctermbg=' . color00 . ' '
let s:fg_negative = ' ctermfg=' . color01 . ' '
let s:bg_negative = ' ctermbg=' . color01 . ' '
let s:fg_positive = ' ctermfg=' . color02 . ' '
let s:bg_positive = ' ctermbg=' . color02 . ' '
let s:fg_olive = ' ctermfg=' . color03 . ' '
let s:bg_olive = ' ctermbg=' . color03 . ' '
let s:fg_neutral = ' ctermfg=' . color04 . ' '
let s:bg_neutral = ' ctermbg=' . color04 . ' '
let s:fg_comment = ' ctermfg=' . color05 . ' '
let s:bg_comment = ' ctermbg=' . color05 . ' '
let s:fg_navy = ' ctermfg=' . color06 . ' '
let s:bg_navy = ' ctermbg=' . color06 . ' '
let s:fg_foreground = ' ctermfg=' . color07 . ' '
let s:bg_foreground = ' ctermbg=' . color07 . ' '
let s:fg_nontext = ' ctermfg=' . color08 . ' '
let s:bg_nontext = ' ctermbg=' . color08 . ' '
let s:fg_red = ' ctermfg=' . color09 . ' '
let s:bg_red = ' ctermbg=' . color09 . ' '
let s:fg_pink = ' ctermfg=' . color10 . ' '
let s:bg_pink = ' ctermbg=' . color10 . ' '
let s:fg_purple = ' ctermfg=' . color11 . ' '
let s:bg_purple = ' ctermbg=' . color11 . ' '
let s:fg_accent = ' ctermfg=' . color12 . ' '
let s:bg_accent = ' ctermbg=' . color12 . ' '
let s:fg_orange = ' ctermfg=' . color13 . ' '
let s:bg_orange = ' ctermbg=' . color13 . ' '
let s:fg_blue = ' ctermfg=' . color14 . ' '
let s:bg_blue = ' ctermbg=' . color14 . ' '
let s:fg_highlight = ' ctermfg=' . color15 . ' '
let s:bg_highlight = ' ctermbg=' . color15 . ' '
let s:fg_transparent = ' ctermfg=' . color00 . ' '
let s:bg_transparent = ' ctermbg=' . color00 . ' '
" EXTENDED COLORS:
let s:fg_aqua = ' ctermfg=' . color16 . ' '
let s:bg_aqua = ' ctermbg=' . color16 . ' '
let s:fg_green = ' ctermfg=' . color17 . ' '
let s:bg_green = ' ctermbg=' . color17 . ' '
let s:fg_wine = ' ctermfg=' . color11 . ' '
let s:bg_wine = ' ctermbg=' . color11 . ' '
" Terminal:
let g:terminal_color_0  = color00[0]
let g:terminal_color_1  = color01[0]
let g:terminal_color_2  = color02[0]
let g:terminal_color_3  = color03[0]
let g:terminal_color_4  = color04[0]
let g:terminal_color_5  = color05[0]
let g:terminal_color_6  = color06[0]
let g:terminal_color_7  = color07[0]
let g:terminal_color_8  = color08[0]
let g:terminal_color_9  = color09[0]
let g:terminal_color_10 = color10[0]
let g:terminal_color_11 = color11[0]
let g:terminal_color_12 = color12[0]
let g:terminal_color_13 = color13[0]
let g:terminal_color_14 = color14[0]
let g:terminal_color_15 = color15[0]
let g:terminal_ansi_colors = [color00[0], color01[0], color02[0], color03[0],
            \ color04[0], color05[0], color06[0], color07[0], color08[0], color09[0],
            \ color10[0], color11[0], color12[0], color13[0], color14[0], color15[0]]
" LineNumber:
let s:fg_linenumber_fg = ' ctermfg=' . linenumber_fg . ' '
let s:bg_linenumber_fg = ' ctermbg=' . linenumber_fg . ' '
let s:fg_linenumber_bg = ' ctermfg=' . linenumber_bg . ' '
let s:bg_linenumber_bg = ' ctermbg=' . linenumber_bg . ' '
" Vertical Split:
let s:fg_vertsplit_fg = ' ctermfg=' . vertsplit_fg . ' '
let s:bg_vertsplit_fg = ' ctermbg=' . vertsplit_fg . ' '
let s:fg_vertsplit_bg = ' ctermfg=' . vertsplit_bg . ' '
let s:bg_vertsplit_bg = ' ctermbg=' . vertsplit_bg . ' '
" Statusline:
let s:fg_statusline_active_fg = ' ctermfg=' . statusline_active_fg . ' '
let s:bg_statusline_active_fg = ' ctermbg=' . statusline_active_fg . ' '
let s:fg_statusline_active_bg = ' ctermfg=' . statusline_active_bg . ' '
let s:bg_statusline_active_bg = ' ctermbg=' . statusline_active_bg . ' '
let s:fg_statusline_inactive_fg = ' ctermfg=' . statusline_inactive_fg . ' '
let s:bg_statusline_inactive_fg = ' ctermbg=' . statusline_inactive_fg . ' '
let s:fg_statusline_inactive_bg = ' ctermfg=' . statusline_inactive_bg . ' '
let s:bg_statusline_inactive_bg = ' ctermbg=' . statusline_inactive_bg . ' '
" Cursor:
let s:fg_cursor_fg = ' ctermfg=' . cursor_fg . ' '
let s:bg_cursor_fg = ' ctermbg=' . cursor_fg . ' '
let s:fg_cursor_bg = ' ctermfg=' . cursor_bg . ' '
let s:bg_cursor_bg = ' ctermbg=' . cursor_bg . ' '
let s:fg_cursorline = ' ctermfg=' . cursorline . ' '
let s:bg_cursorline = ' ctermbg=' . cursorline . ' '
" CursorColumn:
let s:fg_cursorcolumn = ' ctermfg=' . cursorcolumn . ' '
let s:bg_cursorcolumn = ' ctermbg=' . cursorcolumn . ' '
" CursorLine Number:
let s:fg_cursorlinenr_fg = ' ctermfg=' . cursorlinenr_fg . ' '
let s:bg_cursorlinenr_fg = ' ctermbg=' . cursorlinenr_fg . ' '
let s:fg_cursorlinenr_bg = ' ctermfg=' . cursorlinenr_bg . ' '
let s:bg_cursorlinenr_bg = ' ctermbg=' . cursorlinenr_bg . ' '
" Popup Menu:
let s:fg_popupmenu_fg = ' ctermfg=' . popupmenu_fg . ' '
let s:bg_popupmenu_fg = ' ctermbg=' . popupmenu_fg . ' '
let s:fg_popupmenu_bg = ' ctermfg=' . popupmenu_bg . ' '
let s:bg_popupmenu_bg = ' ctermbg=' . popupmenu_bg . ' '
" Search:
let s:fg_search_fg = ' ctermfg=' . search_fg . ' '
let s:bg_search_fg = ' ctermbg=' . search_fg . ' '
let s:fg_search_bg = ' ctermfg=' . search_bg . ' '
let s:bg_search_bg = ' ctermbg=' . search_bg . ' '
" Todo:
let s:fg_todo_fg = ' ctermfg=' . todo_fg . ' '
let s:bg_todo_fg = ' ctermbg=' . todo_fg . ' '
let s:fg_todo_bg = ' ctermfg=' . todo_bg . ' '
let s:bg_todo_bg = ' ctermbg=' . todo_bg . ' '
" Error:
let s:fg_error_fg = ' ctermfg=' . error_fg . ' '
let s:bg_error_fg = ' ctermbg=' . error_fg . ' '
let s:fg_error_bg = ' ctermfg=' . error_bg . ' '
let s:bg_error_bg = ' ctermbg=' . error_bg . ' '
" Match Parenthesis:
let s:fg_matchparen_fg = ' ctermfg=' . matchparen_fg . ' '
let s:bg_matchparen_fg = ' ctermbg=' . matchparen_fg . ' '
let s:fg_matchparen_bg = ' ctermfg=' . matchparen_bg . ' '
let s:bg_matchparen_bg = ' ctermbg=' . matchparen_bg . ' '
" Visual:
let s:fg_visual_fg = ' ctermfg=' . visual_fg . ' '
let s:bg_visual_fg = ' ctermbg=' . visual_fg . ' '
let s:fg_visual_bg = ' ctermfg=' . visual_bg . ' '
let s:bg_visual_bg = ' ctermbg=' . visual_bg . ' '
" Folded:
let s:fg_folded_fg = ' ctermfg=' . folded_fg . ' '
let s:bg_folded_fg = ' ctermbg=' . folded_fg . ' '
let s:fg_folded_bg = ' ctermfg=' . folded_bg . ' '
let s:bg_folded_bg = ' ctermbg=' . folded_bg . ' '
" WildMenu:
let s:fg_wildmenu_fg = ' ctermfg=' . wildmenu_fg . ' '
let s:bg_wildmenu_fg = ' ctermbg=' . wildmenu_fg . ' '
let s:fg_wildmenu_bg = ' ctermfg=' . wildmenu_bg . ' '
let s:bg_wildmenu_bg = ' ctermbg=' . wildmenu_bg . ' '
" Spelling:
let s:fg_spellbad = ' ctermfg=' . spellbad . ' '
let s:bg_spellbad = ' ctermbg=' . spellbad . ' '
let s:fg_spellcap = ' ctermfg=' . spellcap . ' '
let s:bg_spellcap = ' ctermbg=' . spellcap . ' '
let s:fg_spellrare = ' ctermfg=' . spellrare . ' '
let s:bg_spellrare = ' ctermbg=' . spellrare . ' '
let s:fg_spelllocal = ' ctermfg=' . spelllocal . ' '
let s:bg_spelllocal = ' ctermbg=' . spelllocal . ' '
" Diff:
let s:fg_diffadd_fg = ' ctermfg=' . diffadd_fg . ' '
let s:bg_diffadd_fg = ' ctermbg=' . diffadd_fg . ' '
let s:fg_diffadd_bg = ' ctermfg=' . diffadd_bg . ' '
let s:bg_diffadd_bg = ' ctermbg=' . diffadd_bg . ' '
let s:fg_diffdelete_fg = ' ctermfg=' . diffdelete_fg . ' '
let s:bg_diffdelete_fg = ' ctermbg=' . diffdelete_fg . ' '
let s:fg_diffdelete_bg = ' ctermfg=' . diffdelete_bg . ' '
let s:bg_diffdelete_bg = ' ctermbg=' . diffdelete_bg . ' '
let s:fg_difftext_fg = ' ctermfg=' . difftext_fg . ' '
let s:bg_difftext_fg = ' ctermbg=' . difftext_fg . ' '
let s:fg_difftext_bg = ' ctermfg=' . difftext_bg . ' '
let s:bg_difftext_bg = ' ctermbg=' . difftext_bg . ' '
let s:fg_diffchange_fg = ' ctermfg=' . diffchange_fg . ' '
let s:bg_diffchange_fg = ' ctermbg=' . diffchange_fg . ' '
let s:fg_diffchange_bg = ' ctermfg=' . diffchange_bg . ' '
let s:bg_diffchange_bg = ' ctermbg=' . diffchange_bg . ' '
" Tabline:
let s:fg_tabline_bg = ' ctermfg=' . tabline_bg . ' '
let s:bg_tabline_bg = ' ctermbg=' . tabline_bg . ' '
let s:fg_tabline_active_fg = ' ctermfg=' . tabline_active_fg . ' '
let s:bg_tabline_active_fg = ' ctermbg=' . tabline_active_fg . ' '
let s:fg_tabline_active_bg = ' ctermfg=' . tabline_active_bg . ' '
let s:bg_tabline_active_bg = ' ctermbg=' . tabline_active_bg . ' '
let s:fg_tabline_inactive_fg = ' ctermfg=' . tabline_inactive_fg . ' '
let s:bg_tabline_inactive_fg = ' ctermbg=' . tabline_inactive_fg . ' '
let s:fg_tabline_inactive_bg = ' ctermfg=' . tabline_inactive_bg . ' '
let s:bg_tabline_inactive_bg = ' ctermbg=' . tabline_inactive_bg . ' '
" Plugin: BufTabLine
let s:fg_buftabline_bg = ' ctermfg=' . buftabline_bg . ' '
let s:bg_buftabline_bg = ' ctermbg=' . buftabline_bg . ' '
let s:fg_buftabline_current_fg = ' ctermfg=' . buftabline_current_fg . ' '
let s:bg_buftabline_current_fg = ' ctermbg=' . buftabline_current_fg . ' '
let s:fg_buftabline_current_bg = ' ctermfg=' . buftabline_current_bg . ' '
let s:bg_buftabline_current_bg = ' ctermbg=' . buftabline_current_bg . ' '
let s:fg_buftabline_active_fg = ' ctermfg=' . buftabline_active_fg . ' '
let s:bg_buftabline_active_fg = ' ctermbg=' . buftabline_active_fg . ' '
let s:fg_buftabline_active_bg = ' ctermfg=' . buftabline_active_bg . ' '
let s:bg_buftabline_active_bg = ' ctermbg=' . buftabline_active_bg . ' '
let s:fg_buftabline_inactive_fg = ' ctermfg=' . buftabline_inactive_fg . ' '
let s:bg_buftabline_inactive_fg = ' ctermbg=' . buftabline_inactive_fg . ' '
let s:fg_buftabline_inactive_bg = ' ctermfg=' . buftabline_inactive_bg . ' '
let s:bg_buftabline_inactive_bg = ' ctermbg=' . buftabline_inactive_bg . ' '

" Syntax Highlighting
exec 'hi Normal' . s:fg_foreground
exec 'hi NonText' . s:fg_nontext
exec 'hi LineNr' . s:fg_linenumber_fg
exec 'hi Conceal' . s:fg_linenumber_fg
exec 'hi VertSplit' . s:fg_vertsplit_fg . s:ft_none
exec 'hi FoldColumn' . s:fg_folded_fg . s:bg_transparent . s:ft_none
exec 'hi Cursor' . s:fg_cursor_fg . s:bg_cursor_bg
exec 'hi SpecialKey' . s:fg_nontext
exec 'hi Search' . ' cterm=underline ' . s:fg_search_fg . s:bg_search_bg
exec 'hi StatusLine' . s:fg_statusline_active_bg . s:bg_statusline_active_fg
exec 'hi StatusLineNC' . s:fg_statusline_inactive_bg . s:bg_statusline_inactive_fg
exec 'hi StatusLineTerm' . s:fg_statusline_active_bg . s:bg_statusline_active_fg
exec 'hi StatusLineTermNC' . s:fg_statusline_inactive_bg . s:bg_statusline_inactive_fg
exec 'hi Visual' . s:fg_visual_fg . s:bg_visual_bg
exec 'hi Directory' . s:fg_blue
exec 'hi ModeMsg' . s:fg_olive
exec 'hi MoreMsg' . s:fg_olive
exec 'hi Question' . s:fg_olive
exec 'hi WarningMsg' . s:fg_pink
exec 'hi MatchParen' . s:fg_matchparen_fg . s:bg_matchparen_bg
exec 'hi Folded' . s:fg_folded_fg . s:bg_folded_bg
exec 'hi WildMenu' . s:fg_wildmenu_fg . s:bg_wildmenu_bg . s:ft_bold
exec 'hi CursorLine'  . s:bg_cursorline . s:ft_none
exec 'hi CursorLineNr' . s:fg_cursorlinenr_fg . s:bg_cursorlinenr_bg . s:ft_none
exec 'hi CursorColumn'  . s:bg_cursorcolumn . s:ft_none
exec 'hi PMenu' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_none
exec 'hi PMenuSel' . s:fg_popupmenu_fg . s:bg_popupmenu_bg . s:ft_reverse
" disabled to ensure transparency
" exec 'hi SignColumn' . s:fg_green . s:ft_none
exec 'hi ColorColumn'  . s:bg_cursorcolumn . s:ft_none
" Tabline
exec 'hi TabLine' . s:fg_tabline_inactive_fg . s:bg_tabline_inactive_bg . s:ft_none
exec 'hi TabLineFill' . s:fg_tabline_bg . s:bg_tabline_bg . s:ft_none
exec 'hi TabLineSel' . s:fg_tabline_active_fg . s:bg_tabline_active_bg . s:ft_none
" BufTabLine
exec 'hi BufTabLineCurrent' . s:fg_buftabline_current_fg . s:bg_buftabline_current_bg . s:ft_none
exec 'hi BufTabLineActive' . s:fg_buftabline_active_fg . s:bg_buftabline_active_bg . s:ft_none
exec 'hi BufTabLineHidden' . s:fg_buftabline_inactive_fg . s:bg_buftabline_inactive_bg . s:ft_none
exec 'hi BufTabLineFill'  . s:bg_buftabline_bg . s:ft_none
" Standard Group Highlighting:
exec 'hi Comment' . s:fg_comment . s:ft_italic
exec 'hi Constant' . s:fg_orange
exec 'hi String' . s:fg_olive
exec 'hi Character' . s:fg_olive
exec 'hi Number' . s:fg_orange
exec 'hi Boolean' . s:fg_green . s:ft_bold
exec 'hi Float' . s:fg_orange
exec 'hi Identifier' . s:fg_navy
exec 'hi Function' . s:fg_foreground
exec 'hi Statement' . s:fg_pink . s:ft_none
exec 'hi Conditional' . s:fg_purple . s:ft_bold
exec 'hi Repeat' . s:fg_purple . s:ft_bold
exec 'hi Label' . s:fg_blue
exec 'hi Operator' . s:fg_aqua . s:ft_none
exec 'hi Keyword' . s:fg_blue
exec 'hi Exception' . s:fg_red
exec 'hi PreProc' . s:fg_blue
exec 'hi Include' . s:fg_red
exec 'hi Define' . s:fg_blue
exec 'hi Macro' . s:fg_blue
exec 'hi PreCondit' . s:fg_aqua
exec 'hi Type' . s:fg_pink . s:ft_bold
exec 'hi StorageClass' . s:fg_navy . s:ft_bold
exec 'hi Structure' . s:fg_blue . s:ft_bold
exec 'hi Typedef' . s:fg_pink . s:ft_bold
exec 'hi Special' . s:fg_foreground
exec 'hi SpecialChar' . s:fg_foreground
exec 'hi Tag' . s:fg_green
exec 'hi Delimiter' . s:fg_aqua
exec 'hi SpecialComment' . s:fg_comment . s:ft_bold
exec 'hi Debug' . s:fg_orange
exec 'hi Error' . s:fg_error_fg . s:bg_error_bg
exec 'hi Todo' . s:fg_todo_fg . s:bg_todo_bg . s:ft_bold
exec 'hi Title' . s:fg_comment
exec 'hi Global' . s:fg_blue
" Extensions:
" VimL Highlighting
exec 'hi vimCommand' . s:fg_pink
exec 'hi vimVar' . s:fg_navy
exec 'hi vimFuncKey' . s:fg_pink
exec 'hi vimFunction' . s:fg_blue . s:ft_bold
exec 'hi vimNotFunc' . s:fg_pink
exec 'hi vimMap' . s:fg_red
exec 'hi vimAutoEvent' . s:fg_aqua . s:ft_bold
exec 'hi vimMapModKey' . s:fg_aqua
exec 'hi vimFuncName' . s:fg_purple
exec 'hi vimIsCommand' . s:fg_foreground
exec 'hi vimFuncVar' . s:fg_aqua
exec 'hi vimLet' . s:fg_red
exec 'hi vimContinue' . s:fg_aqua
exec 'hi vimMapRhsExtend' . s:fg_foreground
exec 'hi vimCommentTitle' . s:fg_comment . s:ft_italic_bold
exec 'hi vimBracket' . s:fg_aqua
exec 'hi vimParenSep' . s:fg_aqua
exec 'hi vimNotation' . s:fg_aqua
exec 'hi vimOper' . s:fg_foreground
exec 'hi vimOperParen' . s:fg_foreground
exec 'hi vimSynType' . s:fg_purple
exec 'hi vimSynReg' . s:fg_pink . s:ft_none
exec 'hi vimSynRegion' . s:fg_foreground
exec 'hi vimSynMtchGrp' . s:fg_pink
exec 'hi vimSynNextgroup' . s:fg_pink
exec 'hi vimSynKeyRegion' . s:fg_green
exec 'hi vimSynRegOpt' . s:fg_blue
exec 'hi vimSynMtchOpt' . s:fg_blue
exec 'hi vimSynContains' . s:fg_pink
exec 'hi vimGroupName' . s:fg_foreground
exec 'hi vimGroupList' . s:fg_foreground
exec 'hi vimHiGroup' . s:fg_foreground
exec 'hi vimGroup' . s:fg_navy . s:ft_bold
exec 'hi vimOnlyOption' . s:fg_blue
" Makefile Highlighting
exec 'hi makeIdent' . s:fg_blue
exec 'hi makeSpecTarget' . s:fg_olive
exec 'hi makeTarget' . s:fg_red
exec 'hi makeStatement' . s:fg_aqua . s:ft_bold
exec 'hi makeCommands' . s:fg_foreground
exec 'hi makeSpecial' . s:fg_orange . s:ft_bold
" CMake Highlighting (Builtin)
exec 'hi cmakeStatement' . s:fg_blue
exec 'hi cmakeArguments' . s:fg_foreground
exec 'hi cmakeVariableValue' . s:fg_pink
" C Highlighting
exec 'hi cType' . s:fg_pink . s:ft_bold
exec 'hi cFormat' . s:fg_olive
exec 'hi cStorageClass' . s:fg_navy . s:ft_bold
exec 'hi cBoolean' . s:fg_green . s:ft_bold
exec 'hi cCharacter' . s:fg_olive
exec 'hi cConstant' . s:fg_green . s:ft_bold
exec 'hi cConditional' . s:fg_purple . s:ft_bold
exec 'hi cSpecial' . s:fg_olive . s:ft_bold
exec 'hi cDefine' . s:fg_blue
exec 'hi cNumber' . s:fg_orange
exec 'hi cPreCondit' . s:fg_aqua
exec 'hi cRepeat' . s:fg_purple . s:ft_bold
exec 'hi cLabel' . s:fg_aqua
" exec 'hi cAnsiFunction' . s:fg_aqua . s:ft_bold
" exec 'hi cAnsiName' . s:fg_pink
exec 'hi cDelimiter' . s:fg_blue
" exec 'hi cBraces' . s:fg_foreground
" exec 'hi cIdentifier' . s:fg_blue . s:bg_pink
" exec 'hi cSemiColon'  . s:bg_blue
exec 'hi cOperator' . s:fg_aqua
" exec 'hi cStatement' . s:fg_pink
" exec 'hi cTodo' . s:fg_comment . s:ft_bold
" exec 'hi cStructure' . s:fg_blue . s:ft_bold
exec 'hi cCustomParen' . s:fg_foreground
" exec 'hi cCustomFunc' . s:fg_foreground
" exec 'hi cUserFunction' . s:fg_blue . s:ft_bold
exec 'hi cOctalZero' . s:fg_purple . s:ft_bold
" to disable builtin highlighting change this to s:fg_foreground
exec 'hi cFunction' . s:fg_blue
" CPP highlighting
exec 'hi cppBoolean' . s:fg_green . s:ft_bold
exec 'hi cppSTLnamespace' . s:fg_purple
exec 'hi cppSTLexception' . s:fg_pink
exec 'hi cppSTLfunctional' . s:fg_foreground . s:ft_bold
exec 'hi cppSTLiterator' . s:fg_foreground . s:ft_bold
exec 'hi cppExceptions' . s:fg_red
exec 'hi cppStatement' . s:fg_blue
exec 'hi cppStorageClass' . s:fg_navy . s:ft_bold
exec 'hi cppAccess' . s:fg_orange . s:ft_bold
" to disable standard library highlighting change these to s:fg_foreground
exec 'hi cppSTLconstant' . s:fg_green . s:ft_bold
exec 'hi cppSTLtype' . s:fg_pink . s:ft_bold
exec 'hi cppSTLfunction' . s:fg_blue
exec 'hi cppSTLios' . s:fg_olive . s:ft_bold
" exec 'hi cppSTL' . s:fg_blue
" Rust highlighting
exec 'hi rustKeyword' . s:fg_pink
exec 'hi rustModPath' . s:fg_blue
exec 'hi rustModPathSep' . s:fg_blue
exec 'hi rustLifetime' . s:fg_purple
exec 'hi rustStructure' . s:fg_aqua . s:ft_bold
exec 'hi rustAttribute' . s:fg_aqua . s:ft_bold
exec 'hi rustPanic' . s:fg_olive . s:ft_bold
exec 'hi rustTrait' . s:fg_blue . s:ft_bold
exec 'hi rustEnum' . s:fg_green . s:ft_bold
exec 'hi rustEnumVariant' . s:fg_green
exec 'hi rustSelf' . s:fg_orange
exec 'hi rustSigil' . s:fg_aqua . s:ft_bold
exec 'hi rustOperator' . s:fg_aqua . s:ft_bold
exec 'hi rustMacro' . s:fg_olive . s:ft_bold
exec 'hi rustMacroVariable' . s:fg_olive
exec 'hi rustAssert' . s:fg_olive . s:ft_bold
exec 'hi rustConditional' . s:fg_purple . s:ft_bold
" Lex highlighting
exec 'hi lexCFunctions' . s:fg_foreground
exec 'hi lexAbbrv' . s:fg_purple
exec 'hi lexAbbrvRegExp' . s:fg_aqua
exec 'hi lexAbbrvComment' . s:fg_comment
exec 'hi lexBrace' . s:fg_navy
exec 'hi lexPat' . s:fg_aqua
exec 'hi lexPatComment' . s:fg_comment
exec 'hi lexPatTag' . s:fg_orange
" exec 'hi lexPatBlock' . s:fg_foreground . s:ft_bold
exec 'hi lexSlashQuote' . s:fg_foreground
exec 'hi lexSep' . s:fg_foreground
exec 'hi lexStartState' . s:fg_orange
exec 'hi lexPatTagZone' . s:fg_olive . s:ft_bold
exec 'hi lexMorePat' . s:fg_olive . s:ft_bold
exec 'hi lexOptions' . s:fg_olive . s:ft_bold
exec 'hi lexPatString' . s:fg_olive
" Yacc highlighting
exec 'hi yaccNonterminal' . s:fg_navy
exec 'hi yaccDelim' . s:fg_orange
exec 'hi yaccInitKey' . s:fg_aqua
exec 'hi yaccInit' . s:fg_navy
exec 'hi yaccKey' . s:fg_purple
exec 'hi yaccVar' . s:fg_aqua
" NASM highlighting
exec 'hi nasmStdInstruction' . s:fg_navy
exec 'hi nasmGen08Register' . s:fg_aqua
exec 'hi nasmGen16Register' . s:fg_aqua
exec 'hi nasmGen32Register' . s:fg_aqua
exec 'hi nasmGen64Register' . s:fg_aqua
exec 'hi nasmHexNumber' . s:fg_purple
exec 'hi nasmStorage' . s:fg_aqua . s:ft_bold
exec 'hi nasmLabel' . s:fg_pink
exec 'hi nasmDirective' . s:fg_blue . s:ft_bold
exec 'hi nasmLocalLabel' . s:fg_orange
" GAS highlighting
exec 'hi gasSymbol' . s:fg_pink
exec 'hi gasDirective' . s:fg_blue . s:ft_bold
exec 'hi gasOpcode_386_Base' . s:fg_navy
exec 'hi gasDecimalNumber' . s:fg_purple
exec 'hi gasSymbolRef' . s:fg_pink
exec 'hi gasRegisterX86' . s:fg_blue
exec 'hi gasOpcode_P6_Base' . s:fg_navy
exec 'hi gasDirectiveStore' . s:fg_foreground . s:ft_bold
" MIPS highlighting
exec 'hi mipsInstruction' . s:fg_pink
exec 'hi mipsRegister' . s:fg_navy
exec 'hi mipsLabel' . s:fg_aqua . s:ft_bold
exec 'hi mipsDirective' . s:fg_purple . s:ft_bold
" Shell/Bash highlighting
exec 'hi bashStatement' . s:fg_foreground . s:ft_bold
exec 'hi shDerefVar' . s:fg_aqua . s:ft_bold
exec 'hi shDerefSimple' . s:fg_aqua
exec 'hi shFunction' . s:fg_orange . s:ft_bold
exec 'hi shStatement' . s:fg_foreground
exec 'hi shLoop' . s:fg_purple . s:ft_bold
exec 'hi shQuote' . s:fg_olive
exec 'hi shCaseEsac' . s:fg_aqua . s:ft_bold
exec 'hi shSnglCase' . s:fg_purple . s:ft_none
exec 'hi shFunctionOne' . s:fg_navy
exec 'hi shCase' . s:fg_navy
exec 'hi shSetList' . s:fg_navy
" @see Dockerfile Highlighting section for more sh*
" PowerShell Highlighting
exec 'hi ps1Type' . s:fg_green . s:ft_bold
exec 'hi ps1Variable' . s:fg_navy
exec 'hi ps1Boolean' . s:fg_navy . s:ft_bold
exec 'hi ps1FunctionInvocation' . s:fg_pink
exec 'hi ps1FunctionDeclaration' . s:fg_pink
exec 'hi ps1Keyword' . s:fg_blue . s:ft_bold
exec 'hi ps1Exception' . s:fg_red
exec 'hi ps1Operator' . s:fg_aqua . s:ft_bold
exec 'hi ps1CommentDoc' . s:fg_purple
exec 'hi ps1CDocParam' . s:fg_orange
" HTML Highlighting
exec 'hi htmlTitle' . s:fg_green . s:ft_bold
exec 'hi htmlH1' . s:fg_green . s:ft_bold
exec 'hi htmlH2' . s:fg_aqua . s:ft_bold
exec 'hi htmlH3' . s:fg_purple . s:ft_bold
exec 'hi htmlH4' . s:fg_orange . s:ft_bold
exec 'hi htmlTag' . s:fg_comment
exec 'hi htmlTagName' . s:fg_wine
exec 'hi htmlArg' . s:fg_pink
exec 'hi htmlEndTag' . s:fg_comment
exec 'hi htmlString' . s:fg_blue
exec 'hi htmlScriptTag' . s:fg_comment
exec 'hi htmlBold' . s:fg_foreground . s:ft_bold
exec 'hi htmlItalic' . s:fg_comment . s:ft_italic
exec 'hi htmlBoldItalic' . s:fg_navy . s:ft_italic_bold
" exec 'hi htmlLink' . s:fg_blue . s:ft_bold
exec 'hi htmlTagN' . s:fg_wine . s:ft_bold
exec 'hi htmlSpecialTagName' . s:fg_wine
exec 'hi htmlComment' . s:fg_comment . s:ft_italic
exec 'hi htmlCommentPart' . s:fg_comment . s:ft_italic
" CSS Highlighting
exec 'hi cssIdentifier' . s:fg_pink
exec 'hi cssPositioningProp' . s:fg_foreground
exec 'hi cssNoise' . s:fg_foreground
exec 'hi cssBoxProp' . s:fg_foreground
exec 'hi cssTableAttr' . s:fg_purple
exec 'hi cssPositioningAttr' . s:fg_navy
exec 'hi cssValueLength' . s:fg_orange
exec 'hi cssFunctionName' . s:fg_blue
exec 'hi cssUnitDecorators' . s:fg_aqua
exec 'hi cssColor' . s:fg_blue . s:ft_bold
exec 'hi cssBraces' . s:fg_pink
exec 'hi cssBackgroundProp' . s:fg_foreground
exec 'hi cssTextProp' . s:fg_foreground
exec 'hi cssDimensionProp' . s:fg_foreground
exec 'hi cssClassName' . s:fg_pink
" Markdown Highlighting
exec 'hi markdownHeadingRule' . s:fg_pink . s:ft_bold
exec 'hi markdownH1' . s:fg_pink . s:ft_bold
exec 'hi markdownH2' . s:fg_orange . s:ft_bold
exec 'hi markdownBlockquote' . s:fg_pink
exec 'hi markdownCodeBlock' . s:fg_olive
exec 'hi markdownCode' . s:fg_olive
exec 'hi markdownLink' . s:fg_blue . s:ft_bold
exec 'hi markdownUrl' . s:fg_blue
exec 'hi markdownLinkText' . s:fg_pink
exec 'hi markdownLinkTextDelimiter' . s:fg_purple
exec 'hi markdownLinkDelimiter' . s:fg_purple
exec 'hi markdownCodeDelimiter' . s:fg_blue
exec 'hi mkdCode' . s:fg_olive
exec 'hi mkdLink' . s:fg_blue . s:ft_bold
exec 'hi mkdURL' . s:fg_comment
exec 'hi mkdString' . s:fg_foreground
exec 'hi mkdBlockQuote' . s:fg_pink
exec 'hi mkdLinkTitle' . s:fg_pink
exec 'hi mkdDelimiter' . s:fg_aqua
exec 'hi mkdRule' . s:fg_pink
" reStructuredText Highlighting
exec 'hi rstSections' . s:fg_pink . s:ft_bold
exec 'hi rstDelimiter' . s:fg_pink . s:ft_bold
exec 'hi rstExplicitMarkup' . s:fg_pink . s:ft_bold
exec 'hi rstDirective' . s:fg_blue
exec 'hi rstHyperlinkTarget' . s:fg_green
exec 'hi rstExDirective' . s:fg_foreground
exec 'hi rstInlineLiteral' . s:fg_olive
exec 'hi rstInterpretedTextOrHyperlinkReference' . s:fg_blue
" Python Highlighting
exec 'hi pythonImport' . s:fg_pink . s:ft_bold
exec 'hi pythonExceptions' . s:fg_red
exec 'hi pythonException' . s:fg_purple . s:ft_bold
exec 'hi pythonInclude' . s:fg_red
exec 'hi pythonStatement' . s:fg_pink
exec 'hi pythonConditional' . s:fg_purple . s:ft_bold
exec 'hi pythonRepeat' . s:fg_purple . s:ft_bold
exec 'hi pythonFunction' . s:fg_aqua . s:ft_bold
exec 'hi pythonPreCondit' . s:fg_purple
exec 'hi pythonExClass' . s:fg_orange
exec 'hi pythonOperator' . s:fg_purple . s:ft_bold
exec 'hi pythonBuiltin' . s:fg_foreground
exec 'hi pythonDecorator' . s:fg_orange
exec 'hi pythonString' . s:fg_olive
exec 'hi pythonEscape' . s:fg_olive . s:ft_bold
exec 'hi pythonStrFormatting' . s:fg_olive . s:ft_bold
exec 'hi pythonBoolean' . s:fg_green . s:ft_bold
exec 'hi pythonBytesEscape' . s:fg_olive . s:ft_bold
exec 'hi pythonDottedName' . s:fg_purple
exec 'hi pythonStrFormat' . s:fg_foreground
" to disable builtin highlighting change these to s:fg_foreground
exec 'hi pythonBuiltinFunc' . s:fg_blue
exec 'hi pythonBuiltinObj' . s:fg_red
" Java Highlighting
exec 'hi javaExternal' . s:fg_pink
exec 'hi javaAnnotation' . s:fg_orange
exec 'hi javaTypedef' . s:fg_aqua
exec 'hi javaClassDecl' . s:fg_aqua . s:ft_bold
exec 'hi javaScopeDecl' . s:fg_blue . s:ft_bold
exec 'hi javaStorageClass' . s:fg_navy . s:ft_bold
exec 'hi javaBoolean' . s:fg_green . s:ft_bold
exec 'hi javaConstant' . s:fg_blue
exec 'hi javaCommentTitle' . s:fg_wine
exec 'hi javaDocTags' . s:fg_aqua
exec 'hi javaDocComment' . s:fg_comment
exec 'hi javaDocParam' . s:fg_foreground
exec 'hi javaStatement' . s:fg_pink
" JavaScript Highlighting
exec 'hi javaScriptBraces' . s:fg_blue
exec 'hi javaScriptParens' . s:fg_blue
exec 'hi javaScriptIdentifier' . s:fg_pink
exec 'hi javaScriptFunction' . s:fg_blue . s:ft_bold
exec 'hi javaScriptConditional' . s:fg_purple . s:ft_bold
exec 'hi javaScriptRepeat' . s:fg_purple . s:ft_bold
exec 'hi javaScriptBoolean' . s:fg_green . s:ft_bold
exec 'hi javaScriptNumber' . s:fg_orange
exec 'hi javaScriptMember' . s:fg_navy
exec 'hi javaScriptReserved' . s:fg_navy
exec 'hi javascriptNull' . s:fg_comment . s:ft_bold
exec 'hi javascriptGlobal' . s:fg_foreground
exec 'hi javascriptStatement' . s:fg_pink
exec 'hi javaScriptMessage' . s:fg_foreground
exec 'hi javaScriptMember' . s:fg_foreground
" @target https://github.com/pangloss/vim-javascript
exec 'hi jsImport' . s:fg_pink . s:ft_bold
exec 'hi jsExport' . s:fg_pink . s:ft_bold
exec 'hi jsModuleAs' . s:fg_pink . s:ft_bold
exec 'hi jsFrom' . s:fg_pink . s:ft_bold
exec 'hi jsExportDefault' . s:fg_pink . s:ft_bold
exec 'hi jsFuncParens' . s:fg_blue
exec 'hi jsFuncBraces' . s:fg_blue
exec 'hi jsParens' . s:fg_blue
exec 'hi jsBraces' . s:fg_blue
exec 'hi jsNoise' . s:fg_blue
" Jsx Highlighting
" @target https://github.com/MaxMEllon/vim-jsx-pretty
exec 'hi jsxTagName' . s:fg_wine
exec 'hi jsxComponentName' . s:fg_wine
exec 'hi jsxAttrib' . s:fg_pink
exec 'hi jsxEqual' . s:fg_comment
exec 'hi jsxString' . s:fg_blue
exec 'hi jsxCloseTag' . s:fg_comment
exec 'hi jsxCloseString' . s:fg_comment
exec 'hi jsxDot' . s:fg_wine
exec 'hi jsxNamespace' . s:fg_wine
exec 'hi jsxPunct' . s:fg_comment
" Json Highlighting
" @target https://github.com/elzr/vim-json
exec 'hi jsonKeyword' . s:fg_blue
exec 'hi jsonString' . s:fg_olive
exec 'hi jsonQuote' . s:fg_comment
exec 'hi jsonNoise' . s:fg_foreground
exec 'hi jsonKeywordMatch' . s:fg_foreground
exec 'hi jsonBraces' . s:fg_foreground
exec 'hi jsonNumber' . s:fg_orange
exec 'hi jsonNull' . s:fg_purple . s:ft_bold
exec 'hi jsonBoolean' . s:fg_green . s:ft_bold
exec 'hi jsonCommentError' . s:fg_pink . s:bg_background
" Go Highlighting
exec 'hi goDirective' . s:fg_red
exec 'hi goDeclaration' . s:fg_blue . s:ft_bold
exec 'hi goStatement' . s:fg_pink
exec 'hi goConditional' . s:fg_purple . s:ft_bold
exec 'hi goConstants' . s:fg_orange
exec 'hi goFunction' . s:fg_orange
" exec 'hi goTodo' . s:fg_comment . s:ft_bold
exec 'hi goDeclType' . s:fg_blue
exec 'hi goBuiltins' . s:fg_purple
" Systemtap Highlighting
" exec 'hi stapBlock' . s:fg_comment . s:ft_none
exec 'hi stapComment' . s:fg_comment . s:ft_none
exec 'hi stapProbe' . s:fg_aqua . s:ft_bold
exec 'hi stapStat' . s:fg_navy . s:ft_bold
exec 'hi stapFunc' . s:fg_foreground
exec 'hi stapString' . s:fg_olive
exec 'hi stapTarget' . s:fg_navy
exec 'hi stapStatement' . s:fg_pink
exec 'hi stapType' . s:fg_pink . s:ft_bold
exec 'hi stapSharpBang' . s:fg_comment
exec 'hi stapDeclaration' . s:fg_pink
exec 'hi stapCMacro' . s:fg_blue
" DTrace Highlighting
exec 'hi dtraceProbe' . s:fg_blue
exec 'hi dtracePredicate' . s:fg_purple . s:ft_bold
exec 'hi dtraceComment' . s:fg_comment
exec 'hi dtraceFunction' . s:fg_foreground
exec 'hi dtraceAggregatingFunction' . s:fg_blue . s:ft_bold
exec 'hi dtraceStatement' . s:fg_navy . s:ft_bold
exec 'hi dtraceIdentifier' . s:fg_pink
exec 'hi dtraceOption' . s:fg_pink
exec 'hi dtraceConstant' . s:fg_orange
exec 'hi dtraceType' . s:fg_pink . s:ft_bold
" PlantUML Highlighting
exec 'hi plantumlPreProc' . s:fg_orange . s:ft_bold
exec 'hi plantumlDirectedOrVerticalArrowRL' . s:fg_pink
exec 'hi plantumlDirectedOrVerticalArrowLR' . s:fg_pink
exec 'hi plantumlString' . s:fg_olive
exec 'hi plantumlActivityThing' . s:fg_purple
exec 'hi plantumlText' . s:fg_navy
exec 'hi plantumlClassPublic' . s:fg_olive . s:ft_bold
exec 'hi plantumlClassPrivate' . s:fg_red
exec 'hi plantumlColonLine' . s:fg_orange
exec 'hi plantumlClass' . s:fg_navy
exec 'hi plantumlHorizontalArrow' . s:fg_pink
exec 'hi plantumlTypeKeyword' . s:fg_blue . s:ft_bold
exec 'hi plantumlKeyword' . s:fg_pink . s:ft_bold
exec 'hi plantumlType' . s:fg_blue . s:ft_bold
exec 'hi plantumlBlock' . s:fg_pink . s:ft_bold
exec 'hi plantumlPreposition' . s:fg_orange
exec 'hi plantumlLayout' . s:fg_blue . s:ft_bold
exec 'hi plantumlNote' . s:fg_orange
exec 'hi plantumlLifecycle' . s:fg_aqua
exec 'hi plantumlParticipant' . s:fg_foreground . s:ft_bold
" Haskell Highlighting
exec 'hi haskellType' . s:fg_aqua . s:ft_bold
exec 'hi haskellIdentifier' . s:fg_orange . s:ft_bold
exec 'hi haskellOperators' . s:fg_pink
exec 'hi haskellWhere' . s:fg_foreground . s:ft_bold
exec 'hi haskellDelimiter' . s:fg_aqua
exec 'hi haskellImportKeywords' . s:fg_pink
exec 'hi haskellStatement' . s:fg_purple . s:ft_bold
" SQL/MySQL Highlighting
exec 'hi sqlStatement' . s:fg_pink . s:ft_bold
exec 'hi sqlType' . s:fg_blue . s:ft_bold
exec 'hi sqlKeyword' . s:fg_pink
exec 'hi sqlOperator' . s:fg_aqua
exec 'hi sqlSpecial' . s:fg_green . s:ft_bold
exec 'hi mysqlVariable' . s:fg_olive . s:ft_bold
exec 'hi mysqlType' . s:fg_blue . s:ft_bold
exec 'hi mysqlKeyword' . s:fg_pink
exec 'hi mysqlOperator' . s:fg_aqua
exec 'hi mysqlSpecial' . s:fg_green . s:ft_bold
" Octave/MATLAB Highlighting
exec 'hi octaveVariable' . s:fg_foreground
exec 'hi octaveDelimiter' . s:fg_pink
exec 'hi octaveQueryVar' . s:fg_foreground
exec 'hi octaveSemicolon' . s:fg_purple
exec 'hi octaveFunction' . s:fg_navy
exec 'hi octaveSetVar' . s:fg_blue
exec 'hi octaveUserVar' . s:fg_foreground
exec 'hi octaveArithmeticOperator' . s:fg_aqua
exec 'hi octaveBeginKeyword' . s:fg_purple . s:ft_bold
exec 'hi octaveElseKeyword' . s:fg_purple . s:ft_bold
exec 'hi octaveEndKeyword' . s:fg_purple . s:ft_bold
exec 'hi octaveStatement' . s:fg_pink
" Ruby Highlighting
exec 'hi rubyModule' . s:fg_navy . s:ft_bold
exec 'hi rubyClass' . s:fg_pink . s:ft_bold
exec 'hi rubyPseudoVariable' . s:fg_comment . s:ft_bold
exec 'hi rubyKeyword' . s:fg_pink
exec 'hi rubyInstanceVariable' . s:fg_purple
exec 'hi rubyFunction' . s:fg_foreground . s:ft_bold
exec 'hi rubyDefine' . s:fg_pink
exec 'hi rubySymbol' . s:fg_aqua
exec 'hi rubyConstant' . s:fg_blue
exec 'hi rubyAccess' . s:fg_navy
exec 'hi rubyAttribute' . s:fg_green
exec 'hi rubyInclude' . s:fg_red
exec 'hi rubyLocalVariableOrMethod' . s:fg_orange
exec 'hi rubyCurlyBlock' . s:fg_foreground
exec 'hi rubyCurlyBlockDelimiter' . s:fg_aqua
exec 'hi rubyArrayDelimiter' . s:fg_aqua
exec 'hi rubyStringDelimiter' . s:fg_olive
exec 'hi rubyInterpolationDelimiter' . s:fg_orange
exec 'hi rubyConditional' . s:fg_purple . s:ft_bold
exec 'hi rubyRepeat' . s:fg_purple . s:ft_bold
exec 'hi rubyControl' . s:fg_purple . s:ft_bold
exec 'hi rubyException' . s:fg_purple . s:ft_bold
exec 'hi rubyExceptional' . s:fg_purple . s:ft_bold
exec 'hi rubyBoolean' . s:fg_green . s:ft_bold
" Fortran Highlighting
exec 'hi fortranUnitHeader' . s:fg_blue . s:ft_bold
exec 'hi fortranIntrinsic' . s:fg_blue . s:bg_background . s:ft_none
exec 'hi fortranType' . s:fg_pink . s:ft_bold
exec 'hi fortranTypeOb' . s:fg_pink . s:ft_bold
exec 'hi fortranStructure' . s:fg_aqua
exec 'hi fortranStorageClass' . s:fg_navy . s:ft_bold
exec 'hi fortranStorageClassR' . s:fg_navy . s:ft_bold
exec 'hi fortranKeyword' . s:fg_pink
exec 'hi fortranReadWrite' . s:fg_aqua . s:ft_bold
exec 'hi fortranIO' . s:fg_navy
exec 'hi fortranOperator' . s:fg_aqua . s:ft_bold
exec 'hi fortranCall' . s:fg_aqua . s:ft_bold
exec 'hi fortranContinueMark' . s:fg_green
" ALGOL Highlighting (Plugin: https://github.com/sterpe/vim-algol68)
exec 'hi algol68Statement' . s:fg_blue . s:ft_bold
exec 'hi algol68Operator' . s:fg_aqua . s:ft_bold
exec 'hi algol68PreProc' . s:fg_green
exec 'hi algol68Function' . s:fg_blue
" R Highlighting
exec 'hi rType' . s:fg_blue
exec 'hi rArrow' . s:fg_pink
exec 'hi rDollar' . s:fg_blue
" XXD Highlighting
exec 'hi xxdAddress' . s:fg_navy
exec 'hi xxdSep' . s:fg_pink
exec 'hi xxdAscii' . s:fg_pink
exec 'hi xxdDot' . s:fg_aqua
" PHP Highlighting
exec 'hi phpIdentifier' . s:fg_foreground
exec 'hi phpVarSelector' . s:fg_pink
exec 'hi phpKeyword' . s:fg_blue
exec 'hi phpRepeat' . s:fg_purple . s:ft_bold
exec 'hi phpConditional' . s:fg_purple . s:ft_bold
exec 'hi phpStatement' . s:fg_pink
exec 'hi phpAssignByRef' . s:fg_aqua . s:ft_bold
exec 'hi phpSpecialFunction' . s:fg_blue
exec 'hi phpFunctions' . s:fg_blue
exec 'hi phpComparison' . s:fg_aqua
exec 'hi phpBackslashSequences' . s:fg_olive . s:ft_bold
exec 'hi phpMemberSelector' . s:fg_blue
exec 'hi phpStorageClass' . s:fg_purple . s:ft_bold
exec 'hi phpDefine' . s:fg_navy
exec 'hi phpIntVar' . s:fg_navy . s:ft_bold
" Perl Highlighting
exec 'hi perlFiledescRead' . s:fg_green
exec 'hi perlMatchStartEnd' . s:fg_pink
exec 'hi perlStatementFlow' . s:fg_pink
exec 'hi perlStatementStorage' . s:fg_pink
exec 'hi perlFunction' . s:fg_pink . s:ft_bold
exec 'hi perlMethod' . s:fg_foreground
exec 'hi perlStatementFiledesc' . s:fg_orange
exec 'hi perlVarPlain' . s:fg_navy
exec 'hi perlSharpBang' . s:fg_comment
exec 'hi perlStatementInclude' . s:fg_aqua . s:ft_bold
exec 'hi perlStatementScalar' . s:fg_purple
exec 'hi perlSubName' . s:fg_aqua . s:ft_bold
exec 'hi perlSpecialString' . s:fg_olive . s:ft_bold
" Pascal Highlighting
exec 'hi pascalType' . s:fg_pink . s:ft_bold
exec 'hi pascalStatement' . s:fg_blue . s:ft_bold
exec 'hi pascalPredefined' . s:fg_pink
exec 'hi pascalFunction' . s:fg_foreground
exec 'hi pascalStruct' . s:fg_navy . s:ft_bold
exec 'hi pascalOperator' . s:fg_aqua . s:ft_bold
exec 'hi pascalPreProc' . s:fg_green
exec 'hi pascalAcces' . s:fg_navy . s:ft_bold
" Lua Highlighting
exec 'hi luaFunc' . s:fg_foreground
exec 'hi luaIn' . s:fg_blue . s:ft_bold
exec 'hi luaFunction' . s:fg_pink
exec 'hi luaStatement' . s:fg_blue
exec 'hi luaRepeat' . s:fg_blue . s:ft_bold
exec 'hi luaCondStart' . s:fg_purple . s:ft_bold
exec 'hi luaTable' . s:fg_aqua . s:ft_bold
exec 'hi luaConstant' . s:fg_green . s:ft_bold
exec 'hi luaElse' . s:fg_purple . s:ft_bold
exec 'hi luaCondElseif' . s:fg_purple . s:ft_bold
exec 'hi luaCond' . s:fg_purple . s:ft_bold
exec 'hi luaCondEnd' . s:fg_purple
" Clojure highlighting:
exec 'hi clojureConstant' . s:fg_blue
exec 'hi clojureBoolean' . s:fg_orange
exec 'hi clojureCharacter' . s:fg_olive
exec 'hi clojureKeyword' . s:fg_pink
exec 'hi clojureNumber' . s:fg_orange
exec 'hi clojureString' . s:fg_olive
exec 'hi clojureRegexp' . s:fg_purple
exec 'hi clojureRegexpEscape' . s:fg_pink
exec 'hi clojureParen' . s:fg_aqua
exec 'hi clojureVariable' . s:fg_olive
exec 'hi clojureCond' . s:fg_blue
exec 'hi clojureDefine' . s:fg_blue . s:ft_bold
exec 'hi clojureException' . s:fg_red
exec 'hi clojureFunc' . s:fg_navy
exec 'hi clojureMacro' . s:fg_blue
exec 'hi clojureRepeat' . s:fg_blue
exec 'hi clojureSpecial' . s:fg_blue . s:ft_bold
exec 'hi clojureQuote' . s:fg_blue
exec 'hi clojureUnquote' . s:fg_blue
exec 'hi clojureMeta' . s:fg_blue
exec 'hi clojureDeref' . s:fg_blue
exec 'hi clojureAnonArg' . s:fg_blue
exec 'hi clojureRepeat' . s:fg_blue
exec 'hi clojureDispatch' . s:fg_aqua
" Dockerfile Highlighting
" @target https://github.com/docker/docker/tree/master/contrib/syntax/vim
exec 'hi dockerfileKeyword' . s:fg_blue
exec 'hi shDerefVar' . s:fg_purple . s:ft_bold
exec 'hi shOperator' . s:fg_aqua
exec 'hi shOption' . s:fg_navy
exec 'hi shLine' . s:fg_foreground
exec 'hi shWrapLineOperator' . s:fg_pink
" NGINX Highlighting
" @target https://github.com/evanmiller/nginx-vim-syntax
exec 'hi ngxDirectiveBlock' . s:fg_pink . s:ft_bold
exec 'hi ngxDirective' . s:fg_blue . s:ft_none
exec 'hi ngxDirectiveImportant' . s:fg_blue . s:ft_bold
exec 'hi ngxString' . s:fg_olive
exec 'hi ngxVariableString' . s:fg_purple
exec 'hi ngxVariable' . s:fg_purple . s:ft_none
" Yaml Highlighting
exec 'hi yamlBlockMappingKey' . s:fg_blue
exec 'hi yamlKeyValueDelimiter' . s:fg_pink
exec 'hi yamlBlockCollectionItemStart' . s:fg_pink
" Qt QML Highlighting
exec 'hi qmlObjectLiteralType' . s:fg_pink
exec 'hi qmlReserved' . s:fg_purple
exec 'hi qmlBindingProperty' . s:fg_navy
exec 'hi qmlType' . s:fg_navy
" Dosini Highlighting
exec 'hi dosiniHeader' . s:fg_pink
exec 'hi dosiniLabel' . s:fg_blue
" Mail highlighting
exec 'hi mailHeaderKey' . s:fg_blue
exec 'hi mailHeaderEmail' . s:fg_purple
exec 'hi mailSubject' . s:fg_pink
exec 'hi mailHeader' . s:fg_comment
exec 'hi mailURL' . s:fg_aqua
exec 'hi mailEmail' . s:fg_purple
exec 'hi mailQuoted1' . s:fg_olive
exec 'hi mailQuoted2' . s:fg_navy
" XML Highlighting
exec 'hi xmlProcessingDelim' . s:fg_pink
exec 'hi xmlString' . s:fg_olive
exec 'hi xmlEqual' . s:fg_orange
exec 'hi xmlAttrib' . s:fg_navy
exec 'hi xmlAttribPunct' . s:fg_pink
exec 'hi xmlTag' . s:fg_blue
exec 'hi xmlTagName' . s:fg_blue
exec 'hi xmlEndTag' . s:fg_blue
exec 'hi xmlNamespace' . s:fg_orange
" Exlixir Highlighting
" @target https://github.com/elixir-lang/vim-elixir
exec 'hi elixirAlias' . s:fg_blue . s:ft_bold
exec 'hi elixirAtom' . s:fg_navy
exec 'hi elixirVariable' . s:fg_navy
exec 'hi elixirUnusedVariable' . s:fg_foreground . s:ft_bold
exec 'hi elixirInclude' . s:fg_purple
exec 'hi elixirStringDelimiter' . s:fg_olive
exec 'hi elixirKeyword' . s:fg_purple . s:ft_bold
exec 'hi elixirFunctionDeclaration' . s:fg_aqua . s:ft_bold
exec 'hi elixirBlockDefinition' . s:fg_pink
exec 'hi elixirDefine' . s:fg_pink
exec 'hi elixirStructDefine' . s:fg_pink
exec 'hi elixirPrivateDefine' . s:fg_pink
exec 'hi elixirModuleDefine' . s:fg_pink
exec 'hi elixirProtocolDefine' . s:fg_pink
exec 'hi elixirImplDefine' . s:fg_pink
exec 'hi elixirModuleDeclaration' . s:fg_aqua . s:ft_bold
exec 'hi elixirDocString' . s:fg_olive
exec 'hi elixirDocTest' . s:fg_green . s:ft_bold
" Erlang Highlighting
exec 'hi erlangBIF' . s:fg_purple . s:ft_bold
exec 'hi erlangBracket' . s:fg_pink
exec 'hi erlangLocalFuncCall' . s:fg_foreground
exec 'hi erlangVariable' . s:fg_foreground
exec 'hi erlangAtom' . s:fg_navy
exec 'hi erlangAttribute' . s:fg_blue . s:ft_bold
exec 'hi erlangRecordDef' . s:fg_blue . s:ft_bold
exec 'hi erlangRecord' . s:fg_blue
exec 'hi erlangRightArrow' . s:fg_blue . s:ft_bold
exec 'hi erlangStringModifier' . s:fg_olive . s:ft_bold
exec 'hi erlangInclude' . s:fg_blue . s:ft_bold
exec 'hi erlangKeyword' . s:fg_pink
exec 'hi erlangGlobalFuncCall' . s:fg_foreground
" Cucumber Highlighting
exec 'hi cucumberFeature' . s:fg_blue . s:ft_bold
exec 'hi cucumberBackground' . s:fg_pink . s:ft_bold
exec 'hi cucumberScenario' . s:fg_pink . s:ft_bold
exec 'hi cucumberGiven' . s:fg_orange
exec 'hi cucumberGivenAnd' . s:fg_blue
exec 'hi cucumberThen' . s:fg_orange
exec 'hi cucumberThenAnd' . s:fg_blue
exec 'hi cucumberWhen' . s:fg_purple . s:ft_bold
exec 'hi cucumberScenarioOutline' . s:fg_pink . s:ft_bold
exec 'hi cucumberExamples' . s:fg_aqua
exec 'hi cucumberTags' . s:fg_aqua
exec 'hi cucumberPlaceholder' . s:fg_aqua
" Ada Highlighting
exec 'hi adaInc' . s:fg_aqua . s:ft_bold
exec 'hi adaSpecial' . s:fg_aqua . s:ft_bold
exec 'hi adaKeyword' . s:fg_pink
exec 'hi adaBegin' . s:fg_pink
exec 'hi adaEnd' . s:fg_pink
exec 'hi adaTypedef' . s:fg_navy . s:ft_bold
exec 'hi adaAssignment' . s:fg_aqua . s:ft_bold
exec 'hi adaAttribute' . s:fg_green
" COBOL Highlighting
exec 'hi cobolMarker' . s:fg_comment . s:bg_cursorline
exec 'hi cobolLine' . s:fg_foreground
exec 'hi cobolReserved' . s:fg_blue
exec 'hi cobolDivision' . s:fg_pink . s:ft_bold
exec 'hi cobolDivisionName' . s:fg_pink . s:ft_bold
exec 'hi cobolSection' . s:fg_navy . s:ft_bold
exec 'hi cobolSectionName' . s:fg_navy . s:ft_bold
exec 'hi cobolParagraph' . s:fg_purple
exec 'hi cobolParagraphName' . s:fg_purple
exec 'hi cobolDeclA' . s:fg_purple
exec 'hi cobolDecl' . s:fg_green
exec 'hi cobolCALLs' . s:fg_aqua . s:ft_bold
exec 'hi cobolEXECs' . s:fg_aqua . s:ft_bold
" GNU sed highlighting
exec 'hi sedST' . s:fg_purple . s:ft_bold
exec 'hi sedFlag' . s:fg_purple . s:ft_bold
exec 'hi sedRegexp47' . s:fg_pink
exec 'hi sedRegexpMeta' . s:fg_blue . s:ft_bold
exec 'hi sedReplacement47' . s:fg_olive
exec 'hi sedReplaceMeta' . s:fg_orange . s:ft_bold
exec 'hi sedAddress' . s:fg_pink
exec 'hi sedFunction' . s:fg_aqua . s:ft_bold
exec 'hi sedBranch' . s:fg_green . s:ft_bold
exec 'hi sedLabel' . s:fg_green . s:ft_bold
" GNU awk highlighting
exec 'hi awkPatterns' . s:fg_pink . s:ft_bold
exec 'hi awkSearch' . s:fg_pink
exec 'hi awkRegExp' . s:fg_blue . s:ft_bold
exec 'hi awkCharClass' . s:fg_blue . s:ft_bold
exec 'hi awkFieldVars' . s:fg_green . s:ft_bold
exec 'hi awkStatement' . s:fg_blue . s:ft_bold
exec 'hi awkFunction' . s:fg_blue
exec 'hi awkVariables' . s:fg_green . s:ft_bold
exec 'hi awkArrayElement' . s:fg_orange
exec 'hi awkOperator' . s:fg_foreground
exec 'hi awkBoolLogic' . s:fg_foreground
exec 'hi awkExpression' . s:fg_foreground
exec 'hi awkSpecialPrintf' . s:fg_olive . s:ft_bold
" Elm highlighting
exec 'hi elmImport' . s:fg_navy
exec 'hi elmAlias' . s:fg_aqua
exec 'hi elmType' . s:fg_pink
exec 'hi elmOperator' . s:fg_aqua . s:ft_bold
exec 'hi elmBraces' . s:fg_aqua . s:ft_bold
exec 'hi elmTypedef' . s:fg_blue .  s:ft_bold
exec 'hi elmTopLevelDecl' . s:fg_green . s:ft_bold
" Purescript highlighting
exec 'hi purescriptModuleKeyword' . s:fg_navy
exec 'hi purescriptImportKeyword' . s:fg_navy
exec 'hi purescriptModuleName' . s:fg_pink
exec 'hi purescriptOperator' . s:fg_aqua . s:ft_bold
exec 'hi purescriptType' . s:fg_pink
exec 'hi purescriptTypeVar' . s:fg_navy
exec 'hi purescriptStructure' . s:fg_blue . s:ft_bold
exec 'hi purescriptLet' . s:fg_blue . s:ft_bold
exec 'hi purescriptFunction' . s:fg_green . s:ft_bold
exec 'hi purescriptDelimiter' . s:fg_aqua . s:ft_bold
exec 'hi purescriptStatement' . s:fg_purple . s:ft_bold
exec 'hi purescriptConstructor' . s:fg_pink
exec 'hi purescriptWhere' . s:fg_purple . s:ft_bold
" F# highlighting
exec 'hi fsharpTypeName' . s:fg_pink
exec 'hi fsharpCoreClass' . s:fg_pink
exec 'hi fsharpType' . s:fg_pink
exec 'hi fsharpKeyword' . s:fg_blue . s:ft_bold
exec 'hi fsharpOperator' . s:fg_aqua . s:ft_bold
exec 'hi fsharpBoolean' . s:fg_green . s:ft_bold
exec 'hi fsharpFormat' . s:fg_foreground
exec 'hi fsharpLinq' . s:fg_blue
exec 'hi fsharpKeyChar' . s:fg_aqua . s:ft_bold
exec 'hi fsharpOption' . s:fg_orange
exec 'hi fsharpCoreMethod' . s:fg_purple
exec 'hi fsharpAttrib' . s:fg_orange
exec 'hi fsharpModifier' . s:fg_aqua
exec 'hi fsharpOpen' . s:fg_red
" ASN.1 highlighting
exec 'hi asnExternal' . s:fg_green . s:ft_bold
exec 'hi asnTagModifier' . s:fg_purple
exec 'hi asnBraces' . s:fg_aqua . s:ft_bold
exec 'hi asnDefinition' . s:fg_foreground
exec 'hi asnStructure' . s:fg_blue
exec 'hi asnType' . s:fg_pink
exec 'hi asnTypeInfo' . s:fg_aqua . s:ft_bold
exec 'hi asnFieldOption' . s:fg_purple
" Plugin: Netrw
exec 'hi netrwVersion' . s:fg_red
exec 'hi netrwList' . s:fg_pink
exec 'hi netrwHidePat' . s:fg_olive
exec 'hi netrwQuickHelp' . s:fg_blue
exec 'hi netrwHelpCmd' . s:fg_blue
exec 'hi netrwDir' . s:fg_aqua . s:ft_bold
exec 'hi netrwClassify' . s:fg_pink
exec 'hi netrwExe' . s:fg_green
exec 'hi netrwSuffixes' . s:fg_comment
exec 'hi netrwTreeBar' . s:fg_linenumber_fg
" Plugin: Tagbar
exec 'hi TagbarHelpTitle' . s:fg_blue . s:ft_bold
exec 'hi TagbarHelp' . s:fg_foreground
exec 'hi TagbarKind' . s:fg_pink
exec 'hi TagbarSignature' . s:fg_aqua
" Plugin: Vimdiff
exec 'hi DiffAdd' . s:fg_diffadd_fg . s:bg_diffadd_bg . s:ft_none
exec 'hi DiffChange' . s:fg_diffchange_fg . s:bg_diffchange_bg . s:ft_none
exec 'hi DiffDelete' . s:fg_diffdelete_fg . s:bg_diffdelete_bg . s:ft_none
exec 'hi DiffText' . s:fg_difftext_fg . s:bg_difftext_bg . s:ft_none
" Plugin: Spell Checking
exec 'hi SpellBad' . s:fg_foreground . s:bg_spellbad
exec 'hi SpellCap' . s:fg_foreground . s:bg_spellcap
exec 'hi SpellRare' . s:fg_foreground . s:bg_spellrare
exec 'hi SpellLocal' . s:fg_foreground . s:bg_spelllocal
" Plugin: Indent Guides
exec 'hi IndentGuidesOdd'  . s:bg_background
exec 'hi IndentGuidesEven'  . s:bg_cursorline
" Git commit message
exec 'hi gitcommitSummary' . s:fg_blue
exec 'hi gitcommitHeader' . s:fg_green . s:ft_bold
exec 'hi gitcommitSelectedType' . s:fg_blue
exec 'hi gitcommitSelectedFile' . s:fg_pink
exec 'hi gitcommitUntrackedFile' . s:fg_diffdelete_fg
exec 'hi gitcommitBranch' . s:fg_aqua . s:ft_bold
exec 'hi gitcommitDiscardedType' . s:fg_diffdelete_fg
exec 'hi gitcommitDiff' . s:fg_comment
exec 'hi diffFile' . s:fg_blue
exec 'hi diffSubname' . s:fg_comment
exec 'hi diffIndexLine' . s:fg_comment
exec 'hi diffAdded' . s:fg_diffadd_fg
exec 'hi diffRemoved' . s:fg_diffdelete_fg
exec 'hi diffLine' . s:fg_orange
exec 'hi diffBDiffer' . s:fg_orange
exec 'hi diffNewFile' . s:fg_comment
