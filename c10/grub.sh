#!/bin/bash
# BASE="$(dirname $(dirname $(realpath "$0")))"

# source $BASE/tools/config.1.sh
# source $BASE/tools/extract.h

# cd /tmp
# grub-mkrescue --output=grub-img.iso
# xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso

grub-install /dev/sda

# grub-mkconfig -o /boot/grub/grub.cfg

cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

# insmod part_gpt
insmod ext4
set root=(hd0,1)

menuentry "GNU/Linux, Linux 6.10.5-lfs-12.2" {
        linux   /boot/vmlinuz-6.10.5-lfs-12.2 root=/dev/sda1 ro
}
EOF
