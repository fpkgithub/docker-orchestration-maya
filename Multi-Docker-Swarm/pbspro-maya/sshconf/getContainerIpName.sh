#!/bin/sh
#########################################
########get master contanier ip##########
#########################################

#if [ ! -f "master_ip.txt" ]; then
#  touch $PWD/master_ip.txt
#  chmod +x master_ip.txt
#fi
#> master_ip.txt
#m_cips=$(docker inspect `docker service ps pbspro-maya-master -q` --format '{{range .NetworksAttachments}}{{.Addresses}}{{end}}' | cut -d '[' -f2|cut -d '/' -f1)
#m_precip=""
#for m_cip in m_precip
#do
#   if [ "$m_cip" != "$m_precip" ];then
#     echo $m_cip >> master_ip.txt
#   fi
#   m_precip=$m_cip
#done;
#echo "get master contanier ip at $PWD/master_ip.txt"
#'
#

#########################################
########get all work container ip########
#########################################
if [ ! -f "worker_ip.txt" ]; then
  touch $PWD/worker_ip.txt
  chmod +x worker_ip.txt
fi
> worker_ip.txt

cips=$(docker inspect `docker service ps pbspro-maya-worker -q` --format '{{range .NetworksAttachments}}{{.Addresses}}{{end}}' | cut -d '[' -f2|cut -d '/' -f1)
precip=""
for cip in $cips
do
   if [ "$cip" != "$precip" ];then
     echo $cip >> worker_ip.txt
   fi
   precip=$cip
done;
echo "get all work container ip at $PWD/worker_ip.txt"

#########################################
#######get all work container id#########
#########################################
if [ ! -f "worker_name.txt" ]; then
  touch $PWD/worker_id.txt
  chmod +x worker_id.txt
fi
> worker_id.txt

cids=$(docker inspect ` docker service ps pbspro-maya-worker -q` --format '{{ .Status.ContainerStatus.ContainerID }}')
precid=""
for cid in $cids
do 
  if [ "$cid" != "$precid" ];then
     echo $cid >> worker_id.txt
  fi
  precid=$cid
done
echo "get all work container id at $PWD/worker_id.txt"
