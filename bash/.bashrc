# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -n "$DISPLAY" ]; then
    xset b off
fi

set bell-style none

DEFAULT_PROMPT_COMMAND="PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '"
SHORT_PROMPT_COMMAND="PS1='${debian_chroot:+($debian_chroot)}\$ '"

PROMPT_COMMAND=$SHORT_PROMPT_COMMAND

CURSOR_SHAPE=3

# Set default prompt
dp() {
    echo -ne "\e[${CURSOR_SHAPE} q"
    PROMPT_COMMAND=$DEFAULT_PROMPT_COMMAND
}

# Set short prompt
sp() {
    echo -ne "\e[${CURSOR_SHAPE} q"
    PROMPT_COMMAND=$SHORT_PROMPT_COMMAND
}

yt() {
    mpv "https://youtu.be/$1"
}

tw() {
    mpv "https://twitch.tv/$1"
}

ddg() {
    # Bad urlencode
    SEARCH="$(echo $* | sed 's|\ |%20|g')"
    lynx "https://lite.duckduckgo.com/lite/?kd=-1&kp=-1&q=${SEARCH}"
}

sb() {
    source ~/.bashrc
}

st() {
    source ~/.tmux.conf
}

echo -ne "\e[${CURSOR_SHAPE} q"
