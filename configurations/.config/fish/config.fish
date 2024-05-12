if test -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
    source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
end

set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

# Manual version of "brew shellenv"
if test -d "/opt/homebrew"
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
    set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
end

# Bootstrap day-to-day tools
if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end
