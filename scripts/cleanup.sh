#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Please run as root (sudo)."
    exit 1
fi

echo
echo "[*] BEFORE CLEANUP:"
df /dev/sda1

echo "[*] Existing kernels: `sudo dpkg --list | egrep -i --color 'linux-image|linux-headers' | wc -l`"

echo "[*] Removing package caches and old kernels..."
apt-get -y autoremove --purge
apt-get -y clean
apt-get -y autoclean
rm -rf /var/lib/apt/lists/*

echo "[*] Existing kernels: `sudo dpkg --list | egrep -i --color 'linux-image|linux-headers' | wc -l`"

echo "[*] Removing orphaned packages..."
deborphan | xargs apt-get -y remove --purge

echo "[*] Cleaning up home folders..."
rm /root/* 2>/dev/null
rm /home/student/* 2>/dev/null
rm -rf /root/.*_history
rm -rf /root/.cache

echo "[*] Cleaning up log files..."
find /var/log -type f -regex ".*\.gz$" | xargs rm -Rf
find /var/log -type f -regex ".*\.[0-9]$" | xargs rm -Rf
find /tmp -type f -regex ".*\.log$" | xargs rm -Rf
#for i in $(find /var/log -type f); do > $i; done

echo "[*] Cleaning up file backups..."
rm -f /etc/*~
rm -f /etc/*-
rm -f /usr/share/applications/*~
rm -f /usr/share/applications/*-
rm -f /usr/share/desktop-directories/*~
rm -f /usr/share/desktop-directories/*-

echo
echo "[*] AFTER CLEANUP:"
df /dev/sda1

# Reminders
echo
echo "REMINDERS:"
echo "* Did you run Bleachbit (root) first?"
echo "* Did you close all terminals and run this command from a newly opened terminal so it can purge all bash histories?"
echo "* Did you run 'sudo dd if=/dev/zero of=deleteme; sudo rm deleteme' to help purge disk slack space and decrease the final archive?"
echo
