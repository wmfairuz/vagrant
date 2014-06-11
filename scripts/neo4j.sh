#!/usr/bin/env bash

# Test if Neo4J is installed
~/neo4j-community-2.0.3/bin/neo4j > /dev/null 2>&1
NEO4J_IS_INSTALLED=$?

# True, if Neo4J is not installed
if [[ $NEO4J_IS_INSTALLED -ne 0 ]]; then

  echo ">>> Installing Neo4J"
  wget -q http://dist.neo4j.org/neo4j-community-2.0.3-unix.tar.gz
  tar -zxf neo4j-community-2.0.3-unix.tar.gz
  printf "\n# Add neo4j location to PATH\n%s" 'export PATH=$PATH:~/neo4j-community-2.0.3/bin' >> /home/vagrant/.bashrc

else
  echo ">>> Neo4J already present in the system"
fi