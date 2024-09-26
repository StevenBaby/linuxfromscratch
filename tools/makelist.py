import os
import urllib.request

dirname = os.path.dirname(os.path.dirname(__file__))

wget_list = 'https://mirrors.ustc.edu.cn/lfs/lfs-packages/12.2/wget-list'
contents = urllib.request.urlopen(wget_list).read().decode('utf8')
filename = os.path.join(dirname, 'assets/wget-list')
print('write to', filename)

with open(filename, 'w') as file:
    for line in contents.splitlines():
        basename = os.path.basename(line.strip())
        url = f'https://mirrors.ustc.edu.cn/lfs/lfs-packages/12.2/{basename}\n'
        file.write(url)

md5sums = 'https://mirrors.ustc.edu.cn/lfs/lfs-packages/12.2/md5sums'
contents = urllib.request.urlopen(md5sums).read().decode('utf8')
filename = os.path.join(dirname, 'assets/md5sums')
print('write to', filename)
with open(filename, 'w') as file:
    file.write(contents)
