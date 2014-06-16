#!/usr/bin/env bash

# Test if Maven is installed
~/apache-maven-3.2.1/bin/mvn -v > /dev/null 2>&1
MVN_IS_INSTALLED=$?

# True, if Maven is not installed
if [[ $MVN_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Maven"
  wget -q http://www.webhostingjams.com/mirror/apache/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz
  tar -zxf apache-maven-3.2.1-bin.tar.gz
  printf "\n# Add Maven location to PATH\n%s" 'export PATH=$PATH:~/apache-maven-3.2.1/bin' >> /home/vagrant/.bashrc

else
  echo ">>> Maven already present in the system"
fi
