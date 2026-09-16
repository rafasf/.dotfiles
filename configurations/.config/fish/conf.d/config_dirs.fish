set -gx DOTS $HOME/.dotfiles

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# Tool-specific homes, kept out of $HOME
set -gx NPM_CONFIG_INIT_MODULE $XDG_CONFIG_HOME/npm/config/npm-init.js
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx GOPATH $XDG_DATA_HOME/go
set -gx VOLTA_HOME $XDG_DATA_HOME/volta
set -gx GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -gx ANDROID_HOME $XDG_DATA_HOME/android
set -gx LESSHISTFILE $XDG_CACHE_HOME/less/history
