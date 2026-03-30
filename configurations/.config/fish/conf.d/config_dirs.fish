set -gx DOTS $HOME/.dotfiles

set _xdg_file $HOME/.config/xdgdirs/xdgdirs.fish
if test -f $_xdg_file
    source $_xdg_file
end
set -e _xdg_file
