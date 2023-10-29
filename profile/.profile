# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/opt/firefox/firefox" ] ; then
    PATH="/opt/firefox/firefox:$PATH"
fi

if [ -d "$HOME/.commands" ] ; then
    PATH="$HOME/.commands:$PATH"
fi

if [ -d "$HOME/.scripts" ] ; then
    PATH="$HOME/.scripts:$PATH"
fi

if [ -d "$HOME/.cargo/bin/mprocs" ] ; then
    PATH="$HOME/.cargo/bin/mprocs:$PATH"
fi

if [ -d "/usr/local/bin/aws" ] ; then
    PATH="/usr/local/bin/aws:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
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

export EDITOR=/usr/bin/vim

# Editor to be used with the 'sudoedit' command
export SUDO_EDITOR=$EDITOR

export TERM=xterm-256color

# fzf command
export FZF_DEFAULT_COMMAND="find . -type f -o -type d -name '.*' -print 2>/dev/null | sed 1d"
export FZF_DEFAULT_OPTS="--prompt='' --pointer=' ❯' --color=16 --info=hidden"

# bat command
export BAT_THEME="Solarized (dark)"

# sdkman command
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
