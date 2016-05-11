# This account is currently not available

> 运行ElasticSearch时碰到的一个问题

```bash
[root@0f03a5103c4b bin]# su elasticsearch "/usr/share/elasticsearch/bin"
This account is currently not available.
[root@0f03a5103c4b bin]# su elasticsearch
This account is currently not available.
```

根据`http://blog.itpub.net/26148431/viewspace-1415514/`提供的信息

```bash
[root@0f03a5103c4b bin]# vipw elasticsearch

root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-bus-proxy:x:999:998:systemd Bus Proxy:/:/sbin/nologin
systemd-network:x:998:997:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
logstash:x:997:996:logstash:/opt/logstash:/sbin/nologin
elasticsearch:x:996:995:elasticsearch user:/home/elasticsearch:/sbin/nologin
# 这里改/bin/bash就可以了
elasticsearch:x:996:995:elasticsearch user:/home/elasticsearch:/bin/bash

You have modified /etc/passwd.
You may need to modify /etc/shadow for consistency.
Please use the command 'vipw -s' to do so.
[root@0f03a5103c4b bin]# su elasticsearch
bash-4.2$
```

