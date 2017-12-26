#!/bin/sh
if [ -f ];then
  > /etc/ansible/hosts
  echo '[worker]' >> /etc/ansible/hosts
  cat /pbspro-maya/sshconf/worker_ip.txt | while read cip
  do
    echo $cip
    echo $cip >> /etc/ansible/hosts
  done
  echo "ansible host's file init is  ok"
fi
