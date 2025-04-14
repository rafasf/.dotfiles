if test -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
    source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
end

set fish_greeting ""

set -gx EDITOR nvim

# Bootstrap day-to-day tools
if type -q /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end

if type -q fzf
    fzf --fish | source
end

if test -e $XDG_CONFIG_HOME/xdgdirs/xdgdirs.fish
    source $XDG_CONFIG_HOME/xdgdirs/xdgdirs.fish
end
 
