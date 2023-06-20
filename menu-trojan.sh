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
echo -e "\e[94m    |                       Trojan MENU                  |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e ""
echo -e "$RED TRojan             : $(grep -c -E "^###" "/etc/trojan/config.json")${NC}"
echo -e ""
echo -e "\e[1;31m* [1]\e[0m \e[1;32m: Create Trojan Account\e[0m"
echo -e "\e[1;31m* [2]\e[0m \e[1;32m: Deleting Trojan Account\e[0m"
echo -e "\e[1;31m* [3]\e[0m \e[1;32m: Extending Trojan Account Active Life\e[0m"
echo -e "\e[1;31m* [4]\e[0m \e[1;32m: Check User Login Trojan\e[0m"
echo -e ""
echo -e ""
read -p "        Select From Options [1-4 or x]: " menutrojan
echo -e ""
case $menutrojan in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
