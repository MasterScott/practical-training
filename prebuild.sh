#!/bin/bash

# Notes:
# * Had to disable 3D graphics until I got VM tools installed

# Upgrade the OS

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-pgrade

# Install VM dependencies
# https://docs.vmware.com/en/VMware-Tools/10.1.0/com.vmware.vsphere.vmwaretools.doc/GUID-8B6EA5B7-453B-48AA-92E5-DB7F061341D1.html

sudo apt-get install open-vm-tools open-vm-tools-desktop

# Install Docker
# https://docs.docker.com/install/linux/docker-ce/ubuntu/

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl status docker
#sudo systemctl enable docker

# Add user to docker group to run tools

sudo usermod -aG docker ${USER}

# Install Docker-Compose
# https://docs.docker.com/compose/install/

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
