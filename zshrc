#
setopt prompt_subst

# Modules
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit && prompt rsf
autoload -U edit-command-line && zle -N edit-command-line

# Keybindings
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

# History sanity
HISTSIZE=4096
SAVEHIST=4096
HISTFILE=$HOME/.zhistory
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

setopt autocd
setopt nobeep
setopt complete_aliases

# Enable colors
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS='exfxcxdxbxegedabagacad'

# Terminal basics
export TERM=xterm-256color
export EDITOR='vim'
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Few shortcuts
alias g='git'
alias vi='vim'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ll='ls -alh'
alias sr='screen -r'
alias mkdir='mkdir -p'
alias tmux='tmux -2 -u'
alias gw='./gradlew'
alias be='bundle exec'

# Create directory and go to it
mcd() { mkdir -p "$@" && cd "$@"; }

# Reload zsh configuration
rso() { source "$HOME/.zshrc"; }

# My project root folder
projets_root="$HOME/Projects"

# cd straight to projects from anywhere
p() { cd $projets_root/$1; }
compctl -/ -W $projets_root p
