# 设置青石配置中心的地址

> 设置服务器确保以形如http://xxx.com/hosts/xxx.json可以访问到配置文件

## nginx

```bash
touch hosts.conf
vi hosts.conf
```

```bash
server {
    #listen 10.116.126.81:80;
    listen 80;
    server_name 120.25.210.150;

    location = / {
        return 404;
    }

    location ~ ^/hosts {
        index index.html;
        root /var/www; 
    }
}
```

## 文件名称

* 统一配置中心host
* 不同的环境以不同的文件名区分
* 生产环境 product_config.json
* 测试环境 test_config.json
* 开发环境 dev_config.json


