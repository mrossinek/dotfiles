" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" Adapted by Max Rossmannek (https://gitlab.com/mrossinek)
" Colors were adapted from the PaperColor and OceanicNext schemes

" GUI color definitions
let s:gui00        = "#1b1b1b"
let s:gui01        = "#343434"
let s:gui02        = "#4f4f4f"
let s:gui03        = "#656565"
let s:gui04        = "#a7a7a7"
let s:gui05        = "#c0c0c0"
let s:gui06        = "#d3d3d3"
let s:gui07        = "#e9e9e9"
let s:gui08        = "#c62828"
let s:gui09        = "#db6827"
let s:gui0A        = "#f0a825"
let s:gui0B        = "#558b2e"
let s:gui0C        = "#00838f"
let s:gui0D        = "#1565c1"
let s:gui0E        = "#8e42be"
let s:gui0F        = "#ab7957"

" Terminal color definitions
let s:cterm00        = "00"
let s:cterm03        = "08"
let s:cterm05        = "07"
let s:cterm07        = "15"
let s:cterm08        = "01"
let s:cterm0A        = "03"
let s:cterm0B        = "02"
let s:cterm0C        = "06"
let s:cterm0D        = "04"
let s:cterm0E        = "05"
let s:cterm01        = "18"
let s:cterm02        = "19"
let s:cterm04        = "20"
let s:cterm06        = "21"
let s:cterm09        = "16"
let s:cterm0F        = "17"

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#2c2c2c"
  let g:terminal_color_1 =  "#c62828"
  let g:terminal_color_2 =  "#558b2e"
  let g:terminal_color_3 =  "#f9a825"
  let g:terminal_color_4 =  "#1565c1"
  let g:terminal_color_5 =  "#8e42be"
  let g:terminal_color_6 =  "#00838f"
  let g:terminal_color_7 =  "#ffffff"
  let g:terminal_color_8 =  "#969694"
  let g:terminal_color_9 =  "#f15250"
  let g:terminal_color_10 = "#86bd47"
  let g:terminal_color_11 = "#f8e63a"
  let g:terminal_color_12 = "#77b2f6"
  let g:terminal_color_13 = "#b933a8"
  let g:terminal_color_14 = "#25c3dc"
  let g:terminal_color_15 = "#ffffff"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
elseif has("terminal")
  let g:terminal_ansi_colors = [
        \ "#2c2c2c",
        \ "#c62828",
        \ "#558b2e",
        \ "#f9a825",
        \ "#1565c1",
        \ "#8e42be",
        \ "#00838f",
        \ "#ffffff",
        \ "#969694",
        \ "#f15250",
        \ "#86bd47",
        \ "#f8e63a",
        \ "#77b2f6",
        \ "#b933a8",
        \ "#25c3dc",
        \ "#ffffff",
        \ ]
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "mrossinek"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Color names
call <sid>hi("Grey",   s:gui04, "", s:cterm04, "", "", "")
call <sid>hi("Red",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Orange", s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Yellow", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Green",  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Aqua",   s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("Blue",   s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Purple", s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Brown",  s:gui0F, "", s:cterm0F, "", "", "")

" Vim editor colors
call <sid>hi("Normal",        s:gui06, "", s:cterm05, "", "", "")  " removed background colors for transparency
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:gui00, s:gui08, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:gui0C, s:gui01, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:gui01, s:gui03, s:cterm01, s:cterm03, "", "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "italic", "")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:gui03, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Search",        s:gui01, s:gui0A, s:cterm01, s:cterm0A,  "", "")
call <sid>hi("Substitute",    s:gui01, s:gui0A, s:cterm01, s:cterm0A, "none", "")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:gui08, s:gui0A, s:cterm08, "", "", "")
call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "bold", "")
call <sid>hi("Conceal",       s:gui0D, "none", s:cterm0D, "none", "", "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:gui00, "", s:cterm00, "none", "")
call <sid>hi("CursorColumn",  "", s:gui00, "", s:cterm00, "none", "")
call <sid>hi("CursorLine",    "", s:gui00, "", s:cterm00, "none", "")
call <sid>hi("CursorLineNr",  s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call <sid>hi("QuickFixLine",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("PMenu",         s:gui05, s:gui01, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:gui0C, s:gui05, s:cterm0C, s:cterm05, "bold", "")
hi PMenuSel blend=0
call <sid>hi("NormalFloat",   s:gui05, s:gui02, s:cterm05, s:cterm02, "none", "")

" TabLine
" We must clear first to get rid of some conflicting defaults...
hi clear TabLine
hi clear TabLineFill
hi clear TabLineSel
call <sid>hi("TabLine",       s:gui04, "", s:cterm04, "", "none", "")
call <sid>hi("TabLineFill",   s:gui01, "", s:cterm01, "", "none", "")
call <sid>hi("TabLineSel",    s:gui0C, "", s:cterm0C, "", "bold", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:gui04, "", s:cterm04, "", "italic", "")
call <sid>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:gui05, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:gui0D, "", s:cterm0D, "", "", "")  " make Statements same as Functions
call <sid>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Type",         s:gui0A, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("csAttribute",             s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("csModifier",              s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",     "none", "#2a4517", "none", s:cterm0B, "", "")
call <sid>hi("DiffChange",  "none", "#404040", "none", s:cterm03, "", "")
call <sid>hi("DiffDelete",  "none", "#631414", "none", s:cterm08, "", "")
call <sid>hi("DiffText",    "none", "#0b3260", "none", s:cterm0D, "", "")
call <sid>hi("DiffAdded",   "none", "#2a4517", "none", s:cterm0B, "", "")
call <sid>hi("DiffFile",    "none", "#631414", "none", s:cterm08, "", "")
call <sid>hi("DiffNewFile", "none", "#2a4517", "none", s:cterm0B, "", "")
call <sid>hi("DiffLine",    "none", "#0b3260", "none", s:cterm0D, "", "")
call <sid>hi("DiffRemoved", "none", "#631414", "none", s:cterm08, "", "")

" Git highlighting
call <sid>hi("gitcommitOverflow",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("gitcommitSummary",        s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("gitcommitComment",        s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitUntracked",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitDiscarded",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitSelected",       s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("gitcommitHeader",         s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("gitcommitSelectedType",   s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitUnmergedType",   s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitDiscardedType",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("gitcommitBranch",         s:gui09, "", s:cterm09, "", "bold", "")
call <sid>hi("gitcommitUntrackedFile",  s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("gitcommitUnmergedFile",   s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitDiscardedFile",  s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("gitcommitSelectedFile",   s:gui0B, "", s:cterm0B, "", "bold", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",                 s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",              s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",              s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",        s:gui0E, s:gui01, s:cterm0E, s:cterm01, "", "")
call <sid>hi("GitGutterAddLineNr",           s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChangeLineNr",        s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call <sid>hi("GitGutterDeleteLineNr",        s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDeleteLineNr",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "bold", "")
call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "italic", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "", "")
" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsStatement",         s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsReturn",            s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsThis",              s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("jsClassDefinition",   s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("jsFunction",          s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsFuncName",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsFuncCall",          s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassFuncName",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("jsClassMethodType",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("jsRegexpString",      s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("jsGlobalObjects",     s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("jsGlobalNodeObjects", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("jsExceptions",        s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("jsBuiltins",          s:gui0A, "", s:cterm0A, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("mailURL",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("mailEmail",    s:gui0D, "", s:cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpMethodsVar",      s:gui0C, "", s:cterm0C, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonInclude",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonStatement", s:gui0E, "", s:cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     s:gui08, "none", s:cterm08, "none", "undercurl", s:gui08)
call <sid>hi("SpellLocal",   s:gui0C, "none", s:cterm0C, "none", "undercurl", s:gui0C)
call <sid>hi("SpellCap",     s:gui0D, "none", s:cterm0D, "none", "undercurl", s:gui0D)
call <sid>hi("SpellRare",    s:gui0E, "none", s:cterm0E, "none", "undercurl", s:gui0E)

" Java highlighting
call <sid>hi("javaOperator",     s:gui0D, "", s:cterm0D, "", "", "")

" Lsp Diagnostics
call <sid>hi("LspDiagnosticsError", s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("LspDiagnosticsWarning", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("LspDiagnosticsInformation", s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("LspDiagnosticsHint", s:gui06, "", s:cterm06, "", "", "")
call <sid>hi("LspDiagnosticsSignError", s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("LspDiagnosticsSignWarning", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("LspDiagnosticsSignInformation", s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("LspDiagnosticsSignHint", s:gui06, "", s:cterm06, "", "", "")

" Lsp Saga
call <sid>hi("LspSagaLightBulb", "none", "none", "none", "none", "", "")
call <sid>hi("LspSagaLightBulbSign", "none", s:gui01, "none", s:cterm01, "", "")

" coveragepy.vim
call <sid>hi("NoCoverage", s:gui08, "", s:cterm08, "", "bold", "")
call <sid>hi("NoBranchCoverage", s:gui0A, "", s:cterm0A, "", "bold", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
