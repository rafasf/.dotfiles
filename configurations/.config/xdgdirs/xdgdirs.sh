config_file=${XDG_CONFIG_HOME}/xdgdirs/xdg-dirs

while read -r line || [[ -n "$line" ]]; do
    valid_line="${line#"${line%%[![:space:]]*}"}"
    valid_line="${valid_line%"${valid_line##*[![:space:]]}"}"
    
    [[ -z "$valid_line" || "$valid_line" =~ ^# ]] && continue
    
    eval "export $valid_line"
done < ${XDG_CONFIG_HOME}/xdgdirs/xdg-dirs

