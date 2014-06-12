#!/usr/bin/env bash

# Test if NodeJS is installed
~/node-v0.10.28-linux-x64/bin/node -v > /dev/null 2>&1
NODE_IS_INSTALLED=$?

# Contains all arguments that are passed
NODE_PACKAGES=($@)

# True, if Node is not installed
if [[ $NODE_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Node.js"
  wget -q http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
  tar -zxf node-v0.10.28-linux-x64.tar.gz
  printf "\n# Add npm location to PATH\n%s" 'export PATH=$PATH:~/node-v0.10.28-linux-x64/bin' >> /home/vagrant/.bashrc

else
  echo ">>> Node already present in the system"
fi

# Install (optional) Global Node Packages
if [[ ! -z $NODE_PACKAGES ]]; then
    echo ">>> Start installing Global Node Packages"
    ~/node-v0.10.28-linux-x64/bin/npm install -g --silent ${NODE_PACKAGES[@]}
fi