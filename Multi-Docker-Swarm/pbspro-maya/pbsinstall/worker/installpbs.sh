#!/bin/sh
echo "$1        master" >> /etc/hosts
cd /root/rpmbuild/RPMS/x86_64
yum install -y pbspro-execution-14.1.0-0.x86_64.rpm
sed -i "s/PBS_SERVER=.*/PBS_SERVER=master/g" /etc/pbs.conf
echo '$clienthost master' > /var/spool/pbs/mom_priv/config
/etc/init.d/pbs start
echo "pbs is runing"
adduser user1

