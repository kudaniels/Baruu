#!/bin/bash
source /var/lib/crot-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "User: " -e user
                CLIENT_EXISTS=$(grep -w $user /etc/trojan/config.json | wc -l)      
                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo "A client with the specified name was already created$                        exit 1
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/trojan/config.json
systemctl restart trojanku
trojanlink="trojan://${uuid}@${domain}:2087"
clear
echo -e ""
echo -e "==========-Trojan-=========="
echo -e "Remarks        : ${user}"
echo -e "Host/IP        : ${domain}"
echo -e "port           : 2087"
echo -e "Key            : ${uuid}"
echo -e "link           : ${trojanlink}"                                           echo -e "================================="
echo -e "Expired On     : $exp"
echo -e ""
echo -e "Mod By DIMZY"