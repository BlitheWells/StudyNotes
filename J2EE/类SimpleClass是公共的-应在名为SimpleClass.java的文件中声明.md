项目在 windows 系统下的 idea 中编译正常，在 Jenkins 服务器上编译报如下错误
-
```
  错误：类 AsimpleClass 是公共的，应在名为 AsimpleClass.java 的文件中声明
```

网上搜了一下，一般情况下是类名和类文件名不一致造成的，但是从 idea 里面看到文件名和类名是一致的。
在 windows 下打开文件目录也只能看到一个文件。

有一个特殊的现象是，如果修改 AsimpleClass.java ，在 git 提交时会有两个同名的文件有改动，怀疑是文件改过文件名的大小写。
在 gitlab 的页面上打开文件目录，发现有两个文件，只是大小写的区别，直接在 gitlab 上删除，再次在 Jenkins 中编译后问题解决。
```
AsimpleClass.java
ASimpleClass.java
```

总结：
-
1. 不要随便改文件名的大小写
2. 如果真的要改大小写，可以考虑先备份文件后删除文件，push到远端，再将备份的文件copy回去，再次提交
3. windows 下文件不区分大小写，所以文件名只是大小写不同的文件，从 git 拉下来时要注意是否有问题，尤其不能再同一目录下。
