from os.path import expanduser
# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# load autoconfig
config.load_autoconfig()

# UI
c.zoom.default = '150%'
c.completion.height = '30%'
c.downloads.position = 'bottom'
c.url.start_pages = ['https://github.com/', 'https://start.duckduckgo.com']

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
config.bind(';m', 'hint links spawn mpv {hint-url}')
config.bind('m', 'spawn mpv {url}')
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
with open(expanduser('~/.config/qutebrowser/user_agent.txt'), 'r') as user_agent:
    c.content.headers.user_agent = user_agent.read().replace('\n', '')

# patterns
with config.pattern('*://web.whatsapp.com/') as p:
    p.content.notifications = True

# fonts
c.fonts.monospace = '"InconsolataLGC Nerd Font Mono", monospace'
c.fonts.completion.entry = '12pt monospace'
c.fonts.completion.category = 'bold 12pt monospace'
c.fonts.debug_console = '12pt monospace'
c.fonts.downloads = '12pt monospace'
c.fonts.hints = 'bold 12pt monospace'
c.fonts.keyhint = '12pt monospace'
c.fonts.messages.error = '12pt monospace'
c.fonts.messages.info = '12pt monospace'
c.fonts.messages.warning = '12pt monospace'
c.fonts.prompts = '12pt monospace'
c.fonts.statusbar = '12pt monospace'
c.fonts.tabs = '12pt monospace'
