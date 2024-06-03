#!/bin/bash

# 1. Install the build dependencies for Emacs:
apt build-dep emacs -y &
apt install libtree-sitter-dev -y &

# 2. Download and unpack the Emacs archive:
cd /usr/local/src
wget http://mirrors.nav.ro/gnu/emacs/emacs-29.3.tar.xz &
tar xvf emacs-29.3.tar.xz &

# 3. Install Emacs in /usr/local/emacs/
cd emacs-29.3/
./autogen.sh &
./configure --prefix="/usr/local/emacs/29.3" --without-compress-install --with-native-compilation --with-json --with-mailutils --with-tree-sitter CC=gcc-12 &
# Replace the number 4 with the number of cores that your CPU has.
# NOTE: If you're using Wayland, you might want to consider compiling Emacs 29 with the '--with-pgtk' option as well.
make -j 4 &
make install &
make clean &

# 4. Remove source files in /usr/local/src/
cd ..
rm -R emacs-29.3/

# 5. Creat symlinks in /usr/local/bin/ and /usr/local/emacs
ln -s /usr/local/emacs/current /usr/local/emacs/29.3
ln -s /usr/local/bin/emacs /usr/local/emacs/current/bin/emacs

# 5. Create .desktop 
