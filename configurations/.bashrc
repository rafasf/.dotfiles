export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/jconfig}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

[[ -f "${XDG_CONFIG_HOME}/xdgdirs/xdgdirs.sh" ]] && source ${XDG_CONFIG_HOME}/xdgdirs/xdgdirs.sh
