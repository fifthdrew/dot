#!/bin/bash

cd /usr/local/src
tar xvf emacs-29.3.tar.xz &
make uninstall &
make clean &
make distclean
