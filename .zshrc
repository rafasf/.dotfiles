setopt promptsubst
autoload -U promptinit
promptinit
prompt rsf

autoload -U compinit
compinit

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^k' kill-line
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
bindkey '^p' up-line-or-history
bindkey '^n' down-line-or-history
bindkey '^y' yank
bindkey '^w' backward-kill-word
bindkey '^u' backward-kill-line
bindkey '^h' backward-delete-char
bindkey '^?' backward-delete-char
bindkey '^_' undo
bindkey '^x^r' redisplay
bindkey '\eb' backward-word
bindkey '\ef' forward-word

autoload -U colors
colors

# History sanity
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.history
setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# cd without cd
setopt autocd

# No beep
setopt nobeep

# Enable colors
export CLICOLOR=1
export GREP_OPTIONS="--color=auto"

export EDITOR='vim'

# My project root folder
projets_root="$HOME/Projects"

# Few shortcuts
alias g='git'
alias vi='v'
alias mv='mv -v'
alias cp='cp -v'
alias ll='ls -alh'
alias sr='screen -r'
alias mkdir='mkdir -p'
alias tmux='tmux -2 -u'

mkd() { mkdir -p "$@" && cd "$@"; }
rso() { source "$HOME/.zshrc"; }

p() { cd $projets_root/$1; }
compctl -/ -W $projets_root p

find_it() {
    local count found
    count=1
    found=($(find . -iname "*$2*" -type "$1"))
    for result in $found; do
        echo -e "$fg[yellow]$count$fg[default] $result"
        RESULTS[$count]=$(pwd)/$result
        let count=count+1
    done
}

ff() { find_it "f" "$1"; }
fd() { find_it "d" "$1"; }

v() {
    local result
    if [[ $1 =~ ^[0-9]+$ ]] && [ ! -z ${RESULTS[$1]} ]; then
        result=${RESULTS[$1]}
    fi

    vim ${result:-$@}
}

pall() { for dir in `ls .`; do (cd $dir && git checkout . && git pull --rebase); done; }

export PATH=/usr/local/bin:$PATH

source /opt/boxen/env.sh
