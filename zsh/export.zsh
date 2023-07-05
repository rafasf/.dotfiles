#

# Basics
export TERM=xterm-256color

export EDITOR='nvim'
export LESS='--ignore-case --RAW-CONTROL-CHARS -FX'
export PAGER='less'

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export CLICOLOR=1

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git";

## GPG Agent
#export GPG_TTY="$(tty)"
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent
