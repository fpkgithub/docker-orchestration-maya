#!/bin/sh
#add computer node 
. /etc/profile.d/pbs.sh
if [ -f "/pbspro-maya/sshconf/worker_ip.txt"  ];then 
  cat /pbspro-maya/sshconf/worker_ip.txt | while read Cip
  do
     . /etc/profile.d/pbs.sh
     qmgr -c 'create node '${Cip}''   
  done
fi
. /etc/profile.d/pbs.sh	
