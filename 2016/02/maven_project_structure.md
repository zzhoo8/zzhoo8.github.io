# Maven工程的目录结构

| 目录 | 含义 |
|:----:|:----:|
| porn.xml | maven的工程描述文件 |
| src | 源代码目录 |
| src/main | 项目根目录 |
| src/main/java | 项目java源代码文件目录 |
| src/main/resources | 项目资源文件目录，会自动复制到class文件夹 |
| src/main/filters | 项目资源过滤文件目录 |
| src/main/config | 项目配置文件目录 |
| src/main/webapp | 项目web应用的目录（WEB-INF, js, css等） |
| src/test | 项目测试根目录 |
| src/test/java | 项目测试java源代码目录 |
| src/test/resources | 项目测试资源文件目录 |
| src/assembly | 项目组件的描述配置 |
| target | 项目构建后的目录 |
| LICENSE.txt | 项目许可证 |
| README.md | 项目文字介绍 |

## netty-sprintMVC业务目录

| 目录 | 含义 |
|:----:|:----:|
| src/main/java/com/bluestone/beryl | 项目java代码主要目录 |
| src/main/java/com/bluestone/beryl/netty | netty的处理流水线和过滤器 |
| src/main/java/com/bluestone/beryl/Main.java | 项目执行入口 |
| src/main/java/com/bluestone/beryl/utils | 项目工具类 |
| src/main/java/com/bluestone/beryl/views | 视图层 |
| src/main/java/com/bluestone/beryl/controllers | 控制器层 |
| src/main/java/com/bluestone/beryl/models | 模型层 |

## 参考

* [Maven项目的目录结构](http://www.tuicool.com/articles/BVZRfuz)
* [7天学会Maven（第二天——Maven 标准目录结构）](http://www.cnblogs.com/haippy/archive/2012/07/05/2577233.html)
* [Maven的标准目录结构](http://blog.sina.com.cn/s/blog_698f90230100vqri.html)
* [Introduction to the Standard Directory Layout](http://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html)

