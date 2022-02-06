set -x PATH $PATH $HOME/.cargo/bin (yarn global bin)

set -x GPG_TTY (tty)

alias y paru
alias j z

alias gst "git status"
alias gaa "git add --all"
alias ga. "git add ."
alias gds "git diff --staged"
alias gdh "git diff HEAD"
alias gl "git log --oneline --graph"
alias gcm "git commit -m"

alias ls exa
alias l "exa -al"
alias ll "exa -l"

alias cat bat

alias sa "ssh-add -t 3600"
alias sat "ssh-add -t "
alias sad "ssh-add -d"

function forbat --argument-names 'lang'
    switch $lang
        case json
            prettier --parser json | bat --language json --pager "less -RF"
        case js
            prettier --parser babel | bat --language babel --pager "less -RF"
        case '*'
        echo I don\'t know $lang
    end
end
funcsave forbat

zoxide init fish | source
starship init fish | source
