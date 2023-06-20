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
echo -e "\e[94m    |               Shadowsocks OBFS MENU                |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e "\e[0m                                                               "
echo -e ""
echo -e "\e[1;31m* [1]\e[0m \e[0;97m: Creating Shadowsocks Account\e[0m"
echo -e "\e[1;31m* [2]\e[0m \e[0;97m: Delete Shadowsocks Account\e[0m"
echo -e "\e[1;31m* [3]\e[0m \e[0;97m: Extending Shadowsocks Account Active Life\e[0m"
echo -e "\e[1;31m* [4]\e[0m \e[0;97m: Check User Login Shadowsocks\e[0m"
echo -e ""
echo -e ""
read -p "        Select From Options [1-4 or x]: " menuss
echo -e ""
case $menuss in
1)
add-ss
;;
2)
del-ss
;;
3)
renew-ss
;;
4)
cek-ss
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
