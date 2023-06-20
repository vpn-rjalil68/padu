#!/bin/bash
# Setup
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
# ===================

# Root Check
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi

apt update && apt upgrade -y && apt install curl -y && apt install figlet -y && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 
clear

if [ -f /etc/issue grep -Eqi "debian" ]; then
echo "Installing Lolcat For Debian OS"
sleep 0.5
apt-get install ruby 
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
elif cat /etc/issue | grep -Eqi "ubuntu"; then
echo "Installing Lolcat For Ubuntu OS"
sleep 0.5
apt-get install lolcat -y 
fi

echo ''
clear
echo ''
echo -e "$ORANGE     ██████╗ ██╗   ██╗██████╗  █████╗ ██╗  ██╗    $NC"
echo -e "$ORANGE     ██╔══██╗██║   ██║██╔══██╗██╔══██╗██║ ██╔╝    $NC"
echo -e "$ORANGE     ██████╔╝██║   ██║██║  ██║███████║█████╔╝     $NC"
echo -e "$ORANGE     ██╔══██╗██║   ██║██║  ██║██╔══██║██╔═██╗     $NC"
echo -e "$ORANGE     ██████╔╝╚██████╔╝██████╔╝██║  ██║██║  ██╗    $NC"
echo -e "$ORANGE     ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    $NC"
echo -e "$ORANGE                                                  $NC"
echo -e "$ORANGE        ██████╗ ███████╗██████╗ ██╗██╗  ██╗       $NC"
echo -e "$ORANGE        ██╔════╝ ██╔════╝██╔══██╗██║██║ ██╔╝      $NC"
echo -e "$ORANGE        ██║  ███╗█████╗  ██████╔╝██║█████╔╝       $NC"
echo -e "$ORANGE        ██║   ██║██╔══╝  ██╔══██╗██║██╔═██╗       $NC"
echo -e "$ORANGE        ╚██████╔╝███████╗██║  ██║██║██║  ██╗      $NC"
echo -e "$ORANGE         ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝      $NC"
echo -e ""
echo -e "$ORANGE                ⚡ PREMIUM SPEED SCRIPT ⚡     "$NC
echo '...........................................................' | lolcat
echo -e "$ORANGE                  Autoscript By VPN-BUDAKGERIK"$NC
echo -e "$ORANGE                   NEW FULL VERSION 2023 "$NC
echo -e "$ORANGE                    CONTACT TELEGRAM"$NC
echo -e "$ORANGE                       @akubudakgerik"$NC
echo '...........................................................' | lolcat
echo ''
echo -e "$ORANGE                       Tunggu 5 Saat!                       "$NC
echo '...........................................................' | lolcat
sleep 5
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green}Tahniah! Anda Dibenarkan menggunakan Script VPN-BUDAKGERIK...${NC}"
sleep 5
else
clear
echo ""
rm -f setup.sh
echo '                            ...                           '
echo '        Anda Tidak Dibenarkan Menggunakan Script ini!     '
echo '                            ...                           '
echo '    Hubungi Saya di Telegram Untuk Mendapatkan Kebenaran!     '
echo '                        t.me/akubudakgerik     '
sleep 20
exit 0
fi
echo '============================================='
echo '          Sila Tunggu sebentar '
echo 'Process Update & Upgrade Sedang Dijalankan '
echo '============================================='
sleep 2
apt update && apt upgrade -y
clear
echo '============================================='
echo '      Process Update&Upgrade Selesai '
echo '============================================='
sleep 2
clear
echo '============================================='
echo '        Process Seterusnya Sila Tunggu '
echo '============================================='
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /etc/budakgerik
touch /etc/budakgerik/ssh_account
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
touch /etc/v2ray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
echo "$host" >> /root/domain
echo "V2.0" >> /home/version
wget https://raw.githubusercontent.com/vpn-rjalil68/cf/main/cf.sh && chmod +x cf.sh && ./cf.sh
echo '============================================='
echo '        Installing SSH & OPENVPN '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo '============================================='
echo '        Installing ssr '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
echo '============================================='
echo '        Installing shadowsocksobfs '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
echo '============================================='
echo '        Installing WIREGUARD '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
echo '============================================='
echo '        Installing V2RAY '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
echo '============================================='
echo '        Installing ipsec '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
echo '        Installing XRAY '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/install-xray.sh && chmod +x install-xray.sh && screen -S v2ray ./install-xray.sh
echo '============================================='
echo '        Installing Websocket '
echo '============================================='
wget https://raw.githubusercontent.com/vpn-rjalil68/padu/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#OHP
wget https://raw.githubusercontent.com/tandekm/cf/main/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
echo "1.2" > /home/ver

echo "echo '              AutoScript By VPN-BUDAKGERIK             '" >> .profile
echo "echo '              TELEGRAM : @akubudakgerik            '" >> .profile
echo "echo ''" >> .profile
echo "echo '       Sila Type: 'menu' untuk ke menu utama      '" >> .profile
echo "echo ''" >> .profile
clear
echo " "
echo '============================================='
echo "       Installation has been completed!!"
echo '============================================='
sleep 3
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442, OHP 8087"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 443"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAY DIRECT             : 6769"  | tee -a log-install.txt
echo "   - XRAY SPLICE             : 6769"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (UTC +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 UTC +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""
echo "   - DEV TELEGRAM            : @akubudakgerik"  | tee -a log-install.txt
echo ""
echo "------------------Script Created By VPN-BUDAKGERIK---------------------" | tee -a log-install.txt

sleep 3
echo '============================================='
echo '      SISTEM AKAN REBOOT SEBENTAR LAGI'
echo '============================================='
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " Reboot 15 Sec, Setelah ON type menu"
sleep 15
reboot