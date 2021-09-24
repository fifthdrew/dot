# Path to your oh-my-zsh installation.
export ZSH="/home/vanderson/.oh-my-zsh"

# ZSH_THEME="minimal"
ZSH_THEME="risto"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
fi

# path to firefox
export PATH=/opt/firefox/firefox:$PATH

# fix terminal colors 
export TERM="xterm-256color"

# path to nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# alias for tmux (to force tmux use terminal colors)
alias tmux="TERM=screen-256color-bce tmux"
