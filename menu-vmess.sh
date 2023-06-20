#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
clear
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo ''
figlet VPN-BUDAKGERIK | lolcat
echo -e "\e[0m                                                       "
echo -e "\e[94m    .----------------------------------------------------.    "
echo -e "\e[94m    |                      V2RAY VMESS MENU              |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e ""
echo -e "$RED VMess Non TLS      : $(grep -c -E "^###" "/etc/v2ray/none.json")${NC}"
echo -e "$RED VMess TLS          : $(grep -c -E "^###" "/etc/v2ray/config.json")${NC}"
echo -e ""
echo -e "\e[1;31m* [1]\e[0m \e[0;97m: Create V2RAY Vmess Websocket Account\e[0m"
echo -e "\e[1;31m* [2]\e[0m \e[0;97m: Deleting V2RAY Vmess Websocket Account\e[0m"
echo -e "\e[1;31m* [3]\e[0m \e[0;97m: Extending Vmess Account Active Life\e[0m"
echo -e "\e[1;31m* [4]\e[0m \e[0;97m: Check User Login V2RAY\e[0m"
echo -e ""
echo -e ""
read -p "        Select From Options [1-5 or x]: " menuvmess
echo -e ""
case $menuvmess in
1)
add-ws
;;
2)
del-ws
;;
3)
renew-ws
;;
4)
cek-ws
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
