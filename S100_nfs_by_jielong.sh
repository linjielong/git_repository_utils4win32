#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     S100_nfs_by_jielong.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-07-05 18:45:28
#   ModifiedTime: 2017-07-05 21:05:18


if [ x"$1" = x"stop" ]; then
if [ x"$(/bin/df -h | /bin/grep works4tpv)" != x ]; then
echo "sudo umount -f $(pwd)/works4tpv"
sudo umount -f $(pwd)/works4tpv
fi
exit 0
fi


if [ x"$1" = x"start" ]; then
if [ x"$(/bin/df -h | /bin/grep works4tpv)" != x ]; then
echo "sudo umount -f $(pwd)/works4tpv"
sudo umount -f $(pwd)/works4tpv
fi

if [ x"$(/bin/df -h | /bin/grep works4tpv)" = x ]; then
sudo /bin/mount -v -t nfs -o nfsvers=3 xmnb4003161.tpvaoc.com:/works4tpv /home/jielong.lin/xmnb4003161.tpvaoc.com/works4tpv  #2>/home/jielong.lin/error_nfs@$(/bin/date +%Y_%m_%d__%H_%M_%S)
fi
exit 0
fi

more >&1<<EOF

Usage:
  # dump the usage
  $0

  # start to mount nfs with allowwing multilse times
  $0 start

  # stop to mount nfs, namely umount
  $0 stop

EOF

