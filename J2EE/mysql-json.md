1. MySQL 建表时可以设置字段为 JSON 格式，然后该字段可以保存为 JSON 文档。
2. 可以通过创建虚拟列来将 JSON 中的字段作为一列来查询。
3. MySQL JSON 格式列中文乱码的问题，升级一下 MySQL 的 jdbc 版本即可解决：
```xml
  <dependency>
  <groupId>mysql</groupId>
  <artifactId>mysql-connector-java</artifactId>
  <version>5.1.40</version>
  </dependency>
```
