#!/bin/sh
#add computer node 
. /etc/profile.d/pbs.sh

if [ -f "/pbspro-maya/sshconf/worker_name.txt"  ];then 
  cat /pbspro-maya/sshconf/worker_name.txt | while read CName
  do
     echo ${CName}
     . /etc/profile.d/pbs.sh
     qmgr -c 'create node '${CName}''   
  done
fi
	
