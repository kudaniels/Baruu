#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- icanhazip.com);
domain=$(cat /etc/v2ray/domain);
domain2=$(cat /etc/v2ray/domain2);
echo Script AutoCreate Akun SSH dan OpenVPN
sleep 1
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
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Terima Kasih Telah Menggunakan Layanan Kami"
echo -e "Informasi Akun SSH & OpenVPN"
echo -e "=============================="
echo -e "Username          : $Login "
echo -e "Password          : $Pass"
echo -e "==============================="
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
echo -e "ISP name          :$ISP"
echo -e "Region            :$CITY"
echo -e "IP Server         : $IP"
echo -e "Host Non Websocket: $domain2"
echo -e "Host Websocket    : $domain"
echo -e "OpenSSH           : 22, 444"
echo -e "Dropbear          : 143, 109, 999"
echo -e "WS Dropbear       : 8880"
echo -e "WS Openssh        : 2084"
echo -e "WS SSL/TLS        : 443"
echo -e "WS OpenVPN        : 2088"
echo -e "SSL/TLS           : 456/990/991"
echo -e "BadVPN/UDPGW      : 7100-7900"
echo -e "Squid             : 8888, 8000 "
echo -e "SOCKS 4/5         : 10080"
echo -e "OpenVPN TCP       : 1199"
echo -e "OpenVPN UDP       : 25000"
echo -e "OpenVPN SSL       : 992"
echo -e "==============================="
echo -e "TCP 1199          :http://$IP:81/client-tcp-1199.ovpn"
echo -e "UDP 25000         :http://$IP:81/client-udp-25000.ovpn"
echo -e "SSL 992           :http://$IP:81/client-ssl-992.ovpn"
echo -e "=============================="
echo -e "Aktif Sampai      : $exp"
echo -e "==============================="
echo -e "Payload Default WS:"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="