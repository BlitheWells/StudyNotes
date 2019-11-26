#### 深入理解 git


修改已经提交到远端库的 commit message 的方法
--

### 基本思路

1. 使用交互式 rebase 把之前本地的 commit message 改写
    <pre>
        git rebase -i head~6
           
        //后将对应commit message 前的 pick 改为 r
        //然后保存，commint message 就被修改了
    </pre>
    
2. 删除远端分支
    <pre>
        git push origin :Branch_name
    </pre>

3. push 本地分支到远端，重建远端分支
    <pre>
        git push origin Branch_name
    </pre>


可参考文章：
[Git-Tools-Rewriting-History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)
