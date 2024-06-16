# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# if running bash
# load ~/.bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# load ~/.local/bin bins if they exist
# for cmd in "$HOME"/.local/bin/* ; do
    # [ -e "$cmd" ] || continue
    # . "$cmd"
# done
# unset -v cmd 

PATH=""

# add user's private bins to path
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin"
fi
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$PATH:$HOME/.cargo/bin"
fi

# add all-users bins to path
if [ -d "/usr/local/bin" ] ; then
    PATH="$PATH:/usr/local/bin"
fi
if [ -d "/usr/local/go/bin" ] ; then
    PATH="$PATH:/usr/local/go/bin"
fi
if [ -d "/usr/bin" ] ; then
    PATH="$PATH:/usr/bin"
fi
if [ -d "/bin" ] ; then
    PATH="$PATH:/bin"
fi

export PATH

# export cargo (Rust package manager)
if [ -d "$HOME/.cargo/env" ] ; then
    export GTK2_RC_FILES=/home/vanderson/.gtkrc-2.0
    . "$HOME/.cargo/env"
fi

# export Node Version Manager
if [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
fi

# This loads Node Version Manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads Node Version Manager bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Use ed as our line editor and vi as our visual editor
export EDITOR=ed
export VISUAL=vim

# Editor to be used with the 'sudoedit' command
export SUDO_EDITOR=$VISUAL

# Use less as my pager
export PAGER=less

# fzf command
#export FZF_DEFAULT_COMMAND="find . -type f -o -type d -name '.*' -print 2>/dev/null | sed 1d"
export FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -type f -print'
export FZF_DEFAULT_OPTS="--prompt='' --pointer=' ❯' --color=16 --info=hidden"

# bat command
export BAT_THEME="Solarized (dark)"

# Use lynx as our terminal browser
export BROWSER=lynx

# sdkman command
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
