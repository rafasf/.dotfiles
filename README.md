# dotfiles

## Manual Steps

After installing rcm

```bash
rcup -d .dotfiles -x README.md -x resources -x zsh
```

```bash
sh -c "curl -fLo ${XDG_CONFIG_HOME}/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
```

```bash
ln -s ${HOME}/.dotfiles/init.vim ${XDG_CONFIG_HOME}/nvim/
```
