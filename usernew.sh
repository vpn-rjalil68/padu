#!/bin/bash
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain);
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
clear
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
lama=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
hariini=`date -d "0 days" +"%d-%m-%Y"`
exp=`date -d "$masaaktif days" +"%d-%m-%Y"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "### $Login $lama" >> /etc/budakgerik/ssh_account
echo -e ""
echo -e "Thank You For Using Our Services"
echo -e "SSH & OpenVPN Account Info"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Created   : $hariini"
echo -e "Expired   : $exp"
echo -e "===============================" | lolcat
echo -e "IP Server      : $IP"
echo -e "Host           : ${domain}"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "SSL/TLS        :$ssl"
echo -e "OHP            : 8087"
echo -e "Port Squid     :$sqd"
echo -e "OpenVPN        : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN        : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN        : SSL 442 http://$IP:81/client-tcp-ssl.ovpn"
echo -e "OpenVPn        : OHP 8087 http://$IP:81/tcp-ohp.ovpn"
echo -e "badvpn            : 7100-7300"
echo -e "===============================" | lolcat
echo -e "     Script by VPN-BUDAKGERIK" | lolcat