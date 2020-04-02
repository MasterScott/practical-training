#!/bin/bash

if [ "$(id -u)" == "0" ]; then
    echo "Please do *NOT* run as root (sudo)."
    exit 1
fi

# Install targets

cd /opt/practical-training/targets
sudo docker-compose build
sudo docker-compose pull proxy db
sudo docker-compose up -d
echo -e "127.0.0.1\tpwnedhub.com" | sudo tee -a /etc/hosts
echo -e "127.0.0.1\tapi.pwnedhub.com" | sudo tee -a /etc/hosts

# Install tools

# BeEF, CeWL, Nikto, Nmap, SQLmap, SSLyze
cd /opt/practical-training/tools
sudo docker-compose build

# Install other tools

# Firefox (if not already installed by default)
sudo apt-get install firefox

# Fuzzdb
cd /opt/practical-training/tools
git clone --depth 1 https://github.com/fuzzdb-project/fuzzdb.git

# PyScripter-er
cd /opt/practical-training/tools/burp
git clone --depth 1 https://github.com/lanmaster53/pyscripter-er.git

# Burp
cd /opt/practical-training/tools/burp
if [ ! -z "$1" ] && [ "$1" == "test"]
then
    bash "$(ls -t burpsuite_comm* | head -n1)"
else
    bash "$(ls -t burpsuite_pro* | head -n1)"
fi

# Add launch scripts to the path

sudo chmod +x /opt/practical-training/bin/*
echo 'export PATH="$PATH:/opt/practical-training/bin"' >> ~/.bashrc
source ~/.bashrc

# TODO
# * bind tmp to Downloads?
# * Firefox Add-ons: FoxyProxy and Wappalyzer
# * JPEXS Flash Decompiler (FFDec)
