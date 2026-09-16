function lt -d "Files: tree view, 2 levels deep"
    command eza --tree --level=2 --group-directories-first --git --icons=auto $argv
end
