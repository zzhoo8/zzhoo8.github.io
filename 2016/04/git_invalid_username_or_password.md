# Git仓库密码错误的解决方法

> 在bitbucket上新建了一个仓库，但是git clone是遇到了用户名和密码不匹配的问题

## 问题

```bash
➜  Project git clone https://zzhoo8@bitbucket.org/zzhoo8/moses.git
Cloning into 'moses'...
remote: Invalid username or password. If you log in via a third party service you must ensure you have an account password set in your account profile.
fatal: Authentication failed for 'https://zzhoo8@bitbucket.org/zzhoo8/moses.git/'
```

## 解决

```bash
➜  Project git config --list
user.name=zzhoo8
user.email=zhaozhenhua@itianpin.com
core.excludesfile=/Users/zzhoo8/.gitignore_global
difftool.sourcetree.cmd=opendiff "$LOCAL" "$REMOTE"
difftool.sourcetree.path=
mergetool.sourcetree.cmd=/Applications/SourceTree.app/Contents/Resources/opendiff-w.sh "$LOCAL" "$REMOTE" -ancestor "$BASE" -merge "$MERGED"
mergetool.sourcetree.trustexitcode=true
filter.lfs.clean=git lfs clean %f
filter.lfs.smudge=git lfs smudge %f
filter.lfs.required=true
```

修改`.gitconfig`文件

```bash
➜  moses git:(master) vi ~/.gitconfig
```

```bash
[user]
        name = zzhoo8
        email = zhaozhenhua@qq.com
[core]
        excludesfile = /Users/zzhoo8/.gitignore_global
[difftool "sourcetree"]
        cmd = opendiff \"$LOCAL\" \"$REMOTE\"
        path =
[mergetool "sourcetree"]
        cmd = /Applications/SourceTree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
        trustExitCode = true
[filter "lfs"]
        clean = git lfs clean %f
        smudge = git lfs smudge %f
        required = true
```

继续拉取，并按照提示输入密码即可

```bash
➜  Project git clone https://zzhoo8@bitbucket.org/zzhoo8/moses.git
Cloning into 'moses'...
Password for 'https://zzhoo8@bitbucket.org': 
warning: You appear to have cloned an empty repository.
Checking connectivity... done.
```
