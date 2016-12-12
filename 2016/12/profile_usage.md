# 需要默认生效的命令应该添加到哪里

```
bashrc与profile的区别
要搞清bashrc与profile的区别，首先要弄明白什么是交互式shell和非交互式shell，什么是login shell 和non-login shell。
交互式模式就是shell等待你的输入，并且执行你提交的命令。这种模式被称作交互式是因为shell与用户进行交互。这种模式也是大多数用户非常熟悉的：登录、执行一些命令、签退。当你签退后，shell也终止了。 shell也可以运行在另外一种模式：非交互式模式。在这种模式下，shell不与你进行交互，而是读取存放在文件中的命令,并且执行它们。当它读到文件的结尾，shell也就终止了。
bashrc与profile都用于保存用户的环境信息，bashrc用于交互式non-loginshell，而profile用于交互式login shell。系统中存在许多bashrc和profile文件，下面逐一介绍：
/etc/pro此文件为系统的每个用户设置环境信息,当第一个用户登录时,该文件被执行.
并从/etc/profile.d目录的配置文件中搜集shell的设置.
/etc/bashrc:为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取。有些linux版本中的/etc目录下已经没有了bashrc文件。
~/. pro每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该
文件仅仅执行一次!默认情况下,它设置一些环境变量,然后执行用户的.bashrc文件.
~/.bashrc:该文件包含专用于某个用户的bash shell的bash信息,当该用户登录时以及每次打开新的shell时,该文件被读取.
另外,/etc/profile中设定的变量(全局)的可以作用于任何用户,而~/.bashrc等中设定的变量(局部)只能继承/etc/profile中的变量,他们是"父子"关系.





/etc/profile:此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.并从/etc/profile.d目录的配置文件中搜集shell的设置.

英文描述为：

# /etc/profile

# System wide environment and startup programs, for login setup
# Functions and aliases Go in /etc/bashrc

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

所以如果你有对/etc/profile有修改的话必须得重启你的修改才会生效，此修改对每个用户都生效。
/etc/bashrc:为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取.

英文描述为：

# /etc/bashrc

# System wide functions and aliases
# Environment stuff goes in /etc/profile

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

如果你想对所有的使用bash的用户修改某个配置并在以后打开的bash都生效的话可以修改这个文件，修改这个文件不用重启，重新打开一个bash即可生效。
~/.bash_profile:每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件.

此文件类似于/etc/profile，也是需要需要重启才会生效，/etc/profile对所有用户生效，~/.bash_profile只对当前用户生效。

~/.bashrc:该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该文件被读取.（每个用户都有一个.bashrc文件，在用户目录下）

此文件类似于/etc/bashrc，不需要重启生效，重新打开一个bash即可生效，  /etc/bashrc对所有用户新打开的bash都生效，但~/.bashrc只对当前用户新打开的bash生效。

~/.bash_logout:当每次退出系统(退出bash shell)时,执行该文件.

另外,/etc/profile中设定的变量(全局)的可以作用于任何用户,而~/.bashrc等中设定的变量(局部)只能继承/etc/profile中的变量,他们是"父子"关系.

~/.bash_profile 是交互式、login 方式进入bash 运行的；
~/.bashrc 是交互式 non-login 方式进入bash 运行的；
通常二者设置大致相同，所以通常前者会调用后者。
```

* [ /etc/profile 和 ~/.profile 区别是全部用户，和单一用户](http://blog.csdn.net/u013176681/article/details/50761135)
