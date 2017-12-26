#!/bin/sh
#add computer node 
. /etc/profile.d/pbs.sh
if [ -f "/pbspro-maya/sshconf/worker_id.txt"  ];then 
  cat /pbspro-maya/sshconf/worker_id.txt | while read Cid
  do
     #echo ${Cid:0:12}
     . /etc/profile.d/pbs.sh
     qmgr -c 'create node '${Cid:0:12}''   
  done
fi
. /etc/profile.d/pbs.sh	
