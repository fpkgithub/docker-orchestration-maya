#!/bin/sh

#MIP=$(ifconfig eth2 | grep "inet" | awk '{ print $2}')
#echo "MIP:$MIP"
> /etc/ansible/hosts
echo "[worker]" >> /etc/ansible/hosts
#echo $MIP >> /etc/ansible/hosts
cat /pbspro-maya/sshconf/worker_ip.txt | while read w_cip
do 
   echo $w_cip
   echo $w_cip >> /etc/ansible/hosts
done
echo "update ansible is ok"

