local wezterm = require'wezterm'

local function is_inside_vim(pane)
  local tty = pane:get_tty_name()
  if tty == nil then return false end

  local success, stdout, stderr = wezterm.run_child_process
    { 'sh', '-c',
      'ps -o state= -o comm= -t' .. wezterm.shell_quote_arg(tty) .. ' | ' ..
      'grep -iqE \'^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$\'' }

  return success
end

local function is_outside_vim(pane) return not is_inside_vim(pane) end

local function bind_if(cond, key, mods, action)
  local function callback (win, pane)
    if cond(pane) then
      win:perform_action(action, pane)
    else
      win:perform_action(wezterm.action.SendKey({key=key, mods=mods}), pane)
    end
  end

  return {key=key, mods=mods, action=wezterm.action_callback(callback)}
end

wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

return {
    check_for_updates = false,

    enable_wayland = false,

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
        -- navigator.nvim integration
        bind_if(is_outside_vim, "h", "ALT", wezterm.action.ActivatePaneDirection('Left')),
        bind_if(is_outside_vim, "j", "ALT", wezterm.action.ActivatePaneDirection('Down')),
        bind_if(is_outside_vim, "k", "ALT", wezterm.action.ActivatePaneDirection('Up')),
        bind_if(is_outside_vim, "l", "ALT", wezterm.action.ActivatePaneDirection('Right')),
        bind_if(is_outside_vim, "H", "ALT|SHIFT", wezterm.action.AdjustPaneSize{'Left', 5}),
        bind_if(is_outside_vim, "J", "ALT|SHIFT", wezterm.action.AdjustPaneSize{'Down', 5}),
        bind_if(is_outside_vim, "K", "ALT|SHIFT", wezterm.action.AdjustPaneSize{'Up', 5}),
        bind_if(is_outside_vim, "L", "ALT|SHIFT", wezterm.action.AdjustPaneSize{'Right', 5}),

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
