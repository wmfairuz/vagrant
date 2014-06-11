#!/usr/bin/env bash

# Test if Java is installed
java -version > /dev/null 2>&1
JAVA_IS_INSTALLED=$?

# True, if Node is not installed
if [[ $JAVA_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Oracle JDK 7"
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | sudo tee -a /etc/apt/sources.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
  sudo apt-get update
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
  sudo apt-get -y install oracle-java7-installer oracle-java7-set-default
else
  echo ">>> Java already present in the system"
fi