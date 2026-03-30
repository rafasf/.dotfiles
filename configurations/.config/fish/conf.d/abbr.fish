abbr --add g git

abbr --add v nvim
abbr --add vi nvim
abbr --add vim nvim

abbr --add cat bat

abbr --add gw ./gradlew

# sudo bang-bang: type !! to replace with `sudo <last command>`
abbr --add !! --position anywhere --function _abbr_last_command

# mkdir always creates parents
abbr --add mkdir 'mkdir -p'

# clipboard: pipe output to cb (e.g., `cat file | cb`)
abbr --add cb pbcopy
