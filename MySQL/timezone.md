用以下语句获取 MySQL 的 timezone：

```sql
show variables like '%time_zone%'
```

variable_name|value
-------- | --------
system_time_zone	|CST
time_zone	|SYSTEM

CST 不是China Standard Time，是美国标准时间

改时区的几种方式

1. 更改会话中的时区
```sql
set global time_zone = '+8:00';
set time_zone = '+8:00';
flush privileges;
```

2. 修改my.cnf配置文件，需要重启数据库
```
# vim /etc/my.cnf  在[mysqld]区域中加上
default-time_zone = '+8:00'
```

3. 连接字符串上添加以下参数
```
serverTimezone=Asia/Shanghai
```
