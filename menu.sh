#!/bin/bash
Lyellow='\e[1;93m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
clear
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))
# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
tele=$(cat /home/contact)
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
clear
echo -e "$green CPU Model            :$CYAN $cname"$NC
echo -e "$green CPU Frequency        :$CYAN $freq MHz"$NC
echo -e "$green Number Of Cores      :$CYAN $cores"$NC
echo -e "$green CPU Usage            :$CYAN $cpu_usage"$NC
echo -e "$green Operating System     :$CYAN "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`$NC
echo -e "$green Kernel               :$CYAN `uname -r`"$NC
echo -e "$green Bash Ver             :$CYAN $versibash"$NC
echo -e "$green Total Amount Of RAM  :$CYAN $tram MB"$NC
echo -e "$green Used RAM             :$CYAN $uram MB"$NC
echo -e "$green Free RAM             :$CYAN $fram MB"$NC
echo -e "$green System Uptime        :$CYAN $uptime $DF( From VPS Booting )"$NC
echo -e "$green Download             :$CYAN $downloadsize GB ( From Startup / VPS Booting )"$NC
echo -e "$green Upload               :$CYAN $uploadsize GB ( From Startup / VPS Booting )"$NC
echo -e "$green ISP NAME             :$CYAN $ISP"$NC
echo -e "$green IP VPS               :$CYAN $IPVPS"$NC
echo -e "$green DOMAIN               :$CYAN $domain"$NC
echo -e "$green City                 :$CYAN $CITY"$NC
echo -e "$green SERVER               :$CYAN $ISP"$NC
echo -e "$green Script Version       :$CYAN $Sver"$NC
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ PREMIUM SCRIPT ]                     ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$Lyellow               SCRIPT VPS by AKUBUDAKGERIK"$NC
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ PANEL MENU ]                          ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$PURPLE (•1) $NC PANEL SSH & OPENVPN  $PURPLE (•5) $NC PANEL VMESS "
echo -e "$PURPLE (•2) $NC PANEL WIREGUARDS     $PURPLE (•6) $NC PANEL VLESS"
echo -e "$PURPLE (•3) $NC PANEL SSR            $PURPLE (•7) $NC PANEL XRAY"
echo -e "$PURPLE (•4) $NC PANEL SS             $PURPLE (•8) $NC PANEL TROJAN"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e ""
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ SISTEM MENU ]                        ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$PURPLE (•9) $NC ADD NEW SUBDOMAIN    $PURPLE (17) $NC LIMIT BANDWITH "
echo -e "$PURPLE (10) $NC RENEW CERTIFICATE    $PURPLE (18) $NC CHECK USAGE "
echo -e "$PURPLE (11) $NC CHANGE PORT          $PURPLE (19) $NC REBOOT VPS "
echo -e "$PURPLE (12) $NC AUTOBACKUP DATA      $PURPLE (20) $NC SPEEDTEST VPS "
echo -e "$PURPLE (13) $NC BACKUP DATA VPS      $PURPLE (21) $NC UPDATE SCRIPT "
echo -e "$PURPLE (14) $NC RESTORE DATA VPS     $PURPLE (22) $NC DISPLAYING SYSTEM "
echo -e "$PURPLE (15) $NC WEBMIN MENU          $PURPLE (23) $NC INFO SCRIPT AUTO "
echo -e "$PURPLE (16) $NC UPDATE TO KERNEL     $PURPLE (24) $NC SHOW SYSTEM STATUS "
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$Lyellow Premium VPS by AKUBUDAKGERIK"$NC
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e ""
echo -e "       [Ctrl + C] For exit from main menu"
echo -e ""
read -p "        Select From Options [1-24 or x]: " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-ssr
;;
4)
menu-ss 
;;
5)
menu-vmess
;;
6)
menu-vless 
;;
7)
menu-xray 
;;
8)
menu-trojan 
;;
9)
add-host
;;
10)
certv2ray
;;
11)
change-port
;;
12)
autobackup
;;
13)
backup
;;
14)
restore
;;
15)
wbmn
;;
16)
kernel-updt
;;
17)
limit-speed
;;
18)
ram
;;
19)
reboot
;;
20)
speedtest-cli
;;
21)
update
;;
22)
info
;;
23)
about
;;
24)
running
;;
25)
exit
;;
x)
exit
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac