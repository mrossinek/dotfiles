if [[ ! -v GRML_OSTYPE ]]; then
    # if grml was not loaded from system-wide, use a local copy
    source ~/.grml.zshrc
fi

# zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# autoload modules
autoload -Uz compinit promptinit
compinit
promptinit

# command completion config
zinit ice wait"0" blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# key bindings
setopt vi
export KEYTIMEOUT=1

# history search
zinit ice wait"0"
zinit light zsh-users/zsh-history-substring-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# syntax highlighting
zinit ice wait"1" atinit"zpcompinit; zpcdreplay" atload"unset 'FAST_HIGHLIGHT[chroma-whatis]' 'FAST_HIGHLIGHT[chroma-man]'"
zinit light zdharma/fast-syntax-highlighting

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

# aliases
alias vi=nvim
alias vim=nvim
alias vimdiff='nvim -d'
alias -s tex=nvim
alias -s org=w3m
alias -s com=w3m
alias fd='fd -I'  # since the .gitignore in ~ ignores all files
alias open=xdg-open
alias sudo='sudo '

# pygmentize cat
# source: https://felixcrux.com/blog/syntax-highlighting-cat
function pygmentize_cat {
  for arg in "$@"; do
    pygmentize -O style=default -g "${arg}" 2> /dev/null || /bin/cat "${arg}"
  done
}
command -v pygmentize > /dev/null && alias cat=pygmentize_cat

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
