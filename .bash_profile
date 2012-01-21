myLocation=$(dirname $(readlink -n $BASH_SOURCE))

source ${myLocation}/resources/git-ps1.sh
source ${myLocation}/resources/git-completion.bash

export PATH=/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH

export EDITOR='vim'

export CLICOLOR=true
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

alias g='git'
alias ll='ls -alh'
alias mkdir='mkdir -p'
alias p='cd ~/Projects'
alias v='vim'

function mkd() { 
    mkdir -p "$@" && cd "$@" 
}

function rso() {
    source ~/.bash_profile
}
