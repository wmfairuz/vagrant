#!/usr/bin/env bash

# Test if eclipse is installed
ls ~/eclipse/eclipse > /dev/null 2>&1
ECLIPSE_IS_INSTALLED=$?

# True, if eclipse is not installed
if [[ $ECLIPSE_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Eclipse Kepler"
  wget -q http://download.nus.edu.sg/mirror/eclipse/technology/epp/downloads/release/kepler/SR2/eclipse-jee-kepler-SR2-linux-gtk-x86_64.tar.gz
  tar -zxf eclipse-jee-kepler-SR2-linux-gtk-x86_64.tar.gz
  printf "\n# Add eclipse location to PATH\n%s" 'export PATH=$PATH:~/eclipse' >> /home/vagrant/.bashrc
else
  echo ">>> Eclipse already present in the system"
fi
