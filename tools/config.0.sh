set -e

export BASE=/root/lfs
export LFS=/mnt/lfs
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export LC_ALL=POSIX
export PATH=$LFS/tools/bin:$PATH
export CONFIG_SITE=$LFS/usr/share/config.site
export MAKEFLAGS='-j 8'

if [ ! -e '/dev/sda1' ]; then
    echo "/dev/sda1 not found!"
    exit -1
fi

mkdir -pv $LFS
mountpoint -q $LFS || mount /dev/sda1 $LFS

mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sfnv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/sources
mkdir -pv $LFS/tools
