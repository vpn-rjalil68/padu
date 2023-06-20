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
echo -e "\e[94m    |                    XRAY VLESS MENU                 |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e ""
echo -e "$RED XRay XTLS DIRECT   : $(grep -c -E "^###" "/etc/xray-mini/vless-direct.json")${NC}"
echo -e "$RED XRay XTLS SPLICE   : $(grep -c -E "^###" "/etc/xray-mini/vless-splice.json")${NC}"
echo -e ""
echo -e "\e[1;31m* [1]\e[0m \e[1;32m: Create XRAY Vless\e[0m"
echo -e "\e[1;31m* [2]\e[0m \e[1;32m: Deleting XRAY Vless\e[0m"
echo -e "\e[1;31m* [3]\e[0m \e[1;32m: Extending XRAY Account Active Life\e[0m"
echo -e ""
echo -e ""
read -p "        Select From Options [1-3 or x]: " menuxray
echo -e ""
case $menuxray in
1)
add-xray
;;
2)
del-xray
;;
3)
renew-xray
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
