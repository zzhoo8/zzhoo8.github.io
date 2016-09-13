# 解决使用Jumpserver的SSH连接总是断开的问题

> 空闲一段时间，就会被peer断开，比较影响程序调试

ServerAliveInterval: number of seconds that the client will wait before sending a null packet to the server (to keep the connection alive).

ClientAliveInterval: number of seconds that the server will wait before sending a null packet to the client (to keep the connection alive).

Setting a value of 0 (the default) will disable these features so your connection could drop if it is idle for too long.

ServerAliveInterval seems to be the most common strategy to keep a connection alive. To prevent the broken pipe problem, here is the ssh config I use in my .ssh/config file:

Host myhostshortcut HostName myhost.com User barthelemy ServerAliveInterval 60
ClientAliveCountMax on the server side might also help. This is the limit of how long a client are allowed to stay unresponsive before being disconnected. The default value is 3, as in three ClientAliveInterval.

## 资料

* [Linux反空闲设置](http://blog.sciencenet.cn/home.php?mod=space&uid=2458445&do=blog&id=943543)
