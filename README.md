# dotfiles

## Manual Steps

```bash
brew install stow
cd ~/.dotfiles && make
```

```bash
sh -c "curl -fLo ${XDG_CONFIG_HOME}/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
```
