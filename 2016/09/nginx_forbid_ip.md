# nginx禁止IP访问

##

```bash
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

events {
    use epoll;
    worker_connections 1024;
}

http {

    log_format  main  '$remote_addr | $remote_user [$time_local] "$request" | "$request_body" '
                      '| $status | $body_bytes_sent | "$http_referer" '
                      '| "$http_user_agent" | "$http_x_forwarded_for"';

    #access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    # 禁止IP访问
    server {
        listen 80 default;
        server_name _;
        rewrite ^ http://www.xhuabu.com;
    }
}

```

## 参考

* [Nginx 禁止IP访问 ](http://blog.chinaunix.net/uid-25266990-id-3235543.html)
