# autoload modules
autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
compinit
promptinit

# command completion config
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# key bindings
bindkey -v

# history search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# ttyctl command: freeze/unfreeze terminal
ttyctl -f

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# customize prompt
autoload -U colors && colors
# GIT
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[magenta]}%}[%{${fg[green]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[magenta]}%}]%{$reset_color%} "
# VENV
source /usr/share/zsh/scripts/virtualenv-auto-activate.sh
source /usr/bin/virtualenvwrapper.sh
function virtual_env_prompt () {
    REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt "%F${fg[cyan]}" '%f'
# PROMPT
zstyle ':prompt:grml:left:setup' items rc change-root user at host path virtual-env vcs newline percent
zstyle ':prompt:grml:right:setup' items time sad-smiley

# enable gpg signing
export GPG_TTY=$(tty)

# aliases
alias vi=nvim
alias vim=nvim
alias vimdiff='nvim -d'
alias -s tex=nvim
alias -s org=w3m
alias -s com=w3m

source ~/.zsh_private_aliases
