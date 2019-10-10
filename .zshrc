# zplugin
source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# autoload modules
autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
compinit
promptinit

# command completion config
zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# syntax highlighting
zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" atload"unset 'FAST_HIGHLIGHT[chroma-whatis]' 'FAST_HIGHLIGHT[chroma-man]'"
zplugin light zdharma/fast-syntax-highlighting

# key bindings
bindkey -v

# history search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

zplugin ice wait"1"
zplugin light zsh-users/zsh-history-substring-search

# ttyctl command: freeze/unfreeze terminal
ttyctl -f

# customize prompt
autoload -U colors && colors
# GIT
zplugin ice wait"1" as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[magenta]}%}[%{${fg[green]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[magenta]}%}]%{$reset_color%} "

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
alias fd='fd -I'  # since the .gitignore in ~ ignores all files

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

# color theme
export THEME='dark'
# this variable is used to sync the color themes of tmux, vim and other
# terminal based applications

source ~/.zsh_private_aliases

# direnv
eval "$(direnv hook zsh)"
