# load ~/.profile regardless of shell version
if [ -e "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

# load .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
