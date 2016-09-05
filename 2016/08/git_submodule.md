# Git Submodule研究

>

## 问题

用一份iOS的代码提交到新建的git仓库，发现死活提交不上去，提示如下

```bash
➜  hakusan git:(master) git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)

	modified:   badu8 (untracked content)

no changes added to commit (use "git add" and/or "git commit -a")
➜  hakusan git:(master)
➜  hakusan git:(master) git commit -a
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
	modified:   badu8 (untracked content)

no changes added to commit
```

## 问题解决

使用命令`git rm --cached badu8`删除对目录`badu8`的版本控制，然后再重新提交即可

```bash
➜  hakusan git:(master) git submodule
No submodule mapping found in .gitmodules for path 'badu8'
➜  hakusan git:(master) vi .git/config
➜  hakusan git:(master) git rm --cached badu8      
rm 'badu8'
➜  hakusan git:(master) ✗ ls
README.md badu8
➜  hakusan git:(master) ✗ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	deleted:    badu8

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	badu8/

➜  hakusan git:(master) ✗ git commit -a
[master 6af187d] 删除
 1 file changed, 1 deletion(-)
 delete mode 160000 badu8
 ➜  hakusan git:(master) ✗ git add --all
git%                                                                                                                                                                          ➜  hakusan git:(master) ✗ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   badu8/FanweiSDK/FWPay.h
	new file:   badu8/FanweiSDK/FWPayManager.h
    ...
```

## 参考

* [如何删除git submodule子项](http://zhidao.baidu.com/link?url=6mbGCmtn9W6vLQndZFqPcuanEt5JBJCe_CbNCV-7OqqQ1wsPdCZP-pYlpoc4xVLcTyC1NuClYefaLF0ar_TvmQF78Zn94MTAryu5ShFO15q)
