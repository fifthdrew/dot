#!/bin/bash
sudo xargs -a $HOME/.packages/apt-packages.txt apt-get install -y
