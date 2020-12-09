#

# Basics
export TERM=xterm-256color

export EDITOR='nvim'
export LESS='--ignore-case --RAW-CONTROL-CHARS -FX'
export PAGER='less'

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export XDG_CONFIG_HOME=${HOME}/.config

# Golang
export GOPATH=$HOME/.go

## GPG Agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

## Rust
export PATH="$XDG_CONFIG_HOME/cargo/bin:$PATH"

## Talisman
export TALISMAN_HOME=${XDG_CONFIG_HOME}/talisman/bin

