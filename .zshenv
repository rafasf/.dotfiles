DOTS=$HOME/.dots
CUSTOM=$DOTS/custom

fpath=($DOTS/resources $fpath)
typeset -U fpath

if [[ -d "$CUSTOM" ]]; then
    for custom_file ($CUSTOM/*.zsh) source $custom_file
fi

export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

