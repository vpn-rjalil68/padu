#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Tahniah! Anda Dibenarkan menggunakan Script VPN-BUDAKGERIK...${NC}"
exit 0
fi
clear
echo -e "MASUKKAN DOMAIN BARU ATAU TEKAN CTL C UTK EXIT"
echo -e ""
read -p "HOSTANME/DOMAIN: " host
rm -f /var/lib/premium-script/ipvps.conf
rm -f /etc/v2ray/domain
rm -f /etc/xray/domain
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /etc/xray/domain
clear
#recert
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\e[0m'
sleep 1
echo -e "${ORANGE}=============================================${NC}"
echo -e "${BGBLUE} RECERT V2RAY                            ${NC}"
echo -e "${ORANGE}=============================================${NC}"
sleep 1
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop v2ray
systemctl stop v2ray@none
systemctl stop v2ray@vless.service
systemctl stop v2ray@vnone.service
systemctl stop trojan
systemctl stop xray-mini@vless-direct
systemctl stop xray-mini@vless-splice

~/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl start v2ray
systemctl start v2ray@none
systemctl start v2ray@vless.service
systemctl start v2ray@vnone.service
systemctl start trojan
systemctl start xray-mini@vless-direct
systemctl start xray-mini@vless-splice
echo Done
sleep 0.5
clear
echo -e "${ORANGE}=============================================${NC}"
echo -e "${BGBLUE} PERTUKARAN DOMAIN SELESAI                 ${NC}"
echo -e "${ORANGE}=============================================${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu