# Failed to get D-Bus connection报错

>

## 现象

对于centos7的镜像，使用`systemctl`命令时，会报`Failed to get D-Bus connection: Operation not permitted`的错误

## 解决方法

```bash
docker run -d --privileged -ti centos  /usr/sbin/init

➜  Fonts docker exec -it 8b17a3a50e35 bash
[root@8b17a3a50e35 /]# systemctl restart network
Failed to restart network.service: Unit not found.

```

## 参考

* [docker Failed to get D-Bus connection 报错](http://www.bubuko.com/infodetail-1314362.html)
