# ls
alias ls='ls --color'
alias ll='ls -alh'
alias la='ls -Ah'
alias l='ls -Ch'

# git
alias gst='git status'
alias gcm='git commit -v'

# Midnight Commander
alias mc="mc --nocolor"

# rm
alias rm='rm -i'

# vi(m)
alias vi='echo -ne "\e[2 q"; nvi'
alias vim='echo -ne "\e[2 q"; vim'

# tmux and tmate
alias t='tmux'
alias ta='tmux a -t Default'
alias tt='tmate -S "/tmp/tmate.sock" new-session -d -s "Default"'
alias tta='tmate -S "/tmp/tmate.sock" attach-session -t "Default"'

#ed
alias ed='echo -ne "\e[3 q"; ed -v -p\*'
