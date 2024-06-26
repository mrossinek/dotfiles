export COMMAND_NOT_FOUND=0
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

# Completion for the GitHub and GitLab CLIs
eval "$(gh completion -s zsh)"

# key bindings
setopt vi
bindkey '^x^x' edit-command-line
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

function virtual_env_prompt () {
    REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}
grml_theme_add_token virtual-env -f virtual_env_prompt "%F${fg[cyan]}" '%f'
function conda_env_prompt () {
    REPLY=${CONDA_PROMPT_MODIFIER+${CONDA_PROMPT_MODIFIER:t} }
}
grml_theme_add_token conda-env -f conda_env_prompt "%F${fg[cyan]}" '%f'
grml_theme_add_token percent_nbsp "%# "
# PROMPT
zstyle ':prompt:grml:left:setup' items rc change-root user at host path virtual-env conda-env vcs newline percent_nbsp
zstyle ':prompt:grml:right:setup' items time sad-smiley

# enable gpg signing
export GPG_TTY=$(tty)

export EDITOR=nvim
export BROWSER="xdg-open:qutebrowser"

# less options
export LESS="-iFMRX"

# ddgr: disable history expansion and set bang alias
set +H
alias bang="ddgr --gb --np"

# aliases
alias l='eza -l'
alias ls='eza -l'
alias ll='eza -l'
alias la='eza -la'
alias g=git
alias v=nvim
alias vi=nvim
alias vim=nvim
alias vimdiff='nvim -d'
alias -s tex=nvim
alias -s org=w3m
alias -s com=w3m
alias cat=bat
if [[ "$(uname)" == 'Linux' ]]; then
    alias open=xdg-open
fi
alias ip='ip -c=always'
alias wttr='curl wttr.in'
alias free_mem="echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo swapoff -a && sudo swapon -a"

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
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# Org
export TASKDDATA=~/Backups/taskd
export TIMEWARRIORDB=~/Org/.time

alias org='git -C ~/Org'

alias t=task
alias ti=timew

alias in='task rc.context:none add +in'

tickle_ () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle_
alias tickle=tickle_

org_path_ () {
    local id="${1:s/\./\/}"
    local dir="~/Org/$id"
    local file="$dir/index.norg"
    echo $file
}

note_ () {
    file=$(org_path_ $1)
    file="${file/x#~/$HOME}"
    dir=$(dirname $file)
    mkdir -p $dir:A
    vi "$file"
}
alias n=note_
alias note=note_

backlog_ () {
    note_ $2
    file=$(org_path_ $2)
    task annotate $1 "Moved to backlog: $file"
    task rc.confirmation:0 delete $1
}

alias backlog=backlog_

# coBib git aliases
alias cobib_pull='git -C ~/.local/share/cobib pull origin master'
alias cobib_push='git -C ~/.local/share/cobib push origin master'
