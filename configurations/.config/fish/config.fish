set fish_greeting ""

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER 'nvim +Man!'

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

# Ctrl+Z toggles between foreground and background (great for nvim)
bind \cz 'fg 2>/dev/null; commandline -f repaint'
