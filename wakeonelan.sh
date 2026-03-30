
#!/bin/bash

PRIMARY_IFACE=$(ip route | grep default | awk '{print $5}')
PRIMARY_IFACE=$(ip route get 8.8.8.8 | awk '{print $5; exit}')
echo $PRIMARY_IFACE
sudo ethtool -s $PRIMARY_IFACE wol g
sudo ethtool $PRIMARY_IFACE
sudo tee /etc/systemd/system/wol.service > /dev/null <<EOF
[Unit]
Description=Enable Wake-on-LAN

[Service]
Type=oneshot
ExecStart=/usr/sbin/ethtool -s $PRIMARY_IFACE wol g

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reexec
sudo systemctl enable wol.service
sudo ethtool $PRIMARY_IFACE | grep Wake-on

PRIMARY_MAC=$(cat /sys/class/net/$PRIMARY_IFACE/address)
echo "Test on other Machine with this command 'wakeonlan $PRIMARY_MAC'"
