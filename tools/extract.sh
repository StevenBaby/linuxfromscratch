
basename=$(basename "$0")
dir="$(dirname "$0")"

filename="${basename%.*}"
downloadpy=$BASE/tools/download.py

tarfile="$(python3 $downloadpy $filename $tarname | tail -n 1)"
echo "tarfile:" $tarfile

src=$(dirname $tarfile)/$filename
rm -rf $src
mkdir -pv $src
tar xvf $tarfile -C $src --strip-components=1

cd $src
