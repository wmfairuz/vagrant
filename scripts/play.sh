#!/usr/bin/env bash

# Test if Play Framework is installed
ls ~/play-2.0/play > /dev/null 2>&1
PLAY_IS_INSTALLED=$?

# True, if Play is not installed
if [[ $PLAY_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Play Framework"
  wget -q http://download.playframework.org/releases/play-2.0.zip
  unzip -q play-2.0.zip
  printf "\n# Add play location to PATH\n%s" 'export PATH=$PATH:~/play-2.0' >> /home/vagrant/.bashrc

else
  echo ">>> Play already present in the system"
fi