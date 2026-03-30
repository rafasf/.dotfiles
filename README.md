# dotfiles

Manages configurations for fish, neovim, tmux, ghostty, starship, yazi, bat,
and other tools using [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
configurations/
  .config/        # XDG config dirs (fish, nvim, tmux, ghostty, ...)
  .bashrc
  .profile
  .zshenv
Brewfile          # Homebrew dependencies
Makefile          # stow wrapper
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

4. Link configurations:

```sh
cd ~/.dotfiles && make
```

5. Install tools:

```sh
brew bundle install --file=~/.dotfiles/Brewfile
```

6. Open a new shell
