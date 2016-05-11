# 在Centos7上安装docker运行环境

首先需要升级软件包

```bash
yum update -y
```

```bash
[root@vm-sz-testmain-3 zzhoo8]# yum install docker
已加载插件：langpacks
正在解决依赖关系
--> 正在检查事务
---> 软件包 docker.x86_64.0.1.9.1-25.el7.centos 将被 安装
--> 正在处理依赖关系 docker-forward-journald = 1.9.1-25.el7.centos，它被软件包 docker-1.9.1-25.el7.centos.x86_64 需要
--> 正在处理依赖关系 docker-selinux >= 1.9.1-25.el7.centos，它被软件包 docker-1.9.1-25.el7.centos.x86_64 需要
--> 正在检查事务
---> 软件包 docker-forward-journald.x86_64.0.1.9.1-25.el7.centos 将被 安装
---> 软件包 docker-selinux.x86_64.0.1.9.1-25.el7.centos 将被 安装
--> 正在处理依赖关系 policycoreutils-python，它被软件包 docker-selinux-1.9.1-25.el7.centos.x86_64 需要
--> 正在检查事务
---> 软件包 policycoreutils-python.x86_64.0.2.2.5-20.el7 将被 安装
--> 正在处理依赖关系 libsemanage-python >= 2.1.10-1，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 audit-libs-python >= 2.1.3-4，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 python-IPy，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 libqpol.so.1(VERS_1.4)(64bit)，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 libqpol.so.1(VERS_1.2)(64bit)，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 libapol.so.4(VERS_4.0)(64bit)，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 checkpolicy，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 libqpol.so.1()(64bit)，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在处理依赖关系 libapol.so.4()(64bit)，它被软件包 policycoreutils-python-2.2.5-20.el7.x86_64 需要
--> 正在检查事务
---> 软件包 audit-libs-python.x86_64.0.2.4.1-5.el7 将被 安装
---> 软件包 checkpolicy.x86_64.0.2.1.12-6.el7 将被 安装
---> 软件包 libsemanage-python.x86_64.0.2.1.10-18.el7 将被 安装
---> 软件包 python-IPy.noarch.0.0.75-6.el7 将被 安装
---> 软件包 setools-libs.x86_64.0.3.3.7-46.el7 将被 安装
--> 解决依赖关系完成

依赖关系解决

==========================================================================================================================
 Package                               架构                 版本                               源                    大小
==========================================================================================================================
正在安装:
 docker                                x86_64               1.9.1-25.el7.centos                extras                13 M
为依赖而安装:
 audit-libs-python                     x86_64               2.4.1-5.el7                        base                  69 k
 checkpolicy                           x86_64               2.1.12-6.el7                       base                 247 k
 docker-forward-journald               x86_64               1.9.1-25.el7.centos                extras               824 k
 docker-selinux                        x86_64               1.9.1-25.el7.centos                extras                70 k
 libsemanage-python                    x86_64               2.1.10-18.el7                      base                  94 k
 policycoreutils-python                x86_64               2.2.5-20.el7                       base                 435 k
 python-IPy                            noarch               0.75-6.el7                         base                  32 k
 setools-libs                          x86_64               3.3.7-46.el7                       base                 485 k

事务概要
==========================================================================================================================
安装  1 软件包 (+8 依赖软件包)

总下载量：15 M
安装大小：65 M
Is this ok [y/d/N]: y
Downloading packages:
(1/9): audit-libs-python-2.4.1-5.el7.x86_64.rpm                                                    |  69 kB  00:00:00     
(2/9): checkpolicy-2.1.12-6.el7.x86_64.rpm                                                         | 247 kB  00:00:00     
(3/9): docker-forward-journald-1.9.1-25.el7.centos.x86_64.rpm                                      | 824 kB  00:00:00     
(4/9): docker-selinux-1.9.1-25.el7.centos.x86_64.rpm                                               |  70 kB  00:00:00     
(5/9): libsemanage-python-2.1.10-18.el7.x86_64.rpm                                                 |  94 kB  00:00:00     
(6/9): python-IPy-0.75-6.el7.noarch.rpm                                                            |  32 kB  00:00:00     
(7/9): policycoreutils-python-2.2.5-20.el7.x86_64.rpm                                              | 435 kB  00:00:00     
(8/9): setools-libs-3.3.7-46.el7.x86_64.rpm                                                        | 485 kB  00:00:00     
(9/9): docker-1.9.1-25.el7.centos.x86_64.rpm                                                       |  13 MB  00:00:12     
--------------------------------------------------------------------------------------------------------------------------
总计                                                                                      1.2 MB/s |  15 MB  00:00:12     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  正在安装    : audit-libs-python-2.4.1-5.el7.x86_64                                                                  1/9 
  正在安装    : docker-forward-journald-1.9.1-25.el7.centos.x86_64                                                    2/9 
  正在安装    : libsemanage-python-2.1.10-18.el7.x86_64                                                               3/9 
  正在安装    : python-IPy-0.75-6.el7.noarch                                                                          4/9 
  正在安装    : checkpolicy-2.1.12-6.el7.x86_64                                                                       5/9 
  正在安装    : setools-libs-3.3.7-46.el7.x86_64                                                                      6/9 
  正在安装    : policycoreutils-python-2.2.5-20.el7.x86_64                                                            7/9 
  正在安装    : docker-selinux-1.9.1-25.el7.centos.x86_64                                                             8/9 
  正在安装    : docker-1.9.1-25.el7.centos.x86_64                                                                     9/9 
  验证中      : setools-libs-3.3.7-46.el7.x86_64                                                                      1/9 
  验证中      : docker-selinux-1.9.1-25.el7.centos.x86_64                                                             2/9 
  验证中      : checkpolicy-2.1.12-6.el7.x86_64                                                                       3/9 
  验证中      : python-IPy-0.75-6.el7.noarch                                                                          4/9 
  验证中      : libsemanage-python-2.1.10-18.el7.x86_64                                                               5/9 
  验证中      : docker-1.9.1-25.el7.centos.x86_64                                                                     6/9 
  验证中      : docker-forward-journald-1.9.1-25.el7.centos.x86_64                                                    7/9 
  验证中      : policycoreutils-python-2.2.5-20.el7.x86_64                                                            8/9 
  验证中      : audit-libs-python-2.4.1-5.el7.x86_64                                                                  9/9 

已安装:
  docker.x86_64 0:1.9.1-25.el7.centos                                                                                     

作为依赖被安装:
  audit-libs-python.x86_64 0:2.4.1-5.el7                          checkpolicy.x86_64 0:2.1.12-6.el7                      
  docker-forward-journald.x86_64 0:1.9.1-25.el7.centos            docker-selinux.x86_64 0:1.9.1-25.el7.centos            
  libsemanage-python.x86_64 0:2.1.10-18.el7                       policycoreutils-python.x86_64 0:2.2.5-20.el7           
  python-IPy.noarch 0:0.75-6.el7                                  setools-libs.x86_64 0:3.3.7-46.el7                     

完毕！
```

```bash
[root@vm-sz-testmain-3 zzhoo8]# docker ps -a
Cannot connect to the Docker daemon. Is the docker daemon running on this host?
[root@vm-sz-testmain-3 zzhoo8]# systemctl start docker.service
[root@vm-sz-testmain-3 zzhoo8]# 
```

拉取私仓的镜像失败

```bash
[root@vm-sz-testmain-3 zzhoo8]# docker pull 10.116.126.81:10180/redis
Using default tag: latest
Trying to pull repository 10.116.126.81:10180/redis ... failed
unable to ping registry endpoint https://10.116.126.81:10180/v0/
v2 ping attempt failed with error: Get https://10.116.126.81:10180/v2/: tls: oversized record received with length 20527
 v1 ping attempt failed with error: Get https://10.116.126.81:10180/v1/_ping: tls: oversized record received with length 20527
```

添加--insecure-registry=10.116.126.81:10180

```bash
[root@vm-sz-testmain-3 zzhoo8]# vi /etc/sysconfig/docker

# /etc/sysconfig/docker

# Modify these options if you want to change the way the docker daemon runs
OPTIONS='--selinux-enabled'

DOCKER_CERT_PATH=/etc/docker

# If you want to add your own registry to be used for docker search and docker
# pull use the ADD_REGISTRY option to list a set of registries, each prepended
# with --add-registry flag. The first registry added will be the first registry
# searched.
#ADD_REGISTRY='--add-registry registry.access.redhat.com'

# If you want to block registries from being used, uncomment the BLOCK_REGISTRY
# option and give it a set of registries, each prepended with --block-registry
# flag. For example adding docker.io will stop users from downloading images
# from docker.io
# BLOCK_REGISTRY='--block-registry'

# If you have a registry secured with https but do not have proper certs
# distributed, you can tell docker to not look for full authorization by
# adding the registry to the INSECURE_REGISTRY line and uncommenting it.
INSECURE_REGISTRY='--insecure-registry=10.116.126.81:10180'

```

重启docker服务

```bash
[root@vm-sz-testmain-3 zzhoo8]# systemctl restart docker.service
```


