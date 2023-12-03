function fshow -d "Browse commits"
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "enter:execute:git show (echo {} | grep -o '[a-f0-9]\{7\}') | delta | less -R"
end
