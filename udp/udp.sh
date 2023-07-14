#!/bin/bash

cd
rm -rf /root/udp
mkdir -p /root/udp

# change to time GMT+7
echo "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
# install udp
echo -e ""
echo -e "${Green}Downloading UDP Client ....${NC}"
wget "raw.githubusercontent.com/Kmk101team/kmkz/main/udp/udp" -O /root/udp/udp &>/dev/null
chmod +x /root/udp/udp


echo -e "${Green}Downloading File ....${NC}"
wget "raw.githubusercontent.com/Kmk101team/kmkz/main/udp/config.json" -O /root/udp/config.json &>/dev/null
chmod +x /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by Kmkz

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by Kmkz

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null
rm -f udp.sh
echo ""
echo "SUKSES INSTALL UDP"
sleep 0,5
clear
