DOTS=$HOME/dots
CUSTOM=$DOTS/custom

fpath=($DOTS/resources $fpath)
typeset -U fpath

if [[ -d "$CUSTOM" ]]; then
    for custom_file ($CUSTOM/*.zsh) source $custom_file
fi
