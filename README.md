# dotfiles

Manages configurations for fish, neovim, tmux, ghostty, starship, bat,
and other tools using [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
configurations/
  .config/        # XDG config dirs (fish, nvim, tmux, ghostty, ...)
  Library/        # LaunchAgents (XDG vars for the login session)
  .bashrc
  .profile
  .zshenv
bin/              # repo maintenance scripts (make check)
Brewfile          # Homebrew dependencies
Makefile          # setup: stow, brew, tmux plugins, launchd, checks
```

## Setup

1. Install `brew`:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install `stow`:

```sh
brew install stow
```

3. Clone the repository:

```sh
git clone git@github.com:rafasf/dots.git ~/.dotfiles
```

4. Run setup — links configs, installs Brewfile deps (including 1Password,
   ghostty), installs tmux plugins, and registers the XDG LaunchAgent:

```sh
cd ~/.dotfiles && make setup
```

5. Make fish your login shell (one-time, needs your password):

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

6. Open a new shell

`make setup` runs these steps individually if you ever need to re-run just
one of them: `install` (stow), `brew` (Brewfile), `tmux-plugins` (TPM),
`launchctl` (XDG LaunchAgent), `check` (verifies XDG vars agree across
fish/zsh/sh/launchd).
