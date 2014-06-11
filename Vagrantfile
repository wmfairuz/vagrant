# -*- mode: ruby -*-
# vi: set ft=ruby :

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
end