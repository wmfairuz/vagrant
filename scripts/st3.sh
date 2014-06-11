#!/usr/bin/env bash

# Test if Sublime Text 3 is installed
ls ~/sublime_text_3/sublime_text > /dev/null 2>&1
ST3_IS_INSTALLED=$?

# True, if ST3 is not installed
if [[ $ST3_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Sublime Text 3"
  wget -q http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3059_x64.tar.bz2
  tar -jxf sublime_text_3_build_3059_x64.tar.bz2
  printf "\n# Add st3 location to PATH\n%s" 'export PATH=$PATH:~/sublime_text_3' >> /home/vagrant/.bashrc
else
  echo ">>> ST3 already present in the system"
fi


