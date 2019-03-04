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
c.colors.tabs.bar.bg = '#2E2E2D'
c.colors.tabs.even.fg = 'black'

# key mappings
c.bindings.key_mappings = {'<Alt+Down>': 'J', '<Alt+Up>': 'K'}

# bindings
config.bind(';A', 'hint links spawn buku -a {hint-url}')
config.bind('<Alt+o>', 'spawn buku_run')
config.bind('<Alt+p>', 'spawn --userscript qute-pass')
config.bind('A', 'spawn buku -a {url}')
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('m', 'spawn mpv {url}')
config.bind('xt', 'set tabs.show never')
config.bind('xT', 'set tabs.show always')

# search engines
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'ap': 'https://www.archlinux.org/packages/?q={}', 'archwiki': 'https://wiki.archlinux.org/?search={}', 'arxiv': 'https://arxiv.org/search/?query={}', 'aur': 'https://aur.archlinux.org/packages/?K={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'cpp': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={}&button=', 'd': 'https://www.dict.cc/?s={}', 'dict': 'https://www.dict.cc/?s={}', 'g': 'https://www.github.com/search?&q={}', 'github': 'https://www.github.com/search?&q={}', 'package': 'https://www.archlinux.org/packages/?q={}', 'w': 'https://en.wikipedia.org/w/index.php?search={}&title=Special:Search', 'wikipedia': 'https://en.wikipedia.org/w/index.php?search={}&title=Special:Search', 'x': 'https://hayoo.fh-wedel.de/?query={}', 'xmonad': 'https://hayoo.fh-wedel.de/?query={}', 'y': 'https://www.youtube.com/results?search_query={}', 'youtube': 'https://www.youtube.com/results?search_query={}'}

# enable JavaScript
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# web.whatsapp "hack"
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36'

# fonts
c.fonts.monospace = '"Inconsolata", "xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'
c.fonts.completion.entry = '14pt monospace'
c.fonts.completion.category = 'bold 14pt monospace'
c.fonts.debug_console = '14pt monospace'
c.fonts.downloads = '14pt monospace'
c.fonts.hints = 'bold 14pt monospace'
c.fonts.keyhint = '14pt monospace'
c.fonts.messages.error = '14pt monospace'
c.fonts.messages.info = '14pt monospace'
c.fonts.messages.warning = '14pt monospace'
c.fonts.prompts = '14pt monospace'
c.fonts.statusbar = '14pt monospace'
c.fonts.tabs = '14pt monospace'

