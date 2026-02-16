# 📡 Point d’accès Wi-Fi avec hostapd 
## 1. 🎯 Objectif
Dans ce projet nous allons voir comment créer un point d'accès Wi-Fi avec hostapd et que les adresse IP soit attribué automatique via un serveur DHCP

## 2. 🖥️ Prérequis
Pour cela il vous faudra :
  - Une carte Wi-Fi avec le mode AP
  - Une carte Eternet

La carte Wi-Fi va permettre de diffuser le hotspots et la carte Ethernet va permettre de fournir la connexion internet au hotspots.

### ⚠️ Attention
Si vous n'avez pas 2 carte résau, vous ne pourrez pas faire ce projet.

Pour savoir si la carte Wi-Fi dispose d'un mode AP, il faudra aller dans le terminal et faire la commande :
````bash
iw list | grep "AP"
````

## 3. 📦 Installation des pasquets
Nous allons d'abord faire la mise à jour du système.
````bash
sudo apt update && sudo apt upgrade
````
Maintenant nous pouvons passer aux téléchargements des paquets hostapd, dnsmasq et iptables :
````bash
sudo apt update
sudo apt install hostapd dnsmasq iptables
````






