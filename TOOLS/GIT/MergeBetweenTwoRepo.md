#### 合并两个库的方法
###### 本地库路径如下

```
./sourceRepo
  `master
  `branch1
./targetRepo
  `master
  `branch1
```
1.切到目标库 targetRepo 所在路径 ./targetRepo

2.将源库 sourceRepo 设置成目标库 targetRepo 的一个remote库
```bash
git remote add sourceRepo ../sourceRepo/
```
第一个参数为自定义的名称，第二个参数为源库相对命令运行目录，也可以写成绝对路径
添加成功可以用命令 git remote 来查看添加的远程库
```bash
git remote -v 显示克隆地址
```

3.拉取sourceRepo的分支，这时候源库的分支都会被作为远程分支拉取到本地
```bash
git fetch sourceRepo
```

4.Checkout 需要的源分支，例如 remotes/sourceRepo/master
```bash
git checkout -b sourceBranch sourceRepo/master
```

5.切换回目标分支，例如 master
```bash
git checkout master
```

6.合并 sourceBranch 到当前分支 master 
```bash
git merge sourceBranch
```

7.最后删除添加的remote库
```bash
git remote rm sourceRepo
```

过程中可以使用 git branch -a 来一直查看分支的状态
