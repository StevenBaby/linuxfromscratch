cd /etc/sysconfig/
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.111.222
GATEWAY=192.168.111.2
PREFIX=24
BROADCAST=192.168.111.255
EOF

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

nameserver 192.168.111.2

# End /etc/resolv.conf
EOF

echo "steven-lfs" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost.localdomain localhost

::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF
