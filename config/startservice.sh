#!/bin/bash
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo apt install iptables-persistent
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl enable dnsmasq
sudo systemctl start hostapd
sudo systemctl start dnsmasq