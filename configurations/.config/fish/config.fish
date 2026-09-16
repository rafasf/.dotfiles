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
    # Respect .gitignore and skip .git/ instead of fzf's default `find`
    set -gx FZF_DEFAULT_COMMAND 'fd --hidden --strip-cwd-prefix --exclude .git'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND 'fd --type=d --hidden --strip-cwd-prefix --exclude .git'

    set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
    # Preview: tree for directories, syntax-highlighted contents for files
    set -gx FZF_CTRL_T_OPTS '--preview "[ -d {} ] && eza --tree --color=always --level=2 {} || bat --color=always --style=numbers --line-range=:500 {}"'
    set -gx FZF_ALT_C_OPTS '--preview "eza --tree --color=always --level=2 {}"'

    fzf --fish | source
end

# Ctrl+Z toggles between foreground and background (great for nvim)
bind \cz 'fg 2>/dev/null; commandline -f repaint'
