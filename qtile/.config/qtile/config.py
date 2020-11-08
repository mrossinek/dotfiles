from libqtile import bar, hook, layout, widget
from libqtile.command import lazy
from libqtile.config import DropDown, Group, Key, Match, ScratchPad, Screen


# Variables
mod = 'mod4'
terminal = 'kitty'


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

    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "Return", lazy.layout.toggle_split()),
    Key([mod], "o", lazy.screen.toggle_group()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "Tab", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),
    # Swap panes of split stack
    Key([mod, "shift"], "Tab", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Switch between layouts
    Key([mod], "space", lazy.next_layout(),
        desc="Switch to next layout"),
    Key([mod, "shift"], "space", lazy.prev_layout(),
        desc="Switch to previous layout"),

    # qtile controls
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown qtile"),

    # window operations
    Key([mod], "t", lazy.window.disable_floating()),
    Key([mod], "m", lazy.window.toggle_minimize()),
    Key([mod, "shift"], "m", lazy.window.toggle_maximize()),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),

    # Spawn commands
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "semicolon", lazy.group["scratchpad"].dropdown_toggle("term")),
    Key([mod], "p", lazy.spawn("rofi -show combi"),
        desc="Spawn a command using a prompt widget"),
]


# Groups
groups = [
    Group('1', spawn=terminal + " zsh -ic 'tmux'"),
    Group('2', spawn="qutebrowser"),
    Group('3'),
    Group('4'),
    Group('5'),
    Group('6'),
    Group('7'),
    Group('8'),
    Group('9'),  # TODO figure out how to move Slack to here automatically
    ScratchPad("scratchpad", [
            DropDown("term", "kitty"),
        ],
    ),
]

for i in groups:
    if i.name == 'scratchpad':
        continue
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
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

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(inactive='#505050', hide_unused=True),
                widget.WindowName(),
                widget.Spacer(),
                widget.Systray(icon_size=24),
                widget.Clock(format="%a %d %b %I:%M")
            ],
            size=30,
            background='#303030',
        )
    )
]


# subscribe for change of screen setup, just restart if called
@hook.subscribe.screen_change
def restart_on_randr(qtile, ev):
    qtile.cmd_restart()


# Layouts
layout_defaults = dict(
    border_focus='#77b2f6',
    border_normal='#969694',
)

layouts = [
    layout.MonadTall(single_border_width=0, margin=2, **layout_defaults),
    layout.Columns(num_columns=3, **layout_defaults),
    layout.Max(),
]

# TODO make these a list of Match objects rather than dictionaries
# Kept from the default configuration because these appear like reasonable defaults to keep around.
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    # custom additions
    {'wmclass': 'matplotlib'},
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
