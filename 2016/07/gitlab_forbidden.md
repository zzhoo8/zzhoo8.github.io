# 并发访问Gitlab出现Forbidden

> 访问gitlab，页面显示forbidden，是因为并发数太高导致Gitlab封ip1小时

## 禁止gitlab封ip的机制

```bash
root@git:/# vi /etc/gitlab/gitlab.rb
```

找到下面这一段配置，将`enable`的`true`改成`false`即可

```bash
gitlab_rails['rack_attack_git_basic_auth'] = {
   'enabled' => false,
   'ip_whitelist' => ["127.0.0.1", "61.144.197.188"],
   'maxretry' => 10,
   'findtime' => 60,
   'bantime' => 3600
 }
```

## 重启Gitlab

```bash
gitlab-ctl reconfigure
```

## 参考

* [gitlab-ce白名单设置杜绝并发数过大引起的封ip故障](http://www.tuicool.com/articles/eyMfUna)