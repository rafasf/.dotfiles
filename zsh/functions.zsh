#

# Create directory and go to it
mcd() { mkdir -p "$@" && cd "$@"; }

# Reload zsh configuration
rso() { source "$HOME/.zshrc"; }

# Fancy Git Log
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# Get git commit sha
fcs() {
  local commits commit

  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) \
    && commit=$(echo "$commits" | fzf --cycle --tac +s +m -e --ansi --reverse) \
    && echo -n $(echo "$commit" | sed "s/ .*//")
}

# Select & rebase
freb() {
  local commit=$(fcs)
  [[ -n "$commit" ]] && git rebase -i "$commit"
}
