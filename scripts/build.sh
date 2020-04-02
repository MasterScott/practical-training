#!/bin/bash

if [ "$(id -u)" == "0" ]; then
    echo "Please do *NOT* run as root."
    exit 1
fi

# Install targets

cd /opt/practical-training/targets
docker-compose build
docker-compose pull proxy db
docker-compose up -d
echo -e "127.0.0.1\tpwnedhub.com" | sudo tee -a /etc/hosts
echo -e "127.0.0.1\tapi.pwnedhub.com" | sudo tee -a /etc/hosts

# Install tools

# BeEF, CeWL, Nikto, Nmap, SQLmap, SSLyze
cd /opt/practical-training/tools
docker-compose build

# Install other tools

# Firefox (if not already installed by default)
sudo apt-get install firefox

# Fuzzdb
cd /opt/practical-training/tools
sudo git clone --depth 1 https://github.com/fuzzdb-project/fuzzdb.git

# PyScripter-er
cd /opt/practical-training/tools/burp
sudo git clone --depth 1 https://github.com/lanmaster53/pyscripter-er.git

# Burp
cd /opt/practical-training/tools/burp
PREFIX="burpsuite_pro"
if [ ! -z "$1" ] && [ "$1" == "test"]
then
    PREFIX="burpsuite_comm"
fi
find . -type f -name "$PREFIX*" -exec bash {} \;

# Add launch scripts to the path

echo 'export PATH="$PATH:/opt/practical-training/bin"' >> ~/.bashrc
source ~/.bashrc

# TODO
# bind tmp to Downloads?
# Firefox Add-ons: FoxyProxy and Wappalyzer
# JPEXS Flash Decompiler (FFDec)
#FFDEC_VERSION=$(curl -s https://api.github.com/repos/jindrapetrik/jpexs-decompiler/releases/latest | grep '"tag_name":' | sed -E 's/.*"version([^"]+)".*/\1/')
#curl -O https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version$FFDEC_VERSION/ffdec_$FFDEC_VERSION.deb
