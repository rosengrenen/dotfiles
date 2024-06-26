set -x PATH $PATH $HOME/.cargo/bin $HOME/.yarn/bin $HOME/go/bin $HOME/.local/bin

set -x GPG_TTY (tty)
set -x EDITOR nvim

alias y paru
alias j z
alias v nvim
alias vim nvim
alias zj zellij

alias gst "git status"
alias gaa "git add --all"
alias ga. "git add ."
alias gds "git diff --staged"
function gdh --argument-names 'reach'
    if count $argv > /dev/null
        git diff HEAD~$reach
    else
        git diff HEAD
    end
end
alias gl "git log --oneline --graph"
alias gcm "git commit -m"

alias ls exa
alias l "exa -al"
alias ll "exa -l"

alias cat bat

alias sa "ssh-add -t 3600"
alias sat "ssh-add -t "
alias sad "ssh-add -d"

alias sus sudo

alias dc "docker compose"
alias dcu "docker compose up -d"
alias dcl "docker compose logs -f"
alias dcps "docker compose ps"
alias dce "docker compose exec"
alias dcs "docker compose stop"
alias dcd "docker compose down"
alias dcdv "docker compose down -v"
alias dcr "docker compose restart"

alias lg lazygit

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

function bluehead
    bluetoothctl power on
    bluetoothctl connect 94:DB:56:8E:74:D9 
end

function fish_greeting
    set -l toon (random choice {default,bud-frogs,moose,small,tux,vader})
    fortune -s | cowsay -f $toon | lolcat
end

zoxide init fish | source
starship init fish | source
