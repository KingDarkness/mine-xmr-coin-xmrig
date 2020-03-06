#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}
apt update
apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
git clone https://github.com/xmrig/xmrig.git /tmp/xmrig
cd /tmp/xmrig && mkdir build && cd build
cmake ..
make
mv /tmp/xmrig/build/* /usr/local/bin
rm -rf /tmp/xmrig

cpus=`nproc`
use=`expr $cpus / 2 + 1`

/usr/local/bin/xmrig -o xmr-asia1.nanopool.org:14433 --tls --coin monero -u 423cTTx6LDyLppiTbsmP2SPZNMV4EpMDqff8AB4d1jMvgSvRJxp8wa9Yn3DdVmuQSNLBE75quuCn8h3tx17nshvJ4Yzaoeh -p x -t $use -l /var/log/xmrig.log --background