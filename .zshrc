setopt promptsubst
autoload -U promptinit
promptinit
prompt rsf

autoload -U compinit
compinit

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
#export LSCOLORS="ExFxCxDxBxegedadagacad"
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
alias mkdir='mkdir -p'

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
