# 解决excel打开csv文件乱码

## 解决命令

```bash
vi financy_flow_done.txt
:set fileencoding

➜  ~ iconv -f UTF8 -t GB18030 financy_flow_done.txt > b.csv
```


## 参考

* [Excel导入CSV文件中文乱码](http://www.dcharm.com/?p=8,)
