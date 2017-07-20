# 在阿里云VPC中的ECS访问外网

> VPC中ECS并不会分配EIP，因此无法直接访问外网，需要配置之后才可以

## 配置有EIP的ECS

> 注意，需要先停止firewalld！

```bash
[zzhoo8@iZwz9gfkd22hd986z6mxq8Z ~]$ curl -v www.baidu.com
* About to connect() to www.baidu.com port 80 (\#0)
```

打开ipv4转发功能

```bash
[root@izwz9f11oygl517bqonswpz ~]# vi /etc/sysctl.conf
[root@izwz9f11oygl517bqonswpz ~]# sysctl -p
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
vm.swappiness = 0
net.ipv4.neigh.default.gc_stale_time = 120
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.default.arp_announce = 2
net.ipv4.conf.lo.arp_announce = 2
net.ipv4.conf.all.arp_announce = 2
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 1024
net.ipv4.tcp_synack_retries = 2
net.ipv4.ip_forward = 1
```

iptables添加SNAT转换 其中192.168.1.0是内网网段, 192.168.1.95是绑定了EIP的这台机器的内网IP

```bash
iptables -t nat -I POSTROUTING -s 192.168.1.0/24 -j SNAT --to-source 192.168.1.95

iptables -t nat -D POSTROUTING -s 192.168.0.0/24 -j SNAT --to-source 192.168.0.227
```

查询SNAT情况`iptables  -t  nat  -nL`

清除iptables

```bash
iptables -F
iptables -X
iptables -Z
```

## 阿里云控制面板中配置

在阿里云控制面板中的VPC中增加一条路由

![](http://img1.tbcdn.cn/L1/461/1/6001229eba19c2809b736547cabe45bc0c9fbf9f.png)

## 资料

* [如何保证摘除公网EIP的容器服务VPC集群可以正常访问公网](https://yq.aliyun.com/articles/3031)
