import os
import sys

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# load autoconfig
config.load_autoconfig()

# UI
c.zoom.default = "125%"
c.completion.height = "30%"
c.downloads.position = "bottom"
c.url.start_pages = ["https://github.com/", "https://gitlab.com/"]
c.url.default_page = "https://search.brave.com"
c.colors.webpage.preferred_color_scheme = "dark"

# languages
c.spellcheck.languages = ["en-US", "de-DE"]

# sessions
c.session.lazy_restore = True
c.auto_save.session = True

# tabs
c.tabs.position = "left"
c.tabs.width = "15%"
c.tabs.padding = {"bottom": 0, "left": 2, "right": 0, "top": 0}
c.tabs.select_on_remove = "last-used"
c.tabs.mode_on_change = "restore"
c.tabs.title.format_pinned = c.tabs.title.format
c.colors.tabs.bar.bg = "#303030"
c.colors.tabs.even.fg = "black"
c.colors.tabs.pinned.even.fg = "black"

# aliases / custom command chains
c.aliases["close"] = "close ;; set tabs.show always"
c.aliases["split"] = "tab-clone -w ;; set tabs.show never"

# key mappings
c.bindings.key_mappings = {"<Alt+Down>": "J", "<Alt+Up>": "K"}

# bindings
config.bind(";A", "hint links spawn buku -a {hint-url}")
config.bind("<Alt+o>", "spawn buku_run")
config.bind("<Alt+Tab>", "tab-focus last")
config.bind("A", "spawn buku -a {url}")
config.bind("m", "spawn umpv {url}")
config.bind(";m", "hint links spawn umpv {hint-url}")
config.bind(";M", "hint --rapid links spawn umpv {hint-url}")
config.bind("t", "cmd-set-text -s :open -t")
config.bind("xt", "config-cycle tabs.show always never")
config.bind("xT", "config-cycle tabs.position left top")
config.bind("<Tab>", "nop")
config.bind("<Ctrl+=>", "config-cycle zoom.default 75% 90% 100% 125% 150% 175% 200%")
config.bind("<Ctrl+->", "config-cycle zoom.default 200% 175% 150% 125% 100% 90% 75%")
# disable bookmark and quickmark related default keybindings
config.bind("M", "nop")
config.bind("b", "nop")
config.bind("B", "nop")
config.bind("Sb", "nop")
config.bind("Sq", "nop")
config.bind("gb", "nop")
config.bind("gB", "nop")
config.bind("wb", "nop")
config.bind("wB", "nop")

# search engines
c.url.searchengines = {
    "DEFAULT": "https://search.brave.com/search?q={}",
    "ap": "https://www.archlinux.org/packages/?q={}",
    "aur": "https://aur.archlinux.org/packages/?K={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "c": "https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={}&button=",
    "d": "https://www.dict.cc/?s={}",
    "g": "https://www.github.com/search?&q={}",
    "h": "https://hoogle.haskell.org/?hoogle={}",
    "m": "https://man.archlinux.org/search?q={}&go=Go",
    "p": "https://docs.python.org/3/search.html?q={}",
    "r": "https://doc.rust-lang.org/std/?search={}",
    "w": "https://en.wikipedia.org/w/index.php?search={}&title=Special:Search",
    "y": "https://www.youtube.com/results?search_query={}",
}

# enable JavaScript
config.set("content.javascript.enabled", True, "file://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

# set user agent
user_agent_path = os.path.join(os.path.abspath(os.path.dirname(__file__)), "user_agent.txt")
if os.path.exists(user_agent_path):
    with open(user_agent_path, "r", encoding="utf-8") as user_agent:
        c.content.headers.user_agent = user_agent.read().replace("\n", "")

# patterns
with config.pattern("*://web.whatsapp.com/") as p:
    p.content.notifications.enabled = True

# with config.pattern("*://github.com/") as p:
#     p.content.javascript.clipboard = "access"

# fonts
c.fonts.default_family = "monospace"
c.fonts.default_size = "10pt"

# editor
c.editor.command = [
    "wezterm",
    "start",
    "--",
    os.path.expanduser("~/.local/bin/nvim"),
    "-f",
    "{file}",
    "-c",
    "normal {line}G{column0}l",
]
