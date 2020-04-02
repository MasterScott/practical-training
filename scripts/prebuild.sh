#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Please run as root (sudo)."
    exit 1
fi

# Upgrade the OS

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade

apt-get -y install deborphan 
