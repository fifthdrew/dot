#!/usr/bin/bash

# SOURCE: shorturl.at/ekmNU
apt() {
  command nala "$@"
}

sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}
