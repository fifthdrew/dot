#!/usr/bin/bash

# Use deb-get to install deb-get.
sudo apt install curl lsb-release wget
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get

#Alternatively, you can download the .deb of deb-get from the releases page and install it manually with
#sudo apt-get install ./path/to/deb-get_<version>.deb
