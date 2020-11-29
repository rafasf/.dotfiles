#

# Basics
export TERM=xterm-256color

export EDITOR='vim'
export LESS='--ignore-case --RAW-CONTROL-CHARS -FX'
export PAGER='less'

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Golang
export GOPATH=$HOME/.go

## GPG Agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

## Rust
export PATH="$HOME/.cargo/bin:$PATH"

## Talisman
export TALISMAN_HOME=${HOME}/.talisman/bin

export XDG_CONFIG_HOME=${HOME}/.config
