#!/bin/sh

sudo apt-get update -y
sudo apt-get -y upgrade
sudo apt-get install curl unzip perl xtables-addons-common libtext-csv-xs-perl libmoosex-types-netaddr-ip-perl iptables-persistent -y 
sudo mkdir /usr/share/xt_geoip

sudo wget -4 -O /usr/local/bin/geo-update.sh https://raw.githubusercontent.com/69learn/rocket-shh-panel/master/geo-update.sh

chmod 755 /usr/lib/xtables-addons/xt_geoip_build
bash /usr/local/bin/geo-update.sh

sudo iptables -A OUTPUT -m geoip -p tcp --destination-port 80 --dst-cc IR -j DROP
sudo iptables -A OUTPUT -m geoip -p tcp --destination-port 443 --dst-cc IR -j DROP
iptables-save
clear
echo -e "Blocked Port 80 and 443 Iran \n" 

