# dotfiles

## Manual Steps

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
git clone https://github.com/rafasf/dots.git ~/.dotfiles
```

4. Link configurations:

```sh
cd ~/.dotfiles && make
```

5. Open a new shell (there will some errors due missing tools)
6. Install essential tools:

```sh
brew bundle install --file=${DOTS}/Brewfile
```
