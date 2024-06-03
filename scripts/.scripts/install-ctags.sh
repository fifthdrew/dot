#!/bin/bash

cd /usr/local/src 
wget https://github.com/universal-ctags/ctags/releases/download/v6.1.0/universal-ctags-6.1.0.tar.gz
cd ctags
./autogen.sh
# use --prefix=/where/you/want to override installation directory, defaults to /usr/local
./configure --prefix=/usr/local
make
# may require extra privileges depending on where to install
make install 
