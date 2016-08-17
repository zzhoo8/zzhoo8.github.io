# 使用Maven编译Jfinal工程

## 创建maven工程脚手架(webapp)

```bash
➜  demo mvn archetype:generate -DgroupId=com.xhuabu.spouting -DartifactId=spouting -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] >>> maven-archetype-plugin:2.4:generate (default-cli) > generate-sources @ standalone-pom >>>
[INFO] 
[INFO] <<< maven-archetype-plugin:2.4:generate (default-cli) < generate-sources @ standalone-pom <<<
[INFO] 
[INFO] --- maven-archetype-plugin:2.4:generate (default-cli) @ standalone-pom ---
[INFO] Generating project in Batch mode
Downloading: https://repo.maven.apache.org/maven2/org/apache/maven/archetypes/maven-archetype-webapp/1.0/maven-archetype-webapp-1.0.jar
Downloaded: https://repo.maven.apache.org/maven2/org/apache/maven/archetypes/maven-archetype-webapp/1.0/maven-archetype-webapp-1.0.jar (4 KB at 1.7 KB/sec)
Downloading: https://repo.maven.apache.org/maven2/org/apache/maven/archetypes/maven-archetype-webapp/1.0/maven-archetype-webapp-1.0.pom
Downloaded: https://repo.maven.apache.org/maven2/org/apache/maven/archetypes/maven-archetype-webapp/1.0/maven-archetype-webapp-1.0.pom (533 B at 0.9 KB/sec)
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Old (1.x) Archetype: maven-archetype-webapp:1.0
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: basedir, Value: /Users/zzhoo8/Project/xhuabu/demo
[INFO] Parameter: package, Value: com.xhuabu.spouting
[INFO] Parameter: groupId, Value: com.xhuabu.spouting
[INFO] Parameter: artifactId, Value: spouting
[INFO] Parameter: packageName, Value: com.xhuabu.spouting
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] project created from Old (1.x) Archetype in dir: /Users/zzhoo8/Project/xhuabu/demo/spouting
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 57.103 s
[INFO] Finished at: 2016-06-19T21:28:41+08:00
[INFO] Final Memory: 15M/157M
[INFO] ------------------------------------------------------------------------
```

## 增加依赖

```bash
➜  spouting vi pom.xml
```

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.xhuabu.spouting</groupId>
    <artifactId>spouting</artifactId>
    <packaging>war</packaging>
    <version>1.0-SNAPSHOT</version>
    <name>spouting Maven Webapp</name>
    <url>http://maven.apache.org</url>
    <dependencies>

        <dependency>
            <groupId>com.jfinal</groupId>
            <artifactId>jfinal</artifactId>
            <version>2.2</version>
        </dependency>
        <dependency>
            <groupId>com.jfinal</groupId>
            <artifactId>jetty-server</artifactId>
            <version>8.1.8</version>
        </dependency>

        <!-- http://mvnrepository.com/artifact/com.mchange/c3p0 -->
        <dependency>
            <groupId>com.mchange</groupId>
            <artifactId>c3p0</artifactId>
            <version>0.9.5.2</version>
        </dependency>

        <!-- http://mvnrepository.com/artifact/mysql/mysql-connector-java -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.39</version>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>3.8.1</version>
            <scope>test</scope>
        </dependency>

        <!-- https://mvnrepository.com/artifact/org.freemarker/freemarker -->
        <dependency>
            <groupId>org.freemarker</groupId>
            <artifactId>freemarker</artifactId>
            <version>2.3.23</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/log4j/log4j -->
        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.17</version>
        </dependency>

    </dependencies>
    <build>
        <finalName>spouting</finalName>
        <pluginManagement>
            <!--配置Jetty-->
            <plugins>
                <plugin>
                    <groupId>org.mortbay.jetty</groupId>
                    <artifactId>maven-jetty-plugin</artifactId>
                </plugin>
            </plugins>
        </pluginManagement>
    </build>
</project>

```

## 完善目录树结构

```bash
├── pom.xml
├── spouting.iml
├── src
│   ├── main
│   │   ├── config
│   │   ├── java
│   │   │   └── com
│   │   │       └── xhuabu
│   │   │           └── spouting
│   │   │               ├── blog
│   │   │               │   ├── BlogController.java
│   │   │               │   ├── BlogInterceptor.java
│   │   │               │   └── BlogValidator.java
│   │   │               ├── common
│   │   │               │   ├── config
│   │   │               │   │   └── DemoConfig.java
│   │   │               │   └── model
│   │   │               │       ├── Blog.java
│   │   │               │       ├── Items.java
│   │   │               │       ├── _DataDictionary.txt
│   │   │               │       ├── _JFinalDemoGenerator.java
│   │   │               │       ├── _MappingKit.java
│   │   │               │       └── base
│   │   │               │           ├── BaseBlog.java
│   │   │               │           └── BaseItems.java
│   │   │               └── index
│   │   │                   └── IndexController.java
│   │   ├── resources
│   │   │   ├── little_config.txt
│   │   │   └── log4j.properties
│   │   └── webapp
│   │       ├── META-INF
│   │       │   └── MANIFEST.MF
│   │       ├── WEB-INF
│   │       │   ├── classes
│   │       │   │   └── xhuabu
│   │       │   │       └── spouting
│   │       │   │           └── common
│   │       │   │               └── model
│   │       │   │                   └── _DataDictionary.txt
│   │       │   └── web.xml
│   │       ├── blog
│   │       │   ├── _form.html
│   │       │   ├── add.html
│   │       │   ├── blog.html
│   │       │   └── edit.html
│   │       ├── common
│   │       │   ├── _layout.html
│   │       │   └── _paginate.html
│   │       ├── css
│   │       │   └── manage.css
│   │       ├── favicon.ico
│   │       ├── img
│   │       │   ├── bg.gif
│   │       │   ├── left2.gif
│   │       │   └── right2.gif
│   │       ├── index
│   │       │   └── index.html
│   │       ├── index.jsp
│   │       └── js
│   │           └── jquery-1.4.4.min.js
│   └── test
│       ├── java
│       │   └── com
│       │       └── xhuabu
│       │           └── spouting
│       └── resources
└── target
    ├── classes
    │   ├── com
    │   │   └── xhuabu
    │   │       └── spouting
    │   │           ├── blog
    │   │           │   ├── BlogController.class
    │   │           │   ├── BlogInterceptor.class
    │   │           │   └── BlogValidator.class
    │   │           ├── common
    │   │           │   ├── config
    │   │           │   │   └── DemoConfig.class
    │   │           │   └── model
    │   │           │       ├── Blog.class
    │   │           │       ├── Items.class
    │   │           │       ├── _JFinalDemoGenerator.class
    │   │           │       ├── _MappingKit.class
    │   │           │       └── base
    │   │           │           ├── BaseBlog.class
    │   │           │           └── BaseItems.class
    │   │           └── index
    │   │               └── IndexController.class
    │   ├── little_config.txt
    │   └── log4j.properties
    ├── generated-sources
    │   └── annotations
    ├── maven-archiver
    │   └── pom.properties
    ├── maven-status
    │   └── maven-compiler-plugin
    │       ├── compile
    │       │   └── default-compile
    │       │       ├── createdFiles.lst
    │       │       └── inputFiles.lst
    │       └── testCompile
    │           └── default-testCompile
    │               └── inputFiles.lst
    ├── spouting
    │   ├── META-INF
    │   ├── WEB-INF
    │   │   ├── classes
    │   │   ├── lib
    │   │   │   ├── c3p0-0.9.5.2.jar
    │   │   │   ├── cglib-nodep-3.1.jar
    │   │   │   ├── javax.servlet-3.0.0.v201112011016.jar
    │   │   │   ├── jetty-continuation-8.1.8.v20121106.jar
    │   │   │   ├── jetty-http-8.1.8.v20121106.jar
    │   │   │   ├── jetty-io-8.1.8.v20121106.jar
    │   │   │   ├── jetty-security-8.1.8.v20121106.jar
    │   │   │   ├── jetty-server-8.1.8.jar
    │   │   │   ├── jetty-server-8.1.8.v20121106.jar
    │   │   │   ├── jetty-servlet-8.1.8.v20121106.jar
    │   │   │   ├── jetty-util-8.1.8.v20121106.jar
    │   │   │   ├── jetty-xml-8.1.8.v20121106.jar
    │   │   │   ├── jfinal-2.2.jar
    │   │   │   ├── mchange-commons-java-0.2.11.jar
    │   │   │   └── mysql-connector-java-5.1.39.jar
    │   │   └── web.xml
    │   └── index.jsp
    ├── spouting.war
    ├── test-classes
    └── work
        └── jsp
            └── org
                └── apache
                    └── jsp
                        └── index_jsp.class
```

## 设置jfinal入口

web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" id="WebApp_ID" version="2.5">
  <filter>
    <filter-name>jfinal</filter-name>
    <filter-class>com.jfinal.core.JFinalFilter</filter-class>
    <init-param>
      <param-name>configClass</param-name>
      <param-value>com.xhuabu.spouting.common.config.DemoConfig</param-value>
    </init-param>
  </filter>

  <filter-mapping>
    <filter-name>jfinal</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
</web-app>
```

## 编译

```bash
➜  spouting mvn clean compile
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building spouting Maven Webapp 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ spouting ---
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ spouting ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ spouting ---
[INFO] Nothing to compile - all classes are up to date
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1.354 s
[INFO] Finished at: 2016-06-19T21:37:19+08:00
[INFO] Final Memory: 9M/245M
[INFO] ------------------------------------------------------------------------
```

## 打包

会先编译

```bash
➜  spouting mvn clean package
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building spouting Maven Webapp 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ spouting ---
[INFO] Deleting /Users/zzhoo8/Project/xhuabu/demo/spouting/target
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ spouting ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ spouting ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ spouting ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ spouting ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ spouting ---
[INFO] 
[INFO] --- maven-war-plugin:2.2:war (default-war) @ spouting ---
[INFO] Packaging webapp
[INFO] Assembling webapp [spouting] in [/Users/zzhoo8/Project/xhuabu/demo/spouting/target/spouting]
[INFO] Processing war project
[INFO] Copying webapp resources [/Users/zzhoo8/Project/xhuabu/demo/spouting/src/main/webapp]
[INFO] Webapp assembled in [60 msecs]
[INFO] Building war: /Users/zzhoo8/Project/xhuabu/demo/spouting/target/spouting.war
[INFO] WEB-INF/web.xml already added, skipping
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 2.086 s
[INFO] Finished at: 2016-06-19T21:38:01+08:00
[INFO] Final Memory: 11M/245M
[INFO] ------------------------------------------------------------------------
```

pom.xml增加jetty插件

```xml
  <build>
    <finalName>spouting</finalName>
      <pluginManagement>
        <!--配置Jetty-->
        <plugins>
          <plugin>
            <groupId>org.mortbay.jetty</groupId>    
            <artifactId>maven-jetty-plugin</artifactId>
          </plugin>
        </plugins>
    </pluginManagement>
  </build>
```

## Jetty运行

```bash
➜  spouting mvn jetty:run
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building spouting Maven Webapp 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] >>> maven-jetty-plugin:6.1.26:run (default-cli) > test-compile @ spouting >>>
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ spouting ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ spouting ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 11 source files to /Users/zzhoo8/Project/xhuabu/demo/spouting/target/classes
[INFO] 
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ spouting ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ spouting ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] <<< maven-jetty-plugin:6.1.26:run (default-cli) < test-compile @ spouting <<<
[INFO] 
[INFO] --- maven-jetty-plugin:6.1.26:run (default-cli) @ spouting ---
[INFO] Configuring Jetty for project: spouting Maven Webapp
[INFO] Webapp source directory = /Users/zzhoo8/Project/xhuabu/demo/spouting/src/main/webapp
[INFO] Reload Mechanic: automatic
[INFO] Classes = /Users/zzhoo8/Project/xhuabu/demo/spouting/target/classes
[INFO] Logging to org.slf4j.impl.SimpleLogger(org.mortbay.log) via org.mortbay.log.Slf4jLog
[INFO] Context path = /spouting
[INFO] Tmp directory =  determined at runtime
[INFO] Web defaults = org/mortbay/jetty/webapp/webdefault.xml
[INFO] Web overrides =  none
[INFO] web.xml file = /Users/zzhoo8/Project/xhuabu/demo/spouting/src/main/webapp/WEB-INF/web.xml
[INFO] Webapp directory = /Users/zzhoo8/Project/xhuabu/demo/spouting/src/main/webapp
[INFO] Starting jetty 6.1.26 ...
[INFO] jetty-6.1.26
[INFO] No Transaction manager found - if your webapp requires one, please configure one.
[INFO] Started SelectChannelConnector@0.0.0.0:8080
[INFO] Started Jetty Server
```

用浏览器访问`http://localhost:8080/spouting/`

若是用idea配合jetty运行，则直接访问`http://localhost:8080`即可