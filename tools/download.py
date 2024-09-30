import hashlib
import os
import sys
import urllib.request

dirname = os.path.dirname(__file__)


def show_usage():
    print("usage: python download.py [filename]")


if len(sys.argv) < 2:
    show_usage()
    exit(-1)

LFS = os.environ.get("LFS")
if not os.path.exists(LFS):
    print("environment variable LFS not found.")
    exit(-1)

package = sys.argv[1].lower()
tarname = None
if len(sys.argv) > 2:
    tarname = sys.argv[2]

filenames = {}
wget_lists = [
    os.path.join(dirname, '../assets/wget-list'),
    os.path.join(dirname, '../assets/wget-extra-list'),
]

for wget_list in wget_lists:
    with open(wget_list) as file:
        for line in file:
            url = line.strip()
            name = os.path.basename(url)
            if tarname == name:
                filenames = {tarname: url}
                break
            if name.lower().startswith(package):
                filenames[name] = url

if len(filenames) == 0:
    print(f'package {sys.argv[1]} not found.')
    exit(-1)

if len(filenames) > 1:
    print(f"to many names {" ".join(filenames.keys())}")
    exit(-1)

assert (len(filenames) == 1)

basename = next(iter(filenames.keys()))
url = filenames[basename]
filename = os.path.join(LFS, 'sources', basename)


if not os.path.exists(filename):
    url = filenames[basename]
    print(f"download {url} --> {filename}")
    urllib.request.urlretrieve(url, filename)

# md5s = {}
# md5name = None
# md5sums = [
#     os.path.join(dirname, '../assets/md5sums'),
#     os.path.join(dirname, '../assets/md5sums-extra'),
# ]
# for md5sums_file in md5sums:
#     with open(md5sums_file) as file:
#         for line in file:
#             tup = line.strip().split("  ")
#             if len(tup) != 2:
#                 continue
#             oldmd5, md5name = tup
#             if md5name == basename:
#                 break

# if not md5name:
#     print(f'md5 {basename} not found.')
#     exit(-1)

# newmd5 = hashlib.md5(open(filename, 'rb').read()).hexdigest()

# if newmd5 != oldmd5:
#     print("check md5 failure...")
#     exit(-1)

print(filename)
