和合作方文件交互使用sftp, 主要是文件上传, 运行中发现下行流量满载，但实际上没有文件下载的情况，根据排查发现sftp工具类判断文件是否存在时用了 ls 命令，ls会列出当前目录下所有文件， 然后再根据列表搜索是否有需要传输的文件，ls 这个数据量就很大了， 引起下行流量被占用的情况。较合适的做法是，先尝试下载需要上传的文件， 若下载失败，说明文件不存在，文件下载成功说明文件存在。

问题代码：
```java
public boolean existFile(String name) {
        return this.exist(this.lsFiles(), name);
}
```
