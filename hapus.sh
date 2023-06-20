#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
BGRED='\e[1;41m'
BGGREEN='\e[1;42m'
BGYELLOW='\e[1;43m'
BGBLUE='\e[1;44m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Tahniah! Anda Dibenarkan menggunakan Script VPN-BUDAKGERIK...${NC}"
exit 0
fi
clear

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/budakgerik/ssh_account")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "Tidak Ada Akaun SSH Terdaftar Di VPS"
		exit 1
	fi

	clear
	echo ""
echo -e "${GREEN}══════════════════════════════════${NC}"
echo -e "${BGBLUE}          HAPUS AKUN SSH          "
echo -e "${GREEN}══════════════════════════════════${NC}"
	echo "     No User      Expired"
	grep -E "^### "     "/etc/budakgerik/ssh_account" | cut -d ' ' -f 2-3 | nl -s ') '
	echo ""
	echo -e "${GREEN}══════════════════════════════════${NC}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			echo ""
			read -rp "Choose Number [1]: " CLIENT_NUMBER
		else
			echo ""
			read -rp "Choose Number [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/budakgerik/ssh_account" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/budakgerik/ssh_account" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/budakgerik/ssh_account
if getent passwd $user > /dev/null 2>&1; then
        userdel $user
clear
echo -e "${BGRED}        SUCCESS        ${NC}"
else
        echo -e "ERROR : User $user Not Found"
fi