# 📡 Point d’accès Wi-Fi avec hostapd 

## 1. 🎯 Objectif
Dans ce projet nous allons voir comment créer un point d'accès Wi-Fi avec hostapd et que les adresse IP soit attribué automatique via un serveur DHCP

dhcpcd : IP statique
hostapd : hotspots Wi-Fi
dnsmasq : serveur DHCP

## 2. 🖥️ Prérequis
Pour cela il vous faudra :
  - Une carte Wi-Fi avec le mode AP
  - Une carte Eternet

La carte Wi-Fi va permettre de diffuser le hotspots et la carte Ethernet va permettre de fournir la connexion internet au hotspots.

### ⚠️ Attention
Si vous n'avez pas 2 cartes réseau , vous ne pourrez pas faire ce projet.

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
sudo apt install hostapd
sudo apt install dnsmasq
sudo apt install iptables
````
Pour pouvoir faire la configuration nous allons stopper les services :
````bash
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq
````

## 4. 📡 Configurations de l'IP statique sur l'interface Wi-Fi

Pour cela nous allons éditer le fichier :
````bash
sudo nano /etc/dhcpcd.conf
````
Dans ce fichier nous allons dire sur qu'elle interface nous allons mettre cette règle, l'IP statique que nous lui attribuerons :
````java
interface wlan0
static ip_address=192.168.50.1/24
nohook wpa_supplicant
````
Une fois fait nous pouvons maintenant redémarrer le service :
````bash
sudo systemctl restart dhcpcd
````

## 5. ⚙️ Configuration du serveur DHCP 

Après avoir mis une IP statique sur notre carte Wi-Fi, nous pouvons passer à la configuration du serveur DHCP avec dnsmasq

Nous allons d'abord procéder à la sauvegarde du fichier de conf de base :
````bash
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
````

Et éditer le fichier de conf principal :
````bash
sudo nano /etc/dnsmasq.conf
````
Nous allons mettre dedans l'interface qui va être utilisé, la plage IP le masque correspondant et la durée du bail.
Dans notre projet nous avons choisi comme plage IP allant de 192.168.50.10 à 192.168.50.100. Le masque est en /24 donc 255.255.255.0 et le bail durera 24 h.

````bash
interface=wlan0
dhcp-range=192.168.50.10,192.168.50.100,255.255.255.0,24h
````












