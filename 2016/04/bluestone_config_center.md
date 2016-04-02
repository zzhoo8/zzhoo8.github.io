# 青石配置中心V0.3

> 为了解决现有项目配置host过多的问题，引入青石配置中心概念，集中式管理自测、测试、、预发布、生产环境的hosts

## 流程

**以java工程为例**

* 项目增加全局配置文件（项目名.properties），其中需要有一个配置项，标记青石配置中心的配置文件在本地的路径

```java
# 青石配置存放位置(系统目录)
BLUESTONE_CONFIG_FILE=/Users/zzhoo8/Project/anklet/dev_config.json
```

* 项目代码改在，在启动时读入该配置文件

```java
        // 读取项目全局配置
        Prop p = PropKit.use("anklet.properties");
        // 青石配置文件本地路径
        String strConfigPath = p.get("BLUESTONE_CONFIG_FILE");
        try {
            Gson gson = new Gson();
            BufferedReader reader = new BufferedReader(new FileReader(strConfigPath));
            BluestoneConfigCenter configCenter = BluestoneConfigCenter.getInstance();
            BluestoneConfigCenter center = gson.fromJson(reader, BluestoneConfigCenter.class);
            configCenter = center;
        } catch (FileNotFoundException e) {
            // todo 输出日志
            System.out.println(e.getMessage());
        }
```

```java
/**
 * 青石配置中心(单例)
 */
public class BluestoneConfigCenter {

    private static BluestoneConfigCenter instance = new BluestoneConfigCenter();

    private BluestoneConfigCenter() {}

    public static BluestoneConfigCenter getInstance() {
        return instance;
    }

    public Hosts hosts;

    public String tag;

    // host类
    public class Hosts {
        public String CRYSTAL;
        public String CORAL;
        public String QUARTZ;
        public String BASANITE;
        public String AGATE;
        public String BARITE;
        public String TIGERITE;
        public String PEARL;
        public String ROSARY;
        public String OBSIDIAN;
        public String ANKLET;
        public String ROCK;
        public String BERYL;
        public String SPINEL;
        public String CDN1;
        public String CDN2;
    }
}
```

* 项目代码改造，需要使用各host的地方，使用位于本地的配置中心文件中的host

```java
    // 登陆
    public Response go() {
        BluestoneConfigCenter bcc = BluestoneConfigCenter.getInstance();
        String url = bcc.hosts.OBSIDIAN + this.path;
        @SuppressWarnings("unchecked")
        String text = HttpClient.post(url, null, (Map<String, String>)this.params);
        Gson gson = new Gson();
        Response response = gson.fromJson(text, Response.class);
        return response;
    }
```

* 项目编译的Dockerfile不变

```java
#Dockerfile
FROM bluestone/tomcat
MAINTAINER alvin
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD target/anklet.war /usr/local/tomcat/webapps/
```

* 项目增加启动脚本，加入拉取青石配置中心的配置文件的必须步骤

```bash
#!/bin/sh
# 新增拉取配置中心配置文件
wget ${BLUESTONE_CONFIG_CENTER} -O /var/${项目名}/

# 以下不变

# 项目之前的启动脚本
/usr/tomcat/bin/start.sh
```


* 项目运行时引入青石配置中心的环境变量，去掉其他项目host的环境变量

```java
docker run \
--name dev_crystal \
-d \
-v /home/zzhoo8/crystal/log:/usr/crystal/app/log \
-v /etc/localtime:/etc/localtime \
--net=host \
--env "SECRET_KEY=BlueStone crystal" \
--env "BS_INFO_URI=mysql://a:a@rd.mysql.rds.aliyuncs.com:3306/bs_info?charset=utf8" \
--env "BS_SECURITY_URI=mysql://a:a@rdsf.mysql.rds.aliyuncs.com:3306/bs_security?charset=utf8" \
--env "QINIU_ACCESS_KEY=123" \
--env "QINIU_SECRET_KEY=h321" \
--env "WECHAT_OPEN_APPID=wx6fac733d7a2f1dd1" \
--env "WECHAT_OPEN_APP_SECRET=d4624c36b679" \
--env "WECHAT_MP_APPID=wx9d" \
--env "WECHAT_MP_APP_SECRET=7deaca17" \
--env "BS_BERYL_APP_ID=13" \
--env "BS_QUARTZ_HOST=http://10.170.135.94:5100" \（去掉）
--env "BS_JASPER_HOST=http://yx.shitouji.bluestonehk.com" \（去掉）
--env "BS_BASANITE_HOST=http://10.170.135.94:6100" \（去掉）
--env "BS_CORAL_HOST=http://127.0.0.1:6120" \（去掉）
--env "BS_AGATE_HOST=http://10.170.135.94:6710" \（去掉）
--env "BS_BERYL_HOST=http://127.0.0.1:9070" \（去掉）
--env "REDIS_HOST=10.170.135.94" \
--env "BS_API_VERSION=11" \
--env "BS_AUTHORITY_HOSTS=10.170.135.94,^192.168.*" \（去掉）
--env "BLUESTONE_CONFIG_CENTER=http://12.2.21.15/hosts/example.json" \（新增）
10.116.126.81:10180/crystal
```







