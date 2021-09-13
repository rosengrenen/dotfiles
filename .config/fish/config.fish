set -x PATH $PATH $HOME/.cargo/bin

alias yay paru
alias j z

abbr --add gst git status
abbr --add gaa git add --all
abbr --add gds git diff --staged
abbr --add gdh git diff HEAD
abbr --add gl git log --oneline --graph

abbr --add ls exa
abbr --add la exa -al
abbr --add l exa -l

abbr --add bat cat

zoxide init fish | source
starship init fish | source
