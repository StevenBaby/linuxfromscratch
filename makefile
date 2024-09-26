
LFS=/mnt/lfs

.PHONY: version-check
version-check: tools/version-check.sh
	bash tools/version-check.sh

.PHONY: format
format: /dev/sda assets/sda.sfdisk
	sfdisk /dev/sda < assets/sda.sfdisk
	mkfs.ext4 -v -F /dev/sda1

.PHONY: mount
mount:
	mkdir -pv $(LFS)
	mountpoint -q $(LFS) || mount /dev/sda1 $(LFS)

.PHONY: umount
umount:
	umount /dev/sda1


.PHONY: download
download: assets/wget-list assets/md5sums
	mkdir -pv $(LFS)
	mountpoint -q $(LFS) || mount /dev/sda1 $(LFS)

	mkdir -pv $(LFS)/sources
	mkdir -pv ~/sources

ifeq ($(wildcard ~/sources/wget-list),)
	cp assets/wget-list $(LFS)/sources
	cp assets/md5sums $(LFS)/sources
	cd $(LFS)/sources && wget --no-clobber --input-file=wget-list --continue --directory-prefix=$(LFS)/sources
	cd $(LFS)/sources/ && md5sum -c md5sums
	cp $(LFS)/sources/* ~/sources
else
	cp ~/sources/* $(LFS)/sources
endif

.PHONY: chapter5
chapter5:
	bash c5/binutils.sh
	bash c5/gcc.sh
	bash c5/linux.sh
	bash c5/glibc.sh
	bash c5/libstdc++.sh
