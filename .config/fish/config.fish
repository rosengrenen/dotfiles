set -x PATH $PATH $HOME/.cargo/bin

set -x GPG_TTY (tty)

alias yay paru
alias j z

abbr --add gst git status
abbr --add gaa git add --all
abbr --add gds git diff --staged
abbr --add gdh git diff HEAD
abbr --add gl git log --oneline --graph
abbr --add gcm git commit -m

abbr --add ls exa
abbr --add la exa -al
abbr --add l exa -l

abbr --add cat bat

zoxide init fish | source
starship init fish | source
