# dotfiles

## Manual Steps

```bash
sh -c "curl -fLo ${XDG_DATA_HOME}/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
```

```bash
ln -s ${HOME}/.dotfiles/init.vim ${XDG_DATA_HOME}/nvim/
```
