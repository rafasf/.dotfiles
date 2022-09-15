#

# Basics
export TERM=xterm-256color

export EDITOR='nvim'
export LESS='--ignore-case --RAW-CONTROL-CHARS -FX'
export PAGER='less'

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export CLICOLOR=1

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git";

export XDG_CONFIG_HOME=${HOME}/.config
#export XDG_DATA_HOME=${HOME}/.local

# Golang
export GOPATH=/usr/local/go
export PATH=$PATH:$GOPATH/bin

## GPG Agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

## Rust
export PATH="$XDG_CONFIG_HOME/cargo/bin:$PATH"

## Talisman
export TALISMAN_HOME=${XDG_CONFIG_HOME}/talisman/bin

