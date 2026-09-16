function la -d "List all files, including hidden"
    command eza -a --group-directories-first --git --icons=auto $argv
end
