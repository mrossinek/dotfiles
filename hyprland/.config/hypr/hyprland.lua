-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("AQ_NO_MODIFIERS", "1")
hl.env("HYPRLAND_TRACE", "1")
hl.env("AQ_TRACE", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/gcr/ssh")
hl.env("HYPRSHOT_DIR", "$HOME/Pictures/Screenshots/")

hl.config({
    debug = {
        disable_logs = false,
    },
})

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = "1",
})
hl.monitor({
    output = "desc:Philips Consumer Electronics Company 27E1N1800A UK02416015771",
    mode = "2560x1440@60.00Hz",
    position = "6400x0",
    scale = "1",
})
hl.monitor({
    output = "desc:Philips Consumer Electronics Company 27E1N1800A UK02416015766",
    mode = "3840x2160@29.98Hz",
    position = "2560x0",
    scale = "1",
})
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "wezterm"
local menu = "rofi -show combi"
local webbrowser = "qutebrowser"
local secondarybrowser = "chromium"
local mail = "thunderbird"
local music = "spotify"
local messaging = "discord"
-- local messaging         = "slack"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("mpDris2")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("bitwarden-desktop")
    hl.exec_cmd("XDG_CURRENT_DESKTOP=Unity synology-drive")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-- Autostart applications on specific workspaces
local workspace_autostarts = {
    [1] = terminal,
    [2] = webbrowser,
    [3] = mail,
    [4] = secondarybrowser,
    [7] = music,
    [9] = messaging,
}

hl.on("workspace.created", function(ws)
    local cmd = workspace_autostarts[ws.id]
    if cmd then
        hl.exec_cmd(cmd, { workspace = ws.id })
    end
end)

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
    },

    decoration = {
        rounding = 2,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 0.975,
        inactive_opacity = 0.975,
        fullscreen_opacity = 0.975,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
        -- pseudotile = true,
        use_active_for_splits = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "slave",
        allow_small_split = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = false,
        disable_splash_rendering = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us,us",
        kb_variant = ",intl",
        kb_model = "",
        kb_options = "caps:escape,compose:lwin-altgr,eurosign:e,grp:shifts_toggle",
        kb_rules = "",

        follow_mouse = 2,

        repeat_delay = 250,
        repeat_rate = 80,
        accel_profile = "adaptive",

        sensitivity = 0.5,

        touchpad = {
            natural_scroll = false,
            tap_to_click = false,
        },
    },

    cursor = {
        hide_on_key_press = true,
        hide_on_touch = true,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })

---------------------
---- KEYBINDINGS ----
---------------------

hl.config({
    binds = {
        workspace_back_and_forth = true,
    },
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("toggle_eDP"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + U", hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill -SIGUSR2 waybar"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill -SIGINT waybar && waybar"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("trackpoint"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("rofi-rbw --typer ydotool"))
hl.bind(
    mainMod .. " + D",
    hl.dsp.exec_cmd(
        "rofi -modi json-dict -show json-dict -json-dict-path $HOME/.local/share/dicts/json/ -json-dict-mode 2"
    )
)
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("rofi-mpc"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("rofi -modi calc -show calc -no-show-match -no-sort"))
hl.bind(mainMod .. " + backslash", hl.dsp.exec_cmd("rofimoji --typer xdotool"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Move focus with mainMod + direction keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Move active window with mainMod + SHIFT + direction keys
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- Resize active window with mainMod + CTRL + direction keys
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    -- Switch workspaces with mainMod + [0-9]
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end
hl.bind(mainMod .. " + O", hl.dsp.focus({ workspace = "previous_per_monitor", on_current_monitor = true }))

-- special workspace
hl.bind(mainMod .. " + semicolon", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + semicolon", hl.dsp.window.move({ workspace = "special:scratchpad", follow = true }))

-- scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- master layout bindings
hl.bind(mainMod .. " + tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.layout("orientationcycle left center right"))
-- SPACE is still available!

-- Laptop multimedia keys for LCD brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true })

-- Laptop multimedia keys for volume
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    { repeating = true, locked = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -2%"),
    { repeating = true, locked = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })

-- playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })

-- dunstctl
hl.bind("ALT + CTRL + space", hl.dsp.exec_cmd("dunstctl close"), { locked = true })
hl.bind("ALT + CTRL + SHIFT + space", hl.dsp.exec_cmd("dunstctl close-all"), { locked = true })
hl.bind("ALT + CTRL + period", hl.dsp.exec_cmd("dunstctl history-pop"), { locked = true })
hl.bind("ALT + CTRL + comma", hl.dsp.exec_cmd("dunstctl context"), { locked = true })
hl.bind("ALT + CTRL + semicolon", hl.dsp.exec_cmd("dunstctl set-paused toggle"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "position-scratchpad-terminal",
    match = { workspace = "special:scratchpad", class = "scratchpad" },
    float = true,
    size = { "monitor_w * 0.9", "monitor_h * 0.3" },
    move = { "monitor_w * 0.05", 30 },
})

hl.window_rule({
    name = "float-matplotlib",
    match = { class = "Matplotlib" },
    float = true,
})

hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "wezterm start --class 'scratchpad'" })
