-- A base16 colorscheme for Neovim
-- Colors were adapted from the PaperColor and OceanicNext schemes

-- GUI color definitions
local gui00 = "#1b1b1b"
local gui01 = "#343434"
local gui02 = "#4f4f4f"
local gui03 = "#656565"
local gui04 = "#a7a7a7"
local gui05 = "#c0c0c0"
local gui06 = "#d3d3d3"
local gui07 = "#e9e9e9"
local gui08 = "#c62828"
local gui09 = "#db6827"
local gui0A = "#f0a825"
local gui0B = "#558b2e"
local gui0C = "#00838f"
local gui0D = "#1565c1"
local gui0E = "#8e42be"
local gui0F = "#ab7957"

-- Neovim terminal colors
vim.g.terminal_color_0 =  "#2c2c2c"
vim.g.terminal_color_1 =  "#c62828"
vim.g.terminal_color_2 =  "#558b2e"
vim.g.terminal_color_3 =  "#f9a825"
vim.g.terminal_color_4 =  "#1565c1"
vim.g.terminal_color_5 =  "#8e42be"
vim.g.terminal_color_6 =  "#00838f"
vim.g.terminal_color_7 =  "#ffffff"
vim.g.terminal_color_8 =  "#969694"
vim.g.terminal_color_9 =  "#f15250"
vim.g.terminal_color_10 = "#86bd47"
vim.g.terminal_color_11 = "#f8e63a"
vim.g.terminal_color_12 = "#77b2f6"
vim.g.terminal_color_13 = "#b933a8"
vim.g.terminal_color_14 = "#25c3dc"
vim.g.terminal_color_15 = "#ffffff"
vim.g.terminal_color_background = "#2c2c2c"
vim.g.terminal_color_foreground = "#ffffff"

vim.cmd[[hi clear]]
vim.cmd[[syntax reset]]
vim.g.colors_name = "mrossinek"

-- Highlight Functions and Color definitions

local function high_clear(group)
    vim.api.nvim_command('hi! clear ' .. group)
end

local function high_link(group, link)
    vim.api.nvim_command('hi! link ' .. group .. ' ' .. link)
end

local function high_blend(group, blend)
    vim.api.nvim_command('hi  ' .. group .. ' blend=' .. blend)
end

local function highlight(group, style)
    local fg = ' guifg=NONE'
    local bg = ' guibg=NONE'
    local sp = ' guisp=NONE'
    local blend = nil
    local attr_list = {}
    for attr, value in pairs(style) do
        if attr == 'foreground' then
            fg = ' guifg=' .. value
        elseif attr == 'background' then
            bg = ' guibg=' .. value
        elseif attr == 'special' then
            sp = ' guisp=' .. value
        elseif attr == 'blend' then
            blend = value
        elseif value then
            table.insert(attr_list, attr)
        end
    end
    local attrs = ' gui='
    if #attr_list > 0 then
        attrs = attrs .. table.concat(attr_list, ',')
    else
        attrs = attrs .. 'NONE'
    end

    high_clear(group)

    vim.api.nvim_command(
        'hi! ' .. group .. fg .. bg .. sp .. attrs
    )

    if blend then
        high_blend(group, blend)
    end
end

local function apply_highlight(groups)
    for group, styles in pairs(groups) do
        highlight(group, styles)
    end
end

-- named colors
local named_colors = {
    Grey   = {foreground = gui04},
    Red    = {foreground = gui08},
    Orange = {foreground = gui09},
    Yellow = {foreground = gui0A},
    Green  = {foreground = gui0B},
    Aqua   = {foreground = gui0C},
    Blue   = {foreground = gui0D},
    Purple = {foreground = gui0E},
    Brown  = {foreground = gui0F},
}
apply_highlight(named_colors)

-- basic UI
local basic_ui = {
    Bold          = {bold       = true},
    ColorColumn   = {background = gui00},
    Conceal       = {foreground = gui0D},
    Cursor        = {foreground = gui00, background = gui05},
    CursorColumn  = {background = gui00},
    CursorLine    = {background = gui00},
    CursorLineNr  = {foreground = gui0F, background = gui01},
    Debug         = {foreground = gui08},
    Directory     = {foreground = gui0D},
    Error         = {foreground = gui00, background = gui08},
    ErrorMsg      = {foreground = gui08, background = gui00},
    Exception     = {foreground = gui08},
    FloatBorder   = {foreground = gui05},
    FoldColumn    = {foreground = gui0C, background = gui01},
    Folded        = {foreground = gui01, background = gui03},
    IncSearch     = {foreground = gui01, background = gui09},
    Italic        = {italic     = true},
    LineNr        = {foreground = gui03, background = gui01},
    Macro         = {foreground = gui08},
    MatchParen    = {background = gui03},
    ModeMsg       = {foreground = gui0B},
    MoreMsg       = {foreground = gui0B},
    NonText       = {foreground = gui03},
    Normal        = {foreground = gui05},
    NormalFloat   = {foreground = gui05},
    NormalNC      = {foreground = gui05},
    PMenu         = {foreground = gui05, background = gui01},
    PMenuSel      = {foreground = gui0C, background = gui05, bold   = true, blend = 0},
    Question      = {foreground = gui0D},
    QuickFixLine  = {background = gui01},
    Search        = {foreground = gui01, background = gui0A},
    SignColumn    = {foreground = gui04, background = gui01},
    SpecialKey    = {foreground = gui03},
    SpellBad      = {undercurl  = true, special = gui08},
    SpellCap      = {undercurl  = true, special = gui0D},
    SpellLocal    = {undercurl  = true, special = gui0C},
    SpellRare     = {undercurl  = true, special = gui0E},
    StatusLine    = {foreground = gui05, background = gui02},
    StatusLineNC  = {foreground = gui04, background = gui01},
    Substitute    = {foreground = gui01, background = gui0A},
    Strikethrough = {strikethrough = true},
    TabLine       = {foreground = gui03},
    TabLineFill   = {foreground = gui03},
    TabLineSel    = {foreground = gui0B, bold       = true},
    Title         = {foreground = gui0D, bold       = true},
    TooLong       = {foreground = gui08},
    Underlined    = {underline  = true},
    VertSplit     = {foreground = gui05, background = gui00},
    Visual        = {background = gui02},
    VisualNOS     = {foreground = gui08},
    WarningMsg    = {foreground = gui08},
    WildMenu      = {foreground = gui08, background = gui0A},
    WinBar        = {foreground = gui05},
    WinBarNC      = {foreground = gui04},
    WinSeparator  = {foreground = gui03},
}
apply_highlight(basic_ui)

-- Syntax highlighting
local syntax = {
    Boolean      = {foreground = gui09},
    Character    = {foreground = gui08},
    Comment      = {foreground = gui03, italic = true},
    Conditional  = {foreground = gui0E},
    Constant     = {foreground = gui09},
    Define       = {foreground = gui0E},
    Delimiter    = {foreground = gui0F},
    Float        = {foreground = gui09},
    Function     = {foreground = gui0D},
    Identifier   = {foreground = gui08},
    Include      = {foreground = gui0D},
    Keyword      = {foreground = gui0E},
    Label        = {foreground = gui0A},
    Number       = {foreground = gui09},
    Operator     = {foreground = gui05},
    PreProc      = {foreground = gui0A},
    Repeat       = {foreground = gui0A},
    Special      = {foreground = gui0C},
    SpecialChar  = {foreground = gui0F},
    Statement    = {foreground = gui08},
    StorageClass = {foreground = gui0A},
    String       = {foreground = gui0B},
    Structure    = {foreground = gui0E},
    Tag          = {foreground = gui0A},
    Todo         = {foreground = gui0A},
    Type         = {foreground = gui0A},
    Typedef      = {foreground = gui0A},
}
apply_highlight(syntax)

-- Treesitter
local treesitter = {
    TSAnnotation         = {foreground = gui0F},
    TSAttribute          = {foreground = gui0A},
    TSBoolean            = {foreground = gui09},
    TSCharacter          = {foreground = gui08},
    TSComment            = {foreground = gui03, italic = true},
    TSConditional        = {foreground = gui0E},
    TSConstBuiltin       = {foreground = gui09, italic = true},
    TSConstMacro         = {foreground = gui08},
    TSConstant           = {foreground = gui09},
    TSConstructor        = {foreground = gui0D},
    TSCurrentScope       = {bold = true},
    TSDefinition         = {underline = true, special = gui04 },
    TSDefinitionUsage    = {underline = true, special = gui04 },
    TSEmphasis           = {foreground = gui09, italic = true},
    TSError              = {foreground = gui08},
    TSException          = {foreground = gui08},
    TSField              = {foreground = gui05},
    TSFloat              = {foreground = gui09},
    TSFuncBuiltin        = {foreground = gui0D, italic = true},
    TSFuncMacro          = {foreground = gui08},
    TSFunction           = {foreground = gui0D},
    TSInclude            = {foreground = gui0D},
    TSKeyword            = {foreground = gui0E},
    TSKeywordFunction    = {foreground = gui0E},
    TSKeywordOperator    = {foreground = gui0E},
    TSLabel              = {foreground = gui0A},
    TSLiteral            = {foreground = gui09},
    TSMethod             = {foreground = gui0D},
    TSNamespace          = {foreground = gui08},
    TSNone               = {foreground = gui05},
    TSNumber             = {foreground = gui09},
    TSOperator           = {foreground = gui05},
    TSParameter          = {foreground = gui05},
    TSParameterReference = {foreground = gui05},
    TSProperty           = {foreground = gui05},
    TSPunctBracket       = {foreground = gui05},
    TSPunctDelimiter     = {foreground = gui0F},
    TSPunctSpecial       = {foreground = gui05},
    TSRepeat             = {foreground = gui0E},
    TSStrike             = {foreground = gui00, strikethrough = true},
    TSString             = {foreground = gui0B},
    TSStringEscape       = {foreground = gui0C},
    TSStringRegex        = {foreground = gui0C},
    TSStrong             = {bold = true},
    TSSymbol             = {foreground = gui0B},
    TSTag                = {foreground = gui0A},
    TSTagDelimiter       = {foreground = gui0F},
    TSText               = {foreground = gui05},
    TSTitle              = {foreground = gui0D},
    TSType               = {foreground = gui0A},
    TSTypeBuiltin        = {foreground = gui0A, italic = true},
    TSURI                = {foreground = gui08, underline = true},
    TSUnderline          = {foreground = gui00, underline = true},
    TSVariable           = {foreground = gui08},
    TSVariableBuiltin    = {foreground = gui08, italic = true},
}
apply_highlight(treesitter)
high_link("@attribute", "TSAttribute")
high_link("@boolean", "TSBoolean")
high_link("@character", "TSCharacter")
high_link("@character.special", "SpecialChar")
high_link("@class", "Structure")
high_link("@comment", "TSComment")
high_link("@conditional", "TSConditional")
high_link("@constant", "TSConstant")
high_link("@constant.builtin", "TSConstant")
high_link("@constant.macro", "TSConstant")
high_link("@constructor", "TSConstructor")
high_link("@debug", "Debug")
high_link("@decorator", "Identifier")
high_link("@define", "Define")
high_link("@enum", "Type")
high_link("@enumMember", "Constant")
high_link("@error", "TSError")
high_link("@event", "Identifier")
high_link("@exception", "TSException")
high_link("@field", "TSField")
high_link("@float", "TSFloat")
high_link("@function", "TSFunction")
high_link("@function.builtin", "TSFuncBuiltin")
high_link("@function.call", "TSFunction")
high_link("@function.macro", "TSFuncMacro")
high_link("@include", "TSInclude")
high_link("@interface", "Structure")
high_link("@keyword", "TSKeyword")
high_link("@keyword.function", "TSKeywordFunction")
high_link("@keyword.operator", "TSKeywordOperator")
high_link("@keyword.return", "TSKeyword")
high_link("@label", "TSLabel")
high_link("@method", "TSMethod")
high_link("@method.call", "TSMethod")
high_link("@modifier", "Identifier")
high_link("@namespace", "TSNamespace")
high_link("@none", "TSNone")
high_link("@number", "TSNumber")
high_link("@operator", "TSOperator")
high_link("@parameter", "TSParameter")
high_link("@preproc", "PreProc")
high_link("@property", "TSProperty")
high_link("@punctuation.bracket", "TSPunctBracket")
high_link("@punctuation.delimiter", "TSPunctDelimiter")
high_link("@punctuation.special", "TSPunctSpecial")
high_link("@regexp", "TSStringRegex")
high_link("@repeat", "TSRepeat")
high_link("@storageclass", "StorageClass")
high_link("@string", "TSString")
high_link("@string.escape", "TSStringEscape")
high_link("@string.regex", "TSStringRegex")
high_link("@string.special", "SpecialChar")
high_link("@struct", "Structure")
high_link("@symbol", "TSSymbol")
high_link("@tag", "TSTag")
high_link("@tag.attribute", "TSAttribute")
high_link("@tag.delimiter", "TSTagDelimiter")
high_link("@text", "TSText")
high_link("@text.danger", "DiagnosticError")
high_link("@text.emphasis", "TSEmphasis")
high_link("@text.environment", "Macro")
high_link("@text.environment.name", "Type")
high_link("@text.literal", "TSLiteral")
high_link("@text.math", "Number")
high_link("@text.note", "Tag")
high_link("@text.reference", "TSParameterReference")
high_link("@text.strike", "TSStrike")
high_link("@text.strong", "TSStrong")
high_link("@text.title", "TSTitle")
high_link("@text.todo", "Todo")
high_link("@text.underline", "TSUnderline")
high_link("@text.uri", "TSUri")
high_link("@text.warning", "DiagnosticWarn")
high_link("@type", "TSType")
high_link("@type.builtin", "TSTypeBuiltin")
high_link("@type.definition", "TSType")
high_link("@type.qualifier", "TSType")
high_link("@typeParameter", "Type")
high_link("@variable", "TSVariable")
high_link("@variable.builtin", "TSVariableBuiltin")
high_link("@lsp.type.namespace", "@namespace")
high_link("@lsp.type.type", "@type")
high_link("@lsp.type.class", "@type")
high_link("@lsp.type.enum", "@type")
high_link("@lsp.type.interface", "@type")
high_link("@lsp.type.struct", "@structure")
high_link("@lsp.type.parameter", "@parameter")
high_link("@lsp.type.variable", "@variable")
high_link("@lsp.type.property", "@property")
high_link("@lsp.type.enumMember", "@constant")
high_link("@lsp.type.function", "@function")
high_link("@lsp.type.method", "@method")
high_link("@lsp.type.macro", "@macro")
high_link("@lsp.type.decorator", "@function")

-- LSP
local lsp = {
    DiagnosticError           = {foreground = gui08},
    DiagnosticHint            = {foreground = gui0C},
    DiagnosticInfo            = {foreground = gui05},
    DiagnosticInformation     = {foreground = gui05},
    DiagnosticWarn            = {foreground = gui0E},
    DiagnosticWarning         = {foreground = gui0E},
    DiagnosticSignError       = {foreground = gui08, background = gui01},
    DiagnosticSignHint        = {foreground = gui0C, background = gui01},
    DiagnosticSignInfo        = {foreground = gui05, background = gui01},
    DiagnosticSignInformation = {foreground = gui05, background = gui01},
    DiagnosticSignWarn        = {foreground = gui0E, background = gui01},
    DiagnosticSignWarning     = {foreground = gui0E, background = gui01},
    DiagnosticUnderlineError       = {undercurl = true, special = gui08},
    DiagnosticUnderlineHint        = {undercurl = true, special = gui0C},
    DiagnosticUnderlineInfo        = {undercurl = true, special = gui0F},
    DiagnosticUnderlineInformation = {undercurl = true, special = gui0F},
    DiagnosticUnderlineWarn        = {undercurl = true, special = gui0E},
    DiagnosticUnderlineWarning     = {undercurl = true, special = gui0E},
    LspSignatureActiveParameter   = {foreground = gui0C, italic     = true},
    LspReferenceText              = {underline = true, special = gui04},
    LspReferenceRead              = {underline = true, special = gui04},
    LspReferenceWrite             = {underline = true, special = gui04},
}
apply_highlight(lsp)
high_link("LspDiagnosticsError"       , "DiagnosticError")
high_link("LspDiagnosticsHint"        , "DiagnosticHint")
high_link("LspDiagnosticsInformation" , "DiagnosticInformation")
high_link("LspDiagnosticsWarning"     , "DiagnosticWarning")
high_link("LspDiagnosticsDefaultError"       , "DiagnosticError")
high_link("LspDiagnosticsDefaultHint"        , "DiagnosticHint")
high_link("LspDiagnosticsDefaultInformation" , "DiagnosticInformation")
high_link("LspDiagnosticsDefaultWarning"     , "DiagnosticWarning")
high_link("LspDiagnosticsSignError"       , "DiagnosticSignError")
high_link("LspDiagnosticsSignHint"        , "DiagnosticSignHint")
high_link("LspDiagnosticsSignInformation" , "DiagnosticSignInformation")
high_link("LspDiagnosticsSignWarning"     , "DiagnosticSignWarning")
high_link("LspDiagnosticsUnderlineError"       , "DiagnosticUnderlineError")
high_link("LspDiagnosticsUnderlineHint"        , "DiagnosticUnderlineHint")
high_link("LspDiagnosticsUnderlineInformation" , "DiagnosticUnderlineInformation")
high_link("LspDiagnosticsUnderlineWarning"     , "DiagnosticUnderlineWarning")

-- diff
local diff_add = "#2a4517"
local diff_change = "#404040"
local diff_delete = "#631414"
local diff_text = "#0b3260"
local diff = {
    DiffAdd     = {background = diff_add},
    DiffAdded   = {background = diff_add},
    DiffChange  = {background = diff_change},
    DiffDelete  = {background = diff_delete},
    DiffFile    = {background = diff_delete},
    DiffLine    = {background = diff_text},
    DiffNewFile = {background = diff_add},
    DiffRemoved = {background = diff_delete},
    DiffText    = {background = diff_text},
}
apply_highlight(diff)

-- some more highlights
local user = {
    NvimInternalError = {foreground = gui00, background = gui08},
    User1 = {foreground = gui08, background = gui02},
    User2 = {foreground = gui0E, background = gui02},
    User3 = {foreground = gui05, background = gui02},
    User4 = {foreground = gui0C, background = gui02},
    User5 = {foreground = gui05, background = gui02},
    User6 = {foreground = gui05, background = gui01},
    User7 = {foreground = gui08, background = gui02},
    User8 = {foreground = gui00, background = gui02},
    User9 = {foreground = gui00, background = gui02},
    TreesitterContext = {italic = true},
}
apply_highlight(user)

-- languages
local languages = {}

-- git
languages.git = {
    gitcommitBranch        = {foreground = gui09, bold = true},
    gitcommitComment       = {foreground = gui03},
    gitcommitDiscarded     = {foreground = gui03},
    gitcommitDiscardedFile = {foreground = gui08, bold = true},
    gitcommitDiscardedType = {foreground = gui0D},
    gitcommitHeader        = {foreground = gui0E},
    gitcommitOverflow      = {foreground = gui08},
    gitcommitSelected      = {foreground = gui03},
    gitcommitSelectedFile  = {foreground = gui0B, bold = true},
    gitcommitSelectedType  = {foreground = gui0D},
    gitcommitSummary       = {foreground = gui0B},
    gitcommitUnmergedFile  = {foreground = gui08, bold = true},
    gitcommitUnmergedType  = {foreground = gui0D},
    gitcommitUntracked     = {foreground = gui03},
    gitcommitUntrackedFile = {foreground = gui0A},
}
apply_highlight(languages.git)


-- plugins
local plugins = {}

plugins.coveragepy = {
    NoCoverage = {foreground = gui08, background = gui01, bold = true},
    NoBranchCoverage = {foreground = gui0A, background = gui01, bold = true},
}
apply_highlight(plugins.coveragepy)

plugins.signs = {
    GitSignsAdd = {foreground = gui0B, background = gui01},
    GitSignsAddNr = {foreground = gui0B, background = gui01},
    GitSignsChange = {foreground = gui0A, background = gui01},
    GitSignsChangeNr = {foreground = gui0A, background = gui01},
    GitSignsDelete = {foreground = gui08, background = gui01},
    GitSignsDeleteNr = {foreground = gui08, background = gui01},
    MarkSignHL = {foreground = gui08, background = gui01},
}
apply_highlight(plugins.signs)
high_link("GitSignsCurrentLineBlame", "NonText")

plugins.telescope = {
    TelescopeMatching = {foreground = "Cyan"},
}
apply_highlight(plugins.telescope)
high_link("TelescopeSelection", "CursorLine")

plugins.folke = {
    Twilight = {foreground = gui03},
}
apply_highlight(plugins.folke)

plugins.octo = {
    OctoBubble = {background = gui02},
    OctoEditable = {background = "#363636"},
    OctoGreyFloat =   {foreground = "#2A354C", background = gui02},
    OctoBlueFloat =   {foreground = "#58A6FF", background = gui02},
    OctoYellowFloat = {foreground = "#d3c846", background = gui02},
    OctoPurpleFloat = {foreground = "#6f42c1", background = gui02},
    OctoRedFloat =    {foreground = "#da3633", background = gui02},
    OctoGreenFloat =  {foreground = "#238636", background = gui02},
}
apply_highlight(plugins.octo)
