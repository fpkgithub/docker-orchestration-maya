# docker-orchestration-maya

[TOC]

## Single-Docker-Compose

```shell
compose-pbspro-maya
  |__ base:Dockerfile，用于制作pbspro-maya镜像
  |__ cluster:使用脚本构建并启动多个容器在单机上
         |__ cluster.sh ：Compose编排容器的启动脚本
         |__ Dockerfile ：配置pbspro-maya镜像需要的文件和ssh
         |__ docker-compose.yml : 定义master和worker服务
         |__ .evn : 设置环境变量REGISTRY_ADDR、REGISTRY_PORT、IMAGE_NAME
```

```shell
pbspro-maya: 包含ssh配置，ansible安装配置，pbs安装配置文件和shell脚本            
    |__ sshconf : 在master节点生成ssh，将公钥发送到各个worker上，并安装ansible 
            |__ getContainerIpName.sh : 获取保存容器的ip和name
            |__ send_ssh_pub.sh ： 生成ssh，调用auto_ssh.sh脚本，安装ansible
            |__ auto_ssh.sh : 自动化分发公钥到各个worker上
    |__ ansibleconf
            |__ inithosts.sh : 配置ansible inventory
    |__ pbsinstall : 安装pbspro
            |__ master : 在master安装pbspro
                   |__ installpbs.sh
            |__ worker : 在master使用ansible批量安装pbspro到计算节点
                   |__ playbook.yml : 使用installpbs.sh脚本安装
                   |__ installpbs.sh 
            |__ addnode.sh : 将worker计算节点添加到master上
```

##Multi-Docker-Swarm

```shell
swarm-pbspro-maya
  |__ base:Dockerfile，用于制作pbspro-maya镜像
  |__ cluster:使用脚本构建并启动多个容器分布到swarm集群中
         |__ swarm.sh ：容器的启动管理脚本
         |__ Dockerfile ：配置pbspro-maya镜像需要的文件和ssh
         |__ swarm.conf : 设置环境变量IMAGE_NAME、NETWORK_NAME、NETWORK_SUBNET等
```

```shell
pbspro-maya: 包含ssh配置，ansible安装配置，pbs安装配置文件和shell脚本            
    |__ sshconf : 在master节点生成ssh，将公钥发送到各个worker上，并安装ansible 
            |__ getContainerIpName.sh : 获取保存容器的ip和name
            |__ send_ssh_pub.sh ： 生成ssh，调用auto_ssh.sh脚本，安装ansible
            |__ auto_ssh.sh : 自动化分发公钥到各个worker上
    |__ ansibleconf : 初始化ansible/hosts文件
            |__ inithosts.sh : 配置ansible inventory
    |__ pbsinstall : 安装pbspro
            |__ master : 在master安装pbspro
                   |__ installpbs.sh
            |__ worker : 在master使用ansible批量安装pbspro到计算节点
                   |__ playbook.yml : 使用installpbs.sh脚本安装
                   |__ installpbs.sh 
            |__ addnode.sh : 将worker计算节点添加到master上
```

## 参考资料

1 [Alpine MPICH](https://github.com/NLKNguyen/alpine-mpich)

2 [Centos7+Maya2017+Pbspro安装](http://blog.csdn.net/u012460749/article/details/78604485) 

3 [单机Docker-compose编排pbspro_maya](http://blog.csdn.net/u012460749/article/details/78742222) 

4 [pbspro-maya多机Swarm编排](http://blog.csdn.net/u012460749/article/details/78733320)



---

​                                                                    2017-12-26-Boy

