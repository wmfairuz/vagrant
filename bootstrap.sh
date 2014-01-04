#!/usr/bin/env bash
############# MODIFY HERE #################
NAME="Fairuz Wan Ismail"
EMAIL="fairuz.ismail@maylab.my"
SSH_PASSPHRASE="passphrase"
DB_NAME="crm"
DB_USER="crm"
DB_PASS="password"
DB_HOST="localhost"
############# ########### #################

yum -y update

# Build stuff
yum -y install java-1.7.0-openjdk.x86_64 java-1.7.0-openjdk-devel.x86_64 
yum -y install ant

# MYSQL
yum -y install mysql-server
chkconfig --add mysqld
chkconfig mysqld on
service mysqld start
mysql -u root -e "CREATE database $DB_NAME"
mysql -u root -e "CREATE USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$DB_PASS'"
mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'$DB_HOST'"
mysql -u root -e "FLUSH PRIVILEGES"

# GIT
yum -y install git-core
git config --global color.ui auto
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
su - vagrant -c "ssh-keygen -q -t rsa -C $EMAIL -f ~/.ssh/id_rsa -N $SSH_PASSPHRASE"

echo
echo -e "\e[1;31mCopy SSH public key below to the server (e.g Gerrit, Github, ...).\e[0m"
su - vagrant -c "cat ~/.ssh/id_rsa.pub"
echo
