set config_file "$XDG_CONFIG_HOME/xdgdirs/xdg-dirs"

while read -l line
    set trimmed (string trim "$line")
    if test -z "$trimmed" || string match -q "#*" "$trimmed"
        continue
    end

    set var (string split -m1 = "$line")
    set var_name $var[1]
    set var_value (string trim -c '"' $var[2])

    set resolved_value (eval echo $var_value)

    set -gx $var_name "$resolved_value"
end < $config_file

