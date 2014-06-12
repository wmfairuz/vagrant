#!/usr/bin/env bash

# Test if TypeSafe Activator Framework is installed
ls ~/activator-1.2.2/activator > /dev/null 2>&1
ACTIVATOR_IS_INSTALLED=$?

# True, if TypeSafe Activator is not installed
if [[ $ACTIVATOR_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing TypeSafe Activator"
  wget -q http://downloads.typesafe.com/typesafe-activator/1.2.2/typesafe-activator-1.2.2.zip
  unzip -q typesafe-activator-1.2.2.zip
  printf "\n# Add activator location to PATH\n%s" 'export PATH=$PATH:~/activator-1.2.2' >> /home/vagrant/.bashrc

else
  echo ">>> TypeSafe Activator already present in the system"
fi