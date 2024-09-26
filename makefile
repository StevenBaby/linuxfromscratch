
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


.PHONY: chapter6
chapter6:
	bash c6/m4.sh
	bash c6/ncurses.sh
	bash c6/bash.sh
	bash c6/coreutils.sh
	bash c6/diffutils.sh
	bash c6/file.sh
	bash c6/findutils.sh
	bash c6/gawk.sh
	bash c6/grep.sh
	bash c6/gzip.sh
	bash c6/make.sh
	bash c6/patch.sh
	bash c6/sed.sh
	bash c6/tar.sh
	bash c6/xz.sh
	bash c6/binutils.sh
	bash c6/gcc.sh

.PHONY: chroot
chroot:
	bash c7/chroot.sh

.PHONY: chapter7
chapter7:
	bash c7/setup.sh
	bash c7/python.sh
	bash c7/gettext.sh
	bash c7/bison.sh
	bash c7/perl.sh
	bash c7/texinfo.sh
	bash c7/util-linux.sh
	bash c7/cleanup.sh
