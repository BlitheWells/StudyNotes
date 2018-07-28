#### Learn maven

分析管理maven依赖：

1. 列出所有依赖
```
  mvn dependency:list
```

2. 以树的形式列出所有依赖
```
  mvn dependency:tree
```

3. 分析依赖，列出没有用到的，和间接依赖
```
  mvn dependency:analyze
```
