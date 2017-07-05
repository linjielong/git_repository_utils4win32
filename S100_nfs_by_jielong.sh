#!/bin/bash
# Copyright(c) 2016-2100.  root.  All rights reserved.
#
#   FileName:     nfs_by_jielong.sh
#   Author:       root
#   Email:        493164984@qq.com
#   DateTime:     2017-07-05 18:45:28
#   ModifiedTime: 2017-07-05 19:12:14

if [ x"$(/bin/df -h | /bin/grep works4tpv)" = x ]; then
/bin/mount -v -t nfs -o nfsvers=3 xmnb4003161.tpvaoc.com:/works4tpv /home/jielong.lin/xmnb4003161.tpvaoc.com/works4tpv  #2>/home/jielong.lin/error_nfs@$(/bin/date +%Y_%m_%d__%H_%M_%S)
fi
