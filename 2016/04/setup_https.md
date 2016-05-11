# 配置青石服务器的https协议

当前的nginx配置如下

```bash
# 反向代理到服务的配置
server {

    listen       80;
    server_name  docker.bluestonehk.com;
    # root         /usr/lib/python2.7/site-packages/crystal;
    # index        index.html index.htm

    # Load configuration files for the default server block.
    # include /etc/nginx/default.d/*.conf;
    
    location /barite/ {
        proxy_pass              http://127.0.0.1:5050/barite/;
    }

    # 对 "/" 启用反向代理
    location / {
        proxy_pass              http://127.0.0.1:5000;
        proxy_redirect          off;
        proxy_set_header        Host            $host;
        proxy_set_header        X-Real-IP       $remote_addr;

        #后端的Web服务器可以通过X-Forwarded-For获取用户真实IP
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        #以下是一些反向代理的配置，可选。
        client_max_body_size 10m; #允许客户端请求的最大单文件字节数
        client_body_buffer_size 128k; #缓冲区代理缓冲用户端请求的最大字节数，
        proxy_connect_timeout 90; #nginx跟后端服务器连接超时时间(代理连接超时)
        proxy_send_timeout 90; #后端服务器数据回传时间(代理发送超时)
        proxy_read_timeout 90; #连接成功后，后端服务器响应时间(代理接收超时)
        proxy_buffer_size 4k; #设置代理服务器（nginx）保存用户头信息的缓冲区大小
        proxy_buffers 4 32k; #proxy_buffers缓冲区，网页平均在32k以下的设置
        proxy_busy_buffers_size 64k; #高负荷下缓冲大小（proxy_buffers*2）
        proxy_temp_file_write_size 64k; #设定缓存文件夹大小，大于这个值，将从upstream服务器传
    }

    # 移动端重写URL
    #if ($http_user_agent ~* (#mobile|nokia|iphone|ipad|android|samsung|htc|blackberry)) #{
    #    rewrite ^/(.*) ^/m/$1 permanent|last;
    #}

    # 图片缓存时间设置
    #location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
    #{
    #    expires 30d;
    #}

    # JS和CSS缓存时间设置
    #location ~ .*\.(js|css)?$
    #{
    #    expires 1d;
    #}

    error_page 404 /404.html;
        location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
        location = /50x.html {
    }
}
```

因为http对应的80端口不变，新增https的443端口支持，需要在crystal.conf（项目的配置文件）新增https的配置

```bash
server {

    listen       443;
    server_name  shitouji.bluestonehk.com;
    # root         /usr/lib/python2.7/site-packages/crystal;
    # index        index.html index.htm

    ssl on;
    ssl_certificate /etc/nginx/vhost/bluestonehk.com.crt;
    ssl_certificate_key /etc/nginx/vhost/bluestonehk.com.key;

    # Load configuration files for the default server block.
    # include /etc/nginx/default.d/*.conf;

    # 对 "/" 启用反向代理
    location / {
        proxy_pass              http://127.0.0.1:5000;
        proxy_redirect          off;
        proxy_set_header        Host            $host;
        proxy_set_header        X-Real-IP       $remote_addr;

        #后端的Web服务器可以通过X-Forwarded-For获取用户真实IP
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        #以下是一些反向代理的配置，可选。
        client_max_body_size 10m; #允许客户端请求的最大单文件字节数
        client_body_buffer_size 128k; #缓冲区代理缓冲用户端请求的最大字节数，
        proxy_connect_timeout 90; #nginx跟后端服务器连接超时时间(代理连接超时)
        proxy_send_timeout 90; #后端服务器数据回传时间(代理发送超时)
        proxy_read_timeout 90; #连接成功后，后端服务器响应时间(代理接收超时)
        proxy_buffer_size 4k; #设置代理服务器（nginx）保存用户头信息的缓冲区大小
        proxy_buffers 4 32k; #proxy_buffers缓冲区，网页平均在32k以下的设置
        proxy_busy_buffers_size 64k; #高负荷下缓冲大小（proxy_buffers*2）
        proxy_temp_file_write_size 64k; #设定缓存文件夹大小，大于这个值，将从upstream服务器传
    }

    # 移动端重写URL
    #if ($http_user_agent ~* (#mobile|nokia|iphone|ipad|android|samsung|htc|blackberry)) #{
    #    rewrite ^/(.*) ^/m/$1 permanent|last;
    #}

    # 图片缓存时间设置
    #location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
    #{
    #    expires 30d;
    #}

    # JS和CSS缓存时间设置
    #location ~ .*\.(js|css)?$
    #{
    #    expires 1d;
    #}

    error_page 404 /404.html;
        location = /40x.html {
    }

    error_page 500 502 503 504 /50x.html;
        location = /50x.html {
    }
}
```

