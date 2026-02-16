#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install hostapd
sudo apt install dnsmasq
sudo apt install iptables
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq
