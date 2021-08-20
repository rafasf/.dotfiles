# Clear PATH, starting fresh
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

# Load rbenv if present
if which rbenv &> /dev/null; then
  export PATH="${HOME}/.rbenv/bin:${PATH}"
  eval "$(rbenv init -)"
fi


# Create basic configuration variables
DOTS=$HOME/.dotfiles
CUSTOM=$DOTS/custom

fpath=($DOTS/resources $fpath)
typeset -U fpath

# Load custom shell scripts
if [[ -d "$CUSTOM" ]]; then
    for custom_file ($CUSTOM/*.zsh) source $custom_file
fi
source "${HOME}/.config/cargo/env"
