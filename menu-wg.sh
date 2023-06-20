#!/bin/bash
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
echo -e "\e[94m    |                     WIREGUARD MENU                 |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e "\e[0m                                                               "
echo -e ""
echo -e "\e[1;31m* [1]\e[0m \e[0;97m: Create Wireguard Account\e[0m"
echo -e "\e[1;31m* [2]\e[0m \e[0;97m: Delete Wireguard Account\e[0m"
echo -e "\e[1;31m* [3]\e[0m \e[0;97m: Check User Login Wireguard\e[0m"
echo -e "\e[1;31m* [4]\e[0m \e[0;97m: Extending Wireguard Account Active Life\e[0m"
echo -e "\e[1;31m* [5]\e[0m \e[0;97m: Check Wireguard User Interface\e[0m"
echo -e ""
echo -e ""
read -p "        Select From Options [1-5 or x]: " menuwg
echo -e ""
case $menuwg in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
5)
wg show
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
