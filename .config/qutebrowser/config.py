from os import path
from sys import platform
# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# load autoconfig
config.load_autoconfig()

# UI
if platform == 'darwin':
    c.zoom.default = '100%'
else:
    c.zoom.default = '150%'
c.completion.height = '30%'
c.downloads.position = 'bottom'
c.url.start_pages = ['https://github.com/', 'https://gitlab.com/', 'https://start.duckduckgo.com']

# languages
c.spellcheck.languages = ['en-US', 'de-DE']

# sessions
c.session.lazy_restore = True
c.auto_save.session = True

# tabs
c.tabs.position = 'left'
c.tabs.width = '15%'
c.tabs.padding = {'bottom': 0, 'left': 2, 'right': 0, 'top': 0}
c.tabs.select_on_remove = 'last-used'
c.tabs.mode_on_change = 'restore'
c.colors.tabs.bar.bg = '#303030'
c.colors.tabs.even.fg = 'black'

# aliases / custom command chains
c.aliases['close'] = "close ;; set tabs.show always"
c.aliases['split'] = "tab-clone -w ;; set tabs.show never"

# key mappings
c.bindings.key_mappings = {'<Alt+Down>': 'J', '<Alt+Up>': 'K'}

# bindings
config.bind(';A', 'hint links spawn buku -a {hint-url}')
config.bind('<Alt+o>', 'spawn buku_run')
config.bind('<Alt+p>', 'spawn --userscript qute-pass')
config.bind('<Alt+Tab>', 'tab-focus last')
config.bind('A', 'spawn buku -a {url}')
config.bind('m', 'spawn umpv {url}')
config.bind(';m', 'hint links spawn umpv {hint-url}')
config.bind(';M', 'hint --rapid links spawn umpv {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xt', 'set tabs.show never')
config.bind('xT', 'set tabs.show always')
config.bind('<Tab>', 'nop')

# search engines
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'ap': 'https://www.archlinux.org/packages/?q={}',
        'aur': 'https://aur.archlinux.org/packages/?K={}',
        'aw': 'https://wiki.archlinux.org/?search={}',
        'c': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={}&button=',
        'd': 'https://www.dict.cc/?s={}',
        'g': 'https://www.github.com/search?&q={}',
        'h': 'https://hoogle.haskell.org/?hoogle={}',
        'p': 'https://docs.python.org/3/search.html?q={}',
        'w': 'https://en.wikipedia.org/w/index.php?search={}&title=Special:Search',
        'x': 'https://xkcd.com/{}/',
        'y': 'https://www.youtube.com/results?search_query={}',
        }

# enable JavaScript
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# set user agent
with open(path.join(path.abspath(path.dirname(__file__)), 'user_agent.txt'), 'r') as user_agent:
    c.content.headers.user_agent = user_agent.read().replace('\n', '')

# patterns
with config.pattern('*://web.whatsapp.com/') as p:
    p.content.notifications = True

with config.pattern('*://github.com/') as p:
    p.content.javascript.can_access_clipboard = True
    # from IRC (#qutebrowser): 11:03:56 The-Compiler | it's supposed to work without that setting
    # when it's a result of an user interaction (like a click) - that not working is a Qt issue

# fonts
c.fonts.completion.entry = '10pt default_family'
c.fonts.completion.category = 'bold 10pt default_family'
c.fonts.debug_console = '10pt default_family'
c.fonts.default_family = ['MesloLGS Nerd Font Mono', 'monospace']
c.fonts.downloads = '10pt default_family'
c.fonts.hints = 'bold 10pt default_family'
c.fonts.keyhint = '10pt default_family'
c.fonts.messages.error = '10pt default_family'
c.fonts.messages.info = '10pt default_family'
c.fonts.messages.warning = '10pt default_family'
c.fonts.prompts = '10pt default_family'
c.fonts.statusbar = '10pt default_family'
c.fonts.tabs = '10pt default_family'
