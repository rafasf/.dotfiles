#

autoload -U compinit && compinit
zmodload -i zsh/complist

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
