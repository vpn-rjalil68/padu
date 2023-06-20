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
echo -e "\e[94m    |                 SSH & OpenVPN MENU                 |    "
echo -e "\e[94m    '----------------------------------------------------'    "
echo -e "\e[0m                                                               "
echo -e ""
echo -e "\e[1;31m* [1]\e[0m  \e[0;97m: Create SSH & OpenVPN Account\e[0m"
echo -e "\e[1;31m* [2]\e[0m  \e[0;97m: Generate SSH & OpenVPN Trial Account\e[0m"
echo -e "\e[1;31m* [3]\e[0m  \e[0;97m: Extending SSH & OpenVPN Account Active Life\e[0m"
echo -e "\e[1;31m* [4]\e[0m  \e[0;97m: Delete SSH & OpenVPN Account\e[0m"
echo -e "\e[1;31m* [5]\e[0m  \e[0;97m: Check User Login SSH & OpenVPN\e[0m"
echo -e "\e[1;31m* [6]\e[0m  \e[0;97m: Daftar Member SSH & OpenVPN\e[0m"
echo -e "\e[1;31m* [7]\e[0m  \e[0;97m: Delete User Expired SSH & OpenVPN\e[0m"
echo -e "\e[1;31m* [8]\e[0m  \e[0;97m: Set up Autokill SSH\e[0m"
echo -e "\e[1;31m* [9]\e[0m  \e[0;97m: Displays Users Who Do Multi Login SSH\e[0m"
echo -e "\e[1;31m* [10]\e[0m \e[0;97m: Restart Service Dropbear, Squid3, OpenVPN dan SSH\e[0m"
echo -e ""
echo -e ""
read -p "        Select From Options [1-10 or x]: " menussh
echo -e ""
case $menussh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete 
;;
8)
autokill
;;
9)
ceklim 
;;
10)
restart 
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
