#just for build images push into local registry
FROM akunisnice/pbspro-maya:latest
MAINTAINER Boy

#RUN yum -y install ansible 

COPY mpi_bootstrap /usr/local/bin/mpi_bootstrap
RUN chmod +x /usr/local/bin/mpi_bootstrap

COPY get_hosts /usr/local/bin/get_hosts
RUN chmod +x /usr/local/bin/get_hosts

COPY auto_update_hosts /usr/local/bin/auto_update_hosts
RUN chmod +x /usr/local/bin/auto_update_hosts

# # ------------------------------------------------------------
# # Miscellaneous setup for better user experience
# # ------------------------------------------------------------

# Set welcome message to display when user ssh login 
#COPY welcome.txt /etc/motd

# Default hostfile location for mpirun. This file will be updated automatically.
ENV HYDRA_HOST_FILE /etc/opt/hosts
RUN echo "export HYDRA_HOST_FILE=${HYDRA_HOST_FILE}" >> /etc/profile

RUN touch ${HYDRA_HOST_FILE}
RUN chown ${USER}:${USER} ${HYDRA_HOST_FILE}

# # ------------------------------------------------------------
# # Set up SSH Server 
# # ------------------------------------------------------------

# Add host keys
#RUN cd /etc/ssh/ && ssh-keygen -A -N ''
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N '' 
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
#RUN echo "StrictHostKeyChecking no" >> /etc/ssh/sshd_config
#RUN ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa

 
# Unlock non-password USER to enable SSH login
RUN echo "123456" | passwd --stdin "root"
#passwd -u ${USER}

#CMD ["ssh-keygen  -t rsa -P '' -f /root/.ssh/id_rsa"]



