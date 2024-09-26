
.PHONY: version-check
version-check: tools/version-check.sh
	bash tools/version-check.sh

.PHONY: format
format: /dev/sda assets/sda.sfdisk
	sfdisk /dev/sda < assets/sda.sfdisk
	mkfs.ext4 -v -F /dev/sda1
