#!/bin/sh
#get all work container id
if [ ! -f "worker_ip.txt" ]; then
  touch $PWD/worker_ip.txt
  chmod +x worker_ip.txt
fi
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -q -f "name=cluster_worker*") > worker_ip.txt


#get all work container name
if [ ! -f "worker_name.txt" ]; then
  touch $PWD/worker_name.txt
  chmod +x worker_name.txt
fi
docker inspect --format='{{.Name}}' $(docker ps -q -f "name=cluster_worker*") > worker_name.txt 
sed -i 's/^.//' worker_name.txt



