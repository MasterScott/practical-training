#!/bin/bash

# Upgrade the OS

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-pgrade

# Install targets

cd /opt/practical-training/targets
sudo docker-compose build
sudo docker-compose pull proxy db
sudo docker-compose up -d
echo -e "127.0.0.1\tpwnedhub.com" | sudo tee -a /etc/hosts
echo -e "127.0.0.1\tapi.pwnedhub.com" | sudo tee -a /etc/hosts

# Install tools

cd /opt/practical-training/tools
#network_mode: "host" and remove predefined host
# bind tmp to Downloads?
sudo docker-compose build

# Install other tools

sudo apt-get install firefox
cd  /home/student/Downloads
git clone --depth 1 https://github.com/fuzzdb-project/fuzzdb.git .
git clone --depth 1 https://github.com/lanmaster53/pyscripter-er.git .

# Add launch scripts to the path

sudo chmod +x /opt/practical-training/bin/*
echo 'export PATH="$PATH:$HOME/opt/practical-training/bin"' >> ~/.bashrc
source ~/.bashrc

# TODO

# * Firefox Add-ons: FoxyProxy and Wappalyzer
# * Burp Suite Pro
# * JPEXS Flash Decompiler (FFDec)
