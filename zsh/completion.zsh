#

autoload -U compinit && compinit
zmodload -i zsh/complist

# Auto-complete from the project folder
projets_root="$HOME/Projects"
p() { cd $projets_root/$1; }
compctl -/ -W $projets_root p

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
