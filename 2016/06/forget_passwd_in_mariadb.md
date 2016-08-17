# 重置MariaDB的root密码

> http://www.server110.com/mariadb/201309/1843.html

```bash
[root@iZ2377opnkaZ zzhoo8]# systemctl stop mariadb.service

[root@iZ2377opnkaZ zzhoo8]# mysqld_safe --skip-grant-tables &
[1] 22703
[root@iZ2377opnkaZ zzhoo8]# 160625 17:58:18 mysqld_safe Logging to '/var/log/mariadb/mariadb.log'.
160625 17:58:18 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql

[root@iZ2377opnkaZ zzhoo8]# 
[root@iZ2377opnkaZ zzhoo8]# 
[root@iZ2377opnkaZ zzhoo8]# mysql -uroot -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 1
Server version: 5.5.47-MariaDB MariaDB Server

Copyright (c) 2000, 2015, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 

MariaDB [(none)]> update mysql.user set password=PASSWORD("xiaohuabu") where user="root";
Query OK, 4 rows affected (0.00 sec)
Rows matched: 4  Changed: 4  Warnings: 0
```



