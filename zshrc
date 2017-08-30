#

# The configurations
source "${DOTS}/zsh/options.zsh"
source "${DOTS}/zsh/bindkeys.zsh"
source "${DOTS}/zsh/history.zsh"
source "${DOTS}/zsh/functions.zsh"
source "${DOTS}/zsh/export.zsh"
source "${DOTS}/zsh/aliases.zsh"
source "${DOTS}/zsh/colours.zsh"
source "${DOTS}/zsh/completion.zsh"

# Homeless modules
autoload -U promptinit && promptinit && prompt rsf
autoload -U edit-command-line && zle -N edit-command-line

