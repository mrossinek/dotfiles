local wezterm = require'wezterm'
local os = require'os'

local move_around = function(window, pane, direction_wez, direction_nvim)
    local result = os.execute("env NVIM_LISTEN_ADDRESS=/tmp/nvim" .. pane:pane_id() ..  " ~/go/bin/wezterm.nvim.navigator " .. direction_nvim)
    if result then
        window:perform_action(wezterm.action({ SendKey = {key=direction_nvim, mods="ALT"} }), pane)
    else
        window:perform_action(wezterm.action({ ActivatePaneDirection = direction_wez }), pane)
    end
end

wezterm.on("move-left", function(window, pane)
    move_around(window, pane, "Left", "h")
end)

wezterm.on("move-right", function(window, pane)
    move_around(window, pane, "Right", "l")
end)

wezterm.on("move-up", function(window, pane)
    move_around(window, pane, "Up", "k")
end)

wezterm.on("move-down", function(window, pane)
    move_around(window, pane, "Down", "j")
end)

return {
    check_for_updates = false,

    scrollback_lines = 10000,

    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,

    font = wezterm.font("Hasklug Nerd Font Mono"),
    adjust_window_size_when_changing_font_size = false,

    colors = {
        foreground = "#f2f2f2",
        background = "#303030",

        cursor_fg = "#303030",
        cursor_bg = "#cccccc",
        cursor_border = "#cccccc",

        ansi = {
            "#2c2c2c",
            "#c62828",
            "#558b2e",
            "#f9a825",
            "#1565c1",
            "#8e42be",
            "#00838f",
            "#ffffff",
        },

        brights = {
            "#969694",
            "#f15250",
            "#86bd47",
            "#f8e63a",
            "#77b2f6",
            "#b933a8",
            "#25c3dc",
            "#ffffff",
        },

        tab_bar = {
            background = "#1c1c1c",
            active_tab = {
                bg_color = "#303030",
                fg_color = "#b0b0b0",
            },
            inactive_tab = {
                bg_color = "#1c1c1c",
                fg_color = "#505050",
            },
            new_tab = {
                bg_color = "#1b1b1b",
                fg_color = "#505050",
            },
        },
    },
    window_background_opacity = 0.975,
    bold_brightens_ansi_colors = false,

    disable_default_key_bindings = true,
    leader = { key='\\', mods="CTRL", timeout_milliseconds=1000 },
    keys = {
        -- copying
        {key="Insert", mods="CTRL", action=wezterm.action{PasteFrom="Clipboard"}},
        {key="Insert", mods="SHIFT", action=wezterm.action{PasteFrom="PrimarySelection"}},
        {key=" ", mods="ALT", action="QuickSelect"},
        {key=" ", mods="CTRL|SHIFT", action="ActivateCopyMode"},
        {key="c", mods="CTRL|SHIFT", action=wezterm.action{CopyTo="ClipboardAndPrimarySelection"}},

        -- search
        {key="/", mods="CTRL", action=wezterm.action{Search={CaseInSensitiveString=""}}},
        {key="?", mods="CTRL|SHIFT", action=wezterm.action{Search={CaseSensitiveString=""}}},

        -- scrolling
        {key="UpArrow", mods="SHIFT", action=wezterm.action{ScrollToPrompt=-1}},
        {key="DownArrow", mods="SHIFT", action=wezterm.action{ScrollToPrompt=1}},

        -- font size
        {key="_", mods="CTRL|SHIFT", action="DecreaseFontSize"},
        {key="+", mods="CTRL|SHIFT", action="IncreaseFontSize"},
        {key="Backspace", mods="CTRL|SHIFT", action="ResetFontSize"},

        -- pane management
        {key="x", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
        {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="|", mods="LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
        {key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
        {key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
        {key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
        {key="H", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        {key="J", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        {key="K", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        {key="L", mods="LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        {key="z", mods="LEADER", action="TogglePaneZoomState"},
        -- wezterm.nvim integration
        {key="h", mods="ALT", action=wezterm.action{EmitEvent="move-left"}},
        {key="j", mods="ALT", action=wezterm.action{EmitEvent="move-down"}},
        {key="k", mods="ALT", action=wezterm.action{EmitEvent="move-up"}},
        {key="l", mods="ALT", action=wezterm.action{EmitEvent="move-right"}},

        -- tab management
        {key="DownArrow", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="DefaultDomain"}},
        {key="LeftArrow", mods="SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
        {key="RightArrow", mods="SHIFT", action=wezterm.action{ActivateTabRelative=1}},
        {key="LeftArrow", mods="SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
        {key="RightArrow", mods="SHIFT", action=wezterm.action{ActivateTabRelative=1}},
        {key="LeftArrow", mods="CTRL", action=wezterm.action{MoveTabRelative=-1}},
        {key="RightArrow", mods="CTRL", action=wezterm.action{MoveTabRelative=1}},
    },
}
