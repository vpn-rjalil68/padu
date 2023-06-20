#!/bin/bash
# // Update
#By VPN-BUDAKGERIK
apt-get -y autoremove;
apt upgrade && apt replace -y

echo "Start Update"
sleep 5
clear
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpn-rjalil68/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo Permission Accepted
clear

# // Download
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/add-host.sh"
wget -O add-host "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/add-host.sh"
wget -O add-ws "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/renew-tr.sh"
wget -O certv2ray "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/cert.sh"
wget -O about "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/restart.sh"
wget -O speedtest-cli "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/tendang.sh"
wget -O change-port "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-tr.sh"
wget -O port-squid "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-vless.sh"
wget -O port-xray "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/port-xray.sh"
wget -O wbmn "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/xp.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-vless.sh"
wget -O menu-ss "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-ss.sh"
wget -O menu-ssr "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-ssr.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-trojan.sh"
wget -O menu-wg "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-wg.sh"
wget -O update "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/update.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-ssh.sh"
wget -O menu-xray "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/menu-xray.sh"
wget -O running "https://raw.githubusercontent.com/vpn-rjalil68/padu/main/running.sh"
chmod +x add-host
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x certv2ray
chmod +x running
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest-cli
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x port-xray
chmod +x wbmn
chmod +x xp
chmod +x menu-vmess
chmod +x menu-vless
chmod +x menu-ss
chmod +x menu-ssr
chmod +x menu-trojan
chmod +x menu-wg
chmod +x update
chmod +x menu-ssh
chmod +x menu-xray
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix Menu"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot