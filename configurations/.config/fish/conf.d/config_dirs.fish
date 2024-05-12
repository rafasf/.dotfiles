set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# Many applications need explicit configuration to not put configuration in the
# home folder
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -gx LESSHISTFILE $XDG_CACHE_HOME/less/history
set -gx VOLTA_HOME $XDG_DATA_HOME/volta
set -gx ANDROID_HOME $XDG_DATA_HOME/android
set -gx HISTFILE $XDG_STATE_HOME/bash/history

# Create basic configuration variables
set -gx DOTS $HOME/.dotfiles
