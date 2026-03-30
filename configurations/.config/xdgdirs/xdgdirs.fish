set _xdg_file "$HOME/.config/xdgdirs/xdg-dirs"

while read -l line
    set trimmed (string trim "$line")
    if test -z "$trimmed" || string match -q "#*" "$trimmed"
        continue
    end

    set var (string split -m1 = "$line")
    set -gx $var[1] (eval echo (string trim -c '"' $var[2]))
end < $_xdg_file

set -e _xdg_file
