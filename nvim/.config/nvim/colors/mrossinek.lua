-- base16-vim (https://github.com/chriskempson/base16-vim)
-- by Chris Kempson (http://chriskempson.com)
-- Adapted by Max Rossmannek (https://gitlab.com/mrossinek)
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
    CursorLineNr  = {foreground = gui0A, background = gui01},
    Debug         = {foreground = gui08},
    Directory     = {foreground = gui0D},
    Error         = {foreground = gui00, background = gui08},
    ErrorMsg      = {foreground = gui08, background = gui00},
    Exception     = {foreground = gui08},
    FloatBorder   = {foreground = gui0E},
    FoldColumn    = {foreground = gui0C, background = gui01},
    Folded        = {foreground = gui01, background = gui03},
    IncSearch     = {foreground = gui01, background = vim.g.terminal_color_3},
    Italic        = {italic     = true},
    LineNr        = {foreground = gui03, background = gui01},
    Macro         = {foreground = gui08},
    MatchParen    = {background = gui03},
    ModeMsg       = {foreground = gui0B},
    MoreMsg       = {foreground = gui0B},
    NonText       = {foreground = gui03},
    Normal        = {foreground = gui06},
    NormalFloat   = {foreground = gui06},
    PMenu         = {foreground = gui05, background = gui01},
    PMenuSel      = {foreground = gui0C, background = gui05, bold   = true, blend = 0},
    Question      = {foreground = gui0D},
    QuickFixLine  = {background = gui01},
    Search        = {foreground = gui01, background = vim.g.terminal_color_11},
    SignColumn    = {foreground = gui03, background = gui01},
    SpecialKey    = {foreground = gui03},
    SpellBad      = {foreground = gui08, undercurl  = true, special = gui08},
    SpellCap      = {foreground = gui0D, undercurl  = true, special = gui0D},
    SpellLocal    = {foreground = gui0C, undercurl  = true, special = gui0C},
    SpellRare     = {foreground = gui0E, undercurl  = true, special = gui0E},
    StatusLine    = {foreground = gui04, background = gui02},
    StatusLineNC  = {foreground = gui03, background = gui01},
    Substitute    = {foreground = gui01, background = gui0A},
    Strikethrough = {strikethrough = true},
    TabLine       = {foreground = gui04},
    TabLineFill   = {foreground = gui01},
    TabLineSel    = {foreground = gui0C, bold       = true},
    Title         = {foreground = gui0D, bold       = true},
    TooLong       = {foreground = gui08},
    Underlined    = {underline  = true},
    VertSplit     = {foreground = gui02, background = gui02},
    Visual        = {background = gui02},
    VisualNOS     = {foreground = gui08},
    WarningMsg    = {foreground = gui08},
    WildMenu      = {foreground = gui08, background = gui0A},
}
apply_highlight(basic_ui)

-- Syntax highlighting
local syntax = {
    Boolean      = {foreground = gui09},
    Character    = {foreground = gui08},
    Comment      = {foreground = gui04, italic = true},
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
    Statement    = {foreground = gui0D},
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
    TSURI = {foreground = gui08},
}
apply_highlight(treesitter)

-- LSP
local lsp = {
    DiagnosticError           = {foreground = gui08},
    DiagnosticHint            = {foreground = gui06},
    DiagnosticInformation     = {foreground = gui0C},
    DiagnosticSignError       = {foreground = gui08, background = gui01},
    DiagnosticSignHint        = {foreground = gui06, background = gui01},
    DiagnosticSignInformation = {foreground = gui0C, background = gui01},
    DiagnosticSignWarning     = {foreground = gui0A, background = gui01},
    DiagnosticWarning         = {foreground = gui0A},
    LspSignatureActiveParameter   = {foreground = gui0C, italic     = true},
}
apply_highlight(lsp)
high_link("LspDiagnosticsError"       , "DiagnosticError")
high_link("LspDiagnosticsHint"        , "DiagnosticHint")
high_link("LspDiagnosticsInformation" , "DiagnosticInformation")
high_link("LspDiagnosticsWarning"     , "DiagnosticWarning")
high_link("LspDiagnosticsSignError"       , "DiagnosticSignError")
high_link("LspDiagnosticsSignHint"        , "DiagnosticSignHint")
high_link("LspDiagnosticsSignInformation" , "DiagnosticSignInformation")
high_link("LspDiagnosticsSignWarning"     , "DiagnosticSignWarning")

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

-- languages
local languages = {}

-- will be re-added from previous config as seen fit


-- plugins
local plugins = {}

plugins.coveragepy = {
    NoCoverage = {foreground = gui08, background = gui01, bold = true},
    NoBranchCoverage = {foreground = gui0A, background = gui01, bold = true},
}
apply_highlight(plugins.coveragepy)

plugins.gitsigns = {
    GitSignsAdd = {foreground = gui0B, background = gui01},
    GitSignsAddNr = {foreground = gui0B, background = gui01},
    GitSignsChange = {foreground = gui0A, background = gui01},
    GitSignsChangeNr = {foreground = gui0A, background = gui01},
    GitSignsDelete = {foreground = gui08, background = gui01},
    GitSignsDeleteNr = {foreground = gui08, background = gui01},
}
apply_highlight(plugins.gitsigns)
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
