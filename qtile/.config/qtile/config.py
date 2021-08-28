import subprocess
from os.path import expanduser
from libqtile import bar, hook, layout, widget
from libqtile.config import DropDown, Group, Key, ScratchPad, Screen, Match
from libqtile.lazy import lazy

# Variables
mod = 'mod4'
terminal = 'kitty'
browser = 'qutebrowser'


# Keys
keys = [
    # navigate layout
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    # re-arrange layout
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    # re-sizing
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),

    # layout operations
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "Return", lazy.layout.toggle_split()),
    Key([mod], "o", lazy.screen.toggle_group()),

    # window operations
    Key([mod], "t", lazy.window.disable_floating()),
    Key([mod], "m", lazy.window.toggle_minimize()),
    Key([mod], "f", lazy.window.toggle_maximize()),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "u", lazy.spawn("picom-trans -s 100"), desc="Make window opaque"),

    # Switch window focus to other pane(s) of stack
    Key([mod], "Tab", lazy.layout.next(), desc="Switch window focus to other pane(s) of stack"),
    # Swap panes of split stack
    Key([mod, "shift"], "Tab", lazy.layout.rotate(), desc="Swap panes of split stack"),

    # Switch between layouts
    Key([mod], "space", lazy.next_layout(), desc="Switch to next layout"),
    Key([mod, "shift"], "space", lazy.prev_layout(), desc="Switch to previous layout"),

    # Switch between screens
    Key([mod], "w", lazy.prev_screen(), desc="Switch to previous screeen"),
    Key([mod], "e", lazy.next_screen(), desc="Switch to next screeen"),

    # qtile controls
    Key([mod], "b", lazy.hide_show_bar(), desc="Toggle bar"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown qtile"),

    # Spawn commands
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "semicolon", lazy.group["scratchpad"].dropdown_toggle("term")),
    Key([mod], "q", lazy.group["scratchpad"].dropdown_toggle("qtile shell")),
    Key([mod], "p", lazy.spawn("rofi -show combi"), desc="Spawn a command using a prompt widget"),

    # custom user keys
    Key([mod], "z", lazy.spawn("physlock -ms"), desc="lock screen"),
    Key([mod], "x", lazy.spawn("displayctl"), desc="open xrandr display controller"),
    Key([mod], "g", lazy.spawn("trackpoint"), desc="toggle trackpoint-enforcing mode"),
    # rofi utilies
    Key([mod], "a", lazy.spawn("rofi-mpc"), desc="MPC controller"),
    Key([mod], "c", lazy.spawn("rofi -modi calc -show calc -no-show-match -no-sort"),
        desc="calculator"),
    Key([mod], "d", lazy.spawn("rofi -modi json-dict -show json-dict -json-dict-path " +
                               expanduser("~/.local/share/dicts/json") + " -json-dict-mode 2"),
        desc="dictionary"),
    Key([mod], "i", lazy.spawn(
        "rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"),
        desc="clipboard picker"),
    Key([mod], "s", lazy.spawn("rofi-pass"), desc="password picker"),
    Key([mod], "backslash", lazy.spawn("rofimoji"), desc="emoji picker"),
    Key([mod], "y", lazy.spawn(
        'bash -c "feh --bg-fill --randomize ' + expanduser('~/Pictures/Wallpapers/*') + '"'
    ), desc="background"),

    # advanced actions
    Key([], "Print", lazy.spawn('bash -c "maim -uks ' +
                                expanduser("~/Pictures/Screenshots/screenshot_") +
                                '$(date +%s).png"'),
        desc="Screenshot snippet tool"),
    # brightness control
    Key([], "XF86MonBrightnessUp",   lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),
    # volume control
    Key([], "XF86AudioMicMute",     lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")),
    Key([], "XF86AudioMute",        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%")),
    # playerctl
    Key([], "XF86AudioPlay",  lazy.spawn("playerctl play")),
    Key([], "XF86AudioPause", lazy.spawn("playerctl pause")),
    Key([], "XF86AudioPlay",  lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioStop",  lazy.spawn("playerctl stop")),
    Key([], "XF86AudioNext",  lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev",  lazy.spawn("playerctl previous")),
    # dunstctl
    Key(['mod1', 'control'], "space",          lazy.spawn("dunstctl close")),
    Key(['mod1', 'control', 'shift'], "space", lazy.spawn("dunstctl close-all")),
    Key(['mod1', 'control'], "period",         lazy.spawn("dunstctl history-pop")),
    Key(['mod1', 'control'], "comma",          lazy.spawn("dunstctl context")),
    Key(['mod1', 'control'], "semicolon",      lazy.spawn("dunstctl set-paused toggle")),

]


# Groups
groups = [
    Group('1', spawn=terminal + " zsh -ic 'tmux'"),
    Group('2', spawn=browser),
    Group('3'),
    Group('4'),
    Group('5'),
    Group('6'),
    Group('7'),
    Group('8'),
    Group('9', spawn="discord"),
    ScratchPad("scratchpad", [
        DropDown("term", terminal),
        DropDown("qshell", terminal + " qshell"),
    ],
    ),
]

for i in groups:
    if i.name == 'scratchpad':
        continue
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(toggle=False),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])


# Screens
widget_defaults = dict(
    font='monospace',
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()


def my_bluetooth():
    return subprocess.run("""
if bluetoothctl info; then
    echo "<span foreground='#005aaf'></span>";
else
    if bluetoothctl list | grep default; then
        echo "<span foreground='#ffffff'></span>";
    else
        echo "<span foreground='#505050'></span>";
    fi;
fi | tail -1
        """,
                          shell=True,
                          capture_output=True,
                          ).stdout.decode().strip()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(inactive='#505050', hide_unused=True),
                widget.CurrentLayoutIcon(scale=0.75),
                widget.WindowName(for_current_screen=True),
                widget.Spacer(),
                widget.WidgetBox(
                    close_button_location="right",
                    text_open="",
                    text_closed="",
                    fontsize=20,
                    widgets=[
                        widget.Wttr(location={'': ''}),
                        widget.Wlan(interface="wlp3s0", format="📶 {percent:2.0%}"),
                        widget.Net(),
                        widget.NetGraph(samples=30, type="line",
                                        border_color="303030", graph_color="F8C82A"),
                        widget.CPU(format="💻 {load_percent}%"),
                        widget.ThermalSensor(tag_sensor="Package id 0"),
                        widget.CPUGraph(samples=30, type="line",
                                        border_color="303030", graph_color="18BAEB"),
                        widget.Memory(format="{MemUsed: .1f}{mm}/{MemTotal: .1f}{mm}",
                                      measure_mem="G", measure_swap="G"),
                        widget.MemoryGraph(samples=30, type="line",
                                           border_color="303030", graph_color="F14831"),
                    ]),
                widget.GenPollText(func=my_bluetooth, fontsize=28, update_interval=15),
                widget.BatteryIcon(battery=0),
                widget.Battery(battery=0, format="{percent:2.0%}", notify_below=15),
                widget.BatteryIcon(battery=1),
                widget.Battery(battery=1, format="{percent:2.0%}", notify_below=15),
                widget.Volume(emoji=True),
                widget.Volume(emoji=False),
                widget.Clock(format="🕘 %a %d %b %H:%M"),
                widget.Systray(icon_size=24),
            ],
            size=30,
            background='#303030F8',
        )
    )
]


# Layouts
layout_defaults = dict(
    border_focus='#77b2f6',
    border_normal='#969694',
)

layouts = [
    layout.MonadTall(single_border_width=0, **layout_defaults),
    layout.Columns(num_columns=3, **layout_defaults),
    layout.Max(),
]

# TODO make these a list of Match objects rather than dictionaries
# Kept from the default configuration because these appear like reasonable defaults to keep around.
floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    # Run the utility of `xprop` to see the wm class and name of an X client.
    Match(title='branchdialog'),  # gitk
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='pinentry-qt'),  # GPG key password entry
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='matplotlib'),
    Match(wm_class='zoom'),
],
    **layout_defaults)

dgroups_app_rules = []  # type: List


# General settings
follow_mouse_focus = False

# Note: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
# Taken ad verbatim from the default configuration and documentation:
# http://docs.qtile.org/en/latest/manual/config/index.html?highlight=wmname#configuration-variables


# Hooks
@hook.subscribe.startup_once
def autostart():
    subprocess.run('~/.config/qtile/autostart.sh', shell=True)


@hook.subscribe.startup_complete
def after_restart():
    subprocess.run('xmodmap ~/.Xmodmap', shell=True)
    subprocess.run('feh --bg-fill --randomize ~/Pictures/Wallpapers/*', shell=True)
