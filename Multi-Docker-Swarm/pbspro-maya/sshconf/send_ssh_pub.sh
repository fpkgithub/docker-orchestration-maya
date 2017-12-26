#!/bin/bash

yum -y install tcl-devel  expect
yum -y install ansible

#generate ssh
if [ ! -f /root/.ssh/id_rsa ] && [ ! -f /root/.ssh/id_rsa.pub ]; then
     ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa
     cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
fi

#send authorized_keys to worker node
if [ ! -f /pbspro-maya/sshconf/worker_ip.txt ];then
   echo "please exe /pbspro-maya/sshconf/getContainerIP.sh at the host machine for get worker ip "
else
  cat /pbspro-maya/sshconf/worker_ip.txt | while read CIP
  do 
     echo "$CIP"
     ./auto_ssh.sh root 123456 $CIP
  done
fi

#ssh-agent
ssh-agent bash
ssh-add /root/.ssh/id_rsa
echo "send_ssh_pub is ok"
#yum -y install ansible 


