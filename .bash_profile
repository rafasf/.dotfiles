myLocation=$(dirname $(readlink -n $BASH_SOURCE))

source ${myLocation}/resources/git-ps1.sh
source ${myLocation}/resources/git-completion.bash

export EDITOR='vim'

export HISTCONTROL=erasedups
shopt -s histappend

export CLICOLOR=true
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

projets_root="$HOME/Projects"

alias g='git'
alias p='cd $projets_root/$1'
alias vi='v'
alias mv='mv -v'
alias cp='cp -v'
alias ll='ls -alh'
alias mkdir='mkdir -p'

function find_it() {
    local count=1
    local found=$(find . -iname "*$2*" -type "$1")
    for result in $found; do
        echo -e "${YELLOW}$count${RESET} $result"
        RESULTS[$count]=$(pwd)/$result
        let count=count+1
    done
}

function ff() { find_it f "$1"; }
function fd() { find_it d "$1"; }

function v() {
    local result
    if [[ $1 =~ ^[0-9]+$ ]] && [ ! -z ${RESULTS[$1]} ]; then
        result=${RESULTS[$1]}
    fi

    vim ${result:-$@}
}

function mkd() { 
    mkdir -p "$@" && cd "$@" 
}

function rso() {
    source "$HOME/.bash_profile"
}

_projects() {
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $( compgen -S/ -d $projets_root/$cur | sed -e s#$projets_root/##) )
}
complete -o nospace -F _projects p

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
