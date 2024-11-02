# Command: ls
alias ls='ls --color'
alias ll='ls -alh'
alias la='ls -Ah'
alias l='ls -Ch'

# Command: rm
## Ensures to ask before erase files
alias rm='rm -i'

# Git
alias gst='git status'
alias gcm='git commit -v'

# Midnight Commander
alias mc="mc --nocolor"

# Vi(m)
## Call nvi with block cursor
alias vi='echo -ne "\e[2 q"; nvi'
## Call vim with block cursor
alias vim='echo -ne "\e[2 q"; vim'

# Tmux and Tmate
## Creates a new tmux session named Default or attach to it if already exist
alias t='tmux new -A -s Default'
## Creates a new tmate session named Default, must pass the socket location explicitly
## if the default socket is not in the configuration file
alias tt='tmate new -A -s Default'

# Ed(1)
## Call ed with underline cursor and * prompt
alias ed='echo -ne "\e[3 q"; ed -v -p\*'
