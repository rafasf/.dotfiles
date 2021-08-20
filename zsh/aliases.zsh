#

alias g='git'
alias vi='vim'

alias ll='ls -alh'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias mkdir='mkdir -p'

alias sr='screen -r'

alias gw='./gradlew'
alias be='bundle exec'

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste && echo"

alias talisman=${HOME}/.talisman/bin/talisman_darwin_amd64
