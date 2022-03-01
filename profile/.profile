export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/opt/firefox/firefox:$PATH

export TERM=xterm-256color

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --prompt='search: ' --pointer='❯' --color=16"
