#!/usr/bin/env bash

# Test if Google Chrome is installed
google-chrome --version > /dev/null 2>&1
CHROME_IS_INSTALLED=$?

# True, if Node is not installed
if [[ $CHROME_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Google Chrome Stable"
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee -a /etc/apt/sources.list
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo apt-get update
  sudo apt-get -y install google-chrome-stable

fi