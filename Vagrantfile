# -*- mode: ruby -*-
# vi: set ft=ruby :

nodejs_version        = "latest" # By default "latest" will equal the latest stable version
nodejs_packages       = [  		 # List any global NodeJS packages that you want to install
  "less",
  "grunt-cli",
  "bower",
  "yo",
  "generator-webapp",
  "generator-angular"
]

Vagrant.configure("2") do |config|
  # Set server to Debian 7.4
  config.vm.box = "wheezy74"

  config.vm.box_url = "http://192.168.100.148:8081/artifactory/Vagrant/debian-wheezy-7.4-vbox-4.3.6.box"

  config.vm.hostname = "maylab.dev"

  config.vm.provider :virtualbox do |vb|

    vb.customize ["modifyvm", :id, "--name", "Ouranos V2"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.gui = true

  end

  ####
  # Base Items
  ##########

  # Provision Base Packages
  config.vm.provision :shell, :path => "scripts/base.sh", privileged: false

  # Provision Java
  config.vm.provision :shell, :path => "scripts/java.sh", privileged: false

  ####
  # Databases
  ##########

  # Provision Neo4J
  config.vm.provision :shell, :path => "scripts/neo4j.sh", privileged: false

  ####
  # Additional Languages
  ##########

  # Provision Nodejs
  config.vm.provision :shell, :path => "scripts/nodejs.sh", privileged: false, args: nodejs_packages

  ####
  # Frameworks and Tooling
  ##########

  # Provision Play! Framework
  config.vm.provision :shell, :path => "scripts/play.sh", privileged: false

  # Provision Eclipse
  config.vm.provision :shell, :path => "scripts/eclipse.sh", privileged: false

  # Provision Sublime Text
  config.vm.provision :shell, :path => "scripts/st3.sh", privileged: false
end