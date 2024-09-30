
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
	cd $(LFS)/sources && rm -Rf -- */
	mkdir -pv ~/sources

ifeq ($(wildcard ~/sources/wget-list),)
	cp assets/wget-list $(LFS)/sources
	cp assets/wget-extra-list $(LFS)/sources
	cp assets/md5sums $(LFS)/sources
	cd $(LFS)/sources && wget --no-clobber --input-file=wget-list --continue --directory-prefix=$(LFS)/sources
	cd $(LFS)/sources && wget --no-clobber --input-file=wget-extra-list --continue --directory-prefix=$(LFS)/sources
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


.PHONY: chapter8
chapter8:
	$(eval PASSWD:=$(shell read -p "Set root password:" PASSWD ;echo $$PASSWD))
	bash c8/man-pages.sh
	bash c8/iana-etc.sh
	bash c8/glibc.sh
	bash c8/config.glibc.sh
	bash c8/zlib.sh
	bash c8/bzip2.sh
	bash c8/xz.sh
	bash c8/lz4.sh
	bash c8/zstd.sh
	bash c8/file.sh
	bash c8/readline.sh
	bash c8/m4.sh
	bash c8/bc.sh
	bash c8/flex.sh
	bash c8/tcl.sh
	bash c8/expect.sh
	bash c8/dejagnu.sh
	bash c8/pkgconf.sh
	bash c8/binutils.sh
	bash c8/gmp.sh
	bash c8/mpfr.sh
	bash c8/mpc.sh
	bash c8/attr.sh
	bash c8/acl.sh
	bash c8/libcap.sh
	bash c8/libxcrypt.sh
	bash c8/shadow.sh
	bash c8/config.shadow.sh
	echo $(PASSWD) | passwd root --stdin

	bash c8/gcc.sh
	bash c8/ncurses.sh
	bash c8/sed.sh
	bash c8/psmisc.sh
	bash c8/gettext.sh
	bash c8/bison.sh
	bash c8/grep.sh
	bash c8/bash.sh
	bash c8/libtool.sh
	bash c8/gdbm.sh
	bash c8/gperf.sh
	bash c8/expat.sh
	bash c8/inetutils.sh
	bash c8/less.sh
	bash c8/perl.sh
	bash c8/xml.sh
	bash c8/intltool.sh
	bash c8/autoconf.sh
	bash c8/automake.sh
	bash c8/openssl.sh
	bash c8/kmod.sh
	bash c8/libelf.sh
	bash c8/libffi.sh
	bash c8/python.sh
	bash c8/flit.sh
	bash c8/wheel.sh
	bash c8/setuptools.sh
	bash c8/ninja.sh
	bash c8/meson.sh
	bash c8/coreutils.sh
	bash c8/check.sh
	bash c8/diffutils.sh
	bash c8/gawk.sh
	bash c8/findutils.sh
	bash c8/groff.sh
	bash c8/grub.sh
	bash c8/gzip.sh
	bash c8/iproute.sh
	bash c8/kbd.sh
	bash c8/libpipeline.sh
	bash c8/make.sh
	bash c8/patch.sh
	bash c8/tar.sh
	bash c8/texinfo.sh
	bash c8/vim.sh
	bash c8/config.vim.sh
	bash c8/markupsafe.sh
	bash c8/jinja2.sh
	bash c8/udev.sh
	bash c8/man-db.sh
	bash c8/procps-ng.sh
	bash c8/util-linux.sh
	bash c8/e2fsprogs.sh
	bash c8/sysklogd.sh
	bash c8/sysvinit.sh
	bash c8/strip.sh
	bash c8/cleanup.sh

.PHONY: chapter9
chapter9:
	bash c9/lfs-bootscripts.sh
	bash c9/config.network.sh
	bash c9/config.sysvinit.sh
	bash c9/config.others.sh

.PHONY: chapter10
chapter10:
	bash c10/config.fstab.sh
	bash c10/linux.sh
	bash c10/grub.sh

.PHONY: chapter11
chapter11:
	bash c11/config.sh

.PHONY: extra
extra:
	bash extra/libunistring.sh
	bash extra/libidn2.sh
	bash extra/libpsl.sh
	bash extra/wget.sh
