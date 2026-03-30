_xdg_file="$HOME/.config/xdgdirs/xdg-dirs"

while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in ''|'#'*) continue ;; esac
    eval "export $line"
done < "$_xdg_file"

unset _xdg_file
