#!/bin/bash
cat << EOF > /etc/resolv.conf
nameserver 192.168.0.1
nameserver 8.8.8.8
nameserver 77.88.8.8
EOF
yum install nfs-utils
systemctl enable firewalld --now
echo "192.168.50.10:/srv/share/ /mnt nfs vers=3,proto=udp,auto" >> /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target