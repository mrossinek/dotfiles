if [[ ! -v GRML_OSTYPE ]]; then
    # if grml was not loaded from system-wide, use a local copy
    source ~/.grml.zshrc
fi

# autoload modules
autoload -Uz compinit promptinit
compinit
promptinit

# command completion config
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# key bindings
setopt vi
export KEYTIMEOUT=1

# history search
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# syntax highlighting
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


# ttyctl command: freeze/unfreeze terminal
ttyctl -f

# customize prompt
autoload -U colors && colors
# GIT
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[magenta]}%}[%{${fg[green]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[magenta]}%}]%{$reset_color%} "
# forgit plugin
source ~/.zsh/plugins/forgit/forgit.plugin.zsh

# grml options
# change the cursor when in vicmd mode
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        printf "\033[2 q"
    else
        printf "\033[6 q"
    fi
}
zle -N zle-keymap-select

zle-line-init () {
    zle -K viins
    printf "\033[6 q"
}
zle -N zle-line-init

if [[ -x /usr/bin/virtualenvwrapper.sh ]]; then
    source /usr/bin/virtualenvwrapper.sh
elif [[ -x /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
function virtual_env_prompt () {
    REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt "%F${fg[cyan]}" '%f'
grml_theme_add_token percent_nbsp "%# "
# PROMPT
zstyle ':prompt:grml:left:setup' items rc change-root user at host path virtual-env vcs newline percent_nbsp
zstyle ':prompt:grml:right:setup' items time sad-smiley

# enable gpg signing
export GPG_TTY=$(tty)

export EDITOR=nvim
export BROWSER="xdg-open:qutebrowser"

# less options
export LESS="-iFMRX"

# nnn options
export NNN_OPTS="erx"
export NNN_TRASH=1

# ddgr: disable history expansion and set bang alias
set +H
alias bang="ddgr --gb --np"

# aliases
alias la='ls -lA -v'
alias vi=nvim
alias vim=nvim
alias vimdiff='nvim -d'
alias -s tex=nvim
alias -s org=w3m
alias -s com=w3m
alias cat=bat
alias fd='fd -I'  # since the .gitignore in ~ ignores all files
alias sudo='sudo '
if [[ "$(uname)" == 'Linux' ]]; then
    alias open=xdg-open
fi

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

source ~/.zsh_private_aliases

# direnv
eval "$(direnv hook zsh)"

# basic options
setopt ALWAYS_TO_END
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
