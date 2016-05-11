 # Falcor

> 翻译http://netflix.github.io/falcor/

Falcor
一个高效的数据获取js库

## 任何时候只有一个模型

通过“虚拟JSON图”的机制，Falcor将所有服务端数据源表示成一个可管理的模型。不论数据在客户端的内存中，还是在服务器需要网络请求，写出的代码都是一样的逻辑。

## 数据就是API

当你需要访问或多或少的数据时，使用类似js路径的语法使访问变得更简单。取数据使用大家熟悉的js操作，例如get、set、call。当你知道了数据，你就知道了API。

## 和云端绑定

Falcor自动遍历图中的数据引用，需要的时候发出请求。Falcor处理所有网络通信对用户透明，适时地批处理请求。

## 起步

你现在可以检出一个范例服务器代码，实现一个类似Netflix的应用。交替地，你可以学习要点教程，在这个教程里，我们使用Flacor路由来创建虚拟的JSON资源。在教程中，我们将使用Flacor提供的高效地中间件来管理应用服务器URL（如/model.json）中的虚拟JSON资源，同时我们也会在应用服务器上放置一个静态页面，静态页面中的数据取自虚拟JSON资源。

## 创建虚拟JSON资源

我们使用Falcor路由创建虚拟JSON资源，位于应用服务器的/model.json。JSON资源包括以下内容：

```json
{
  "greeting": "Hello World"
}
```

通常Router从后端数据仓库或其他web服务中获取数据。在这个简单地教程中，Router返回只有1个key的静态数据。

首先，我们创建为我们的应用服务器创建一个目录

```bash
mkdir falcor-app-server
cd falcor-app-server
npm init
```

现在安装falcor的Router

```bash
npm install falcor-router --save
```

然后安装express和falcor-express。

```bash
npm install express --save
npm install falcor-express --save
```

轮到创建index.js了:

```javascript
// index.js
var falcorExpress = require('falcor-express');
var Router = require('falcor-router');

var express = require('express');
var app = express();

app.use('/model.json', falcorExpress.dataSourceRoute(function (req, res) {
  // create a Virtual JSON resource with single key ("greeting")
  return new Router([
    {
      // match a request for the key "greeting"    
      route: "greeting",
      // respond with a PathValue with the value of "Hello World."
      get: function() {
        return {path:["greeting"], value: "Hello World"};
      }
    }
  ]);
}));

// serve static files from current directory
app.use(express.static(__dirname + '/'));

var server = app.listen(3000);
```

运行这个服务器，监听3000端口和/model.json的请求

```javascript
node index.js
```

## 从虚拟JSON资源里获取数据

创建一个简单地虚拟JSON文档，这个数据结构有一个只读属性"greeting"。之后再创建一个测试网页，从服务器获取这个key。

index.html内容如下：

```html
<!-- index.html -->
<html>
  <head>
    <!-- Do _not_  rely on this URL in production. Use only during development.  -->
    <script src="//netflix.github.io/falcor/build/falcor.browser.js"></script>
    <script>
      var model = new falcor.Model({source: new falcor.HttpDataSource('/model.json') });
      
      // retrieve the "greeting" key from the root of the Virtual JSON resource
      model.
        get("greeting").
        then(function(response) {
          document.write(response.json.greeting);
        });
    </script>
  </head>
  <body>
  </body>
</html>
```

现在打开浏览器访问`http://localhost:3000/index.html`，你将会看到服务器返回的信息



