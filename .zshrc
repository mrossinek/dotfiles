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

# enable gpg signing
export GPG_TTY=$(tty)

# aliases
alias vi=nvim
alias vim=nvim
alias vimdiff='nvim -d'
alias mutt='tmuxp load mail'
alias -s tex=nvim
alias -s org=w3m
alias -s com=w3m

source ~/.zsh_private_aliases
