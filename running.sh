#!/bin/bash
red="\e[1;31m"
green="\e[0;32m"
NC="\e[0m"
clear
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then 
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi
# Ram Usage
total_r2am=` grep "MemAvailable: " /proc/meminfo | awk '{ print $2}'`
MEMORY=$(($total_r2am/1024))
# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
REGION=$( curl -s ipinfo.io/region )
# clear
COUNTRY=$( curl -s ipinfo.io/country )
# clear
WAKTU=$( curl -s ipinfo.ip/timezone )
# clear
CITY=$( curl -s ipinfo.io/city )
# clear
REGION=$( curl -s ipinfo.io/region )
# clear
WAKTU=$( curl -s ipinfo.io/timezone )
# clear
koordinat=$( curl -s ipinfo.io/loc )
# clear
MYIP=$(wget -qO- ipinfo.io/ip)
# clear
NC='\033[0m'
echo -e "$NC"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))

# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

# Total Ram
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# Tipe Processor
totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
totalcore+=" Core"
corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
                        printf $2;
                        exit
                        }' /proc/cpuinfo)"

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

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Kernel Terbaru
kernelku=$(uname -r)

# Waktu Sekarang 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# DNS Patch
tipeos2=$(uname -m)

# Getting Domain Name
Domain="$(cat /etc/v2ray/domain)"
# Echoing Result
echo -e ""
echo -e "In Here Is Your VPS Information :"
echo -e "SCRIPT VPS BY VPN-BUDAKGERIK"
echo "-------------------------------------------------------------------------------"
echo "Operating System Information :"
echo -e "VPS Type    : $typevps"
echo -e "OS Arch     : $tipeos2"
echo -e "Hostname    : $HOSTNAME"
echo -e "OS Name     : $Tipe"
echo -e "OS Version  : $Versi_OS"
echo -e "OS URL      : $URL_SUPPORT"
echo -e "OS BASE     : $basedong"
echo -e "OS TYPE     : Linux / Unix"
echo -e "Bash Ver    : $versibash"
echo -e "Kernel Ver  : $kernelku"
echo "-------------------------------------------------------------------------------"
echo "Hardware Information :"
echo -e "Processor   : $tipeprosesor"
echo -e "Proc Core   : $totalcore"
echo -e "Virtual     : $typevps"
echo -e "Cpu Usage   : $cpu_usage"
echo "-------------------------------------------------------------------------------"
echo "System Status / System Information :"
echo -e "Uptime      : $uptime ( From VPS Booting )"
echo -e "Total RAM   : ${totalram}MB"
echo "-------------------------------------------------------------------------------"
echo "Internet Service Provider Information :"
echo -e "Public IP   : $MYIP"
echo -e "Domain      : $Domain"
echo -e "ISP Name    : $NAMAISP"
echo -e "Region      : $REGION "
echo -e "Country     : $COUNTRY"
echo -e "City        : $CITY "
echo -e "Time Zone   : $WAKTUE"
echo "-------------------------------------------------------------------------------"
echo "Time & Date & Location & Coordinate Information :"
echo -e "Location    : $COUNTRY"
echo -e "Coordinate  : $koordinat"
echo -e "Time Zone   : $WAKTU"
echo -e "Date        : $harini"
echo -e "Time        : $jam ( WIB )"
echo "-------------------------------------------------------------------------------"
echo -e ""
echo -e "PANEL SYSTEM STATUS INFORMATION:"
echo "----------------------------"
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH               : "$green"running"$NC"✓"
else
echo -e " SSh               : "$red"not running (Error)"$NC""
fi
status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Stunnel           : "$green"running"$NC"✓"
else
echo -e " Stunnel           : "$red"not running (Error)"$NC""
fi
status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " DropBear          : "$green"running"$NC"✓"
else
echo -e " DropBear          : "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray Non TLS     : "$green"running"$NC"✓"
else
echo -e " V2ray Non TLS     : "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " V2ray TLS         : "$green"running"$NC"✓"
else
echo -e " V2ray TLS         : "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Vless TLS         : "$green"running"$NC"✓"
else
echo -e " Vless TLS         : "$red"not running (Error)"$NC""
fi
status="$(systemctl show v2ray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Vless Non TLS     : "$green"running"$NC"✓"
else
echo -e " Vless Non TLS     : "$red"not running (Error)"$NC""
fi
status="$(systemctl show trojan --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Trojan            : "$green"running"$NC"✓"
else
echo -e " Trojan            : "$red"not running (Error)"$NC""
fi
status="$(systemctl show xray-mini@vless-direct.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray direct       : "$green"running"$NC"✓"
else
echo -e " Xray direct       : "$red"not running (Error)"$NC""
fi
status="$(systemctl show xray-mini@vless-direct.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray SPLICE       : "$green"running"$NC"✓"
else
echo -e " Xray SPLICE       : "$red"not running (Error)"$NC""
fi
status="$(systemctl show xray-mini@vless-direct.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray ALL          : "$green"running"$NC"✓"
else
echo -e " Xray ALL          : "$red"not running (Error)"$NC""
fi
status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Squid             : "$green"running"$NC"✓"
else
echo -e " Squid             : "$red"not running (Error)"$NC""
fi
status="$(systemctl show openvpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Openvpn           : "$green"running"$NC"✓"
else
echo -e " Openvpn           : "$red"not running (Error)"$NC""
fi
status="$(systemctl show wg-quick@wg0 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Wireguard         : "$green"running"$NC"✓"
else
echo -e " Wireguard         : "$red"not running (Error)"$NC""
fi
status="$(systemctl show ssrmu --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSR               : "$green"running"$NC"✓"
else
echo -e " SSR               : "$red"not running (Error)"$NC""
fi
status="$(systemctl show shadowsocks-libev.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Shadowsocks       : "$green"running"$NC"✓"
else
echo -e " Shadowsocks       : "$red"not running (Error)"$NC""
fi
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx             : "$green"running"$NC"✓"
else
echo -e " Nginx             : "$red"not running (Error)"$NC""
fi
echo -e ""
echo -e "${green}JIKA TERDAPAT NOT RUNNING, PLEASE REPORT TO ADMIN FOR FIX$NC"
echo -e "${green}Report to @akubudakgerik"
