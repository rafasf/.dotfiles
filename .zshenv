DOTS=$HOME/dotfiles
CUSTOM=$DOTS/custom

fpath=($DOTS/resources $fpath)
typeset -U fpath

PATH=$PATH:$HOME/.rvm/bin
if [[ -d "$CUSTOM" ]]; then
    for custom_file ($CUSTOM/*.zsh) source $custom_file
fi
