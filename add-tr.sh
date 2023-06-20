#!/bin/bash
BGGREEN='\e[1;42'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
BGRED='\e[1;41m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
uuid=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
echo -e ""
echo -e " ${ORANGE}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGBLUE}                     ┃ Trojan ┃                              ${NC}"
echo -e " ${ORANGE}══════════════════════════════════════════════════════════════════${NC}"
tr="$(cat ~/log-install.txt | grep -i Trojan | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Expired (days): " masaaktif
read -p "SNI (BUG)     : " sni
read -p "Bug Address (Example: www.google.com) : " sub
dom=$sub$domain
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${dom}:${tr}?sni=$sni#$user"
clear
MYIP=$(curl -sS ippadu.icanhazip.com)
echo -e ""
echo -e " ${ORANGE}══════════════════════════════════════════════════════════════════${NC}"
echo -e " ${BGBLUE}                     ┃ Trojan ┃                              ${NC}"
echo -e " ${ORANGE}══════════════════════════════════════════════════════════════════${NC}"
echo -e "Remarks        : ${user}"
echo -e "IP Server      : $MYIP"
echo -e "Host/IP        : ${domain}"
echo -e "Subdomain      : ${dom}"
echo -e "port           : ${tr}"
echo -e "Key            : ${user}"
echo -e "link           : ${trojanlink}"
echo -e "SNI            : $sni"
echo -e " ${ORANGE}=================================${NC}"
echo -e "Created   : $hariini"
echo -e "Expired   : $exp"