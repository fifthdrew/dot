# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
fi

# ls
alias ll='ls -alh'
alias la='ls -Ah'
alias l='ls -Ch'

# git
alias gst='git status'

# Midnight Commander
# alias mc="mc --nocolor"
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

# rm
alias rm='rm -i'

# vi(m)
alias vif='vi $(fzf)'

# tmux
alias ta='tmux a -t Default'
