#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Tahniah! Anda Dibenarkan menggunakan Script VPN-BUDAKGERIK...${NC}"
exit 0
fi
clear
else
direct="$(cat ~/log-install.txt | grep -w "XRAY DIRECT" | cut -d: -f2|sed 's/ //g')"
echo -e "      Change Port $direct"
read -p "New Port XRAY DIRECT and XRAY SPLICE: " direct1
if [ -z $direct1 ]; then
echo "Please Input Port"
exit 0
fi

cek=$(netstat -nutlp | grep -w $direct1)
if [[ -z $cek ]]; then
sed -i "s/$direct/$direct1/g" /etc/xray-mini/vless-direct.json
sed -i "s/   - XRAY DIRECT             : $direct/   - XRAY DIRECT             : $direct1/g" /root/log-install.txt
sed -i "s/   - XRAY SPLICE             : $direct/   - XRAY SPLICE             : $direct1/g" /root/log-install.txt
systemctl stop xray-mini@vless-direct > /dev/null
systemctl enable xray-mini@vless-direct > /dev/null
systemctl start xray-mini@vless-direct > /dev/null
systemctl stop xray-mini@vless-splice > /dev/null
systemctl enable xray-mini@vless-splice > /dev/null
systemctl start xray-mini@vless-splice > /dev/null


echo -e "\e[032;1mPort $direct1 modified successfully\e[0m"
else
echo "Port $direct1 is used"
fi