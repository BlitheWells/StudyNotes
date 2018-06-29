#### 1. Mapper Dao 中若果有多个参数，要映射到注解中，需要在参数上添加 @Param("paramName") 注解。
```java
example:
@Select("select * from aTable where field1=${p1} and field2=#{p2}")
public aMethod(@Param("p1) String firstParam, @Param("p2") String secondParam);
```

#### 2. 批量插入的写法：
```java
@Insert({
"<script>",
"insert into a_table (a, b, c) values ",
"<foreach collection='aList' item='aObj' separator=','>",
"( #{aObj.a, jdbcType=VARCHAR}, #{aObj.b}, #{aObj.c} )",
"</foreach>"
"</script>"
})
int insertBatch(@Param("aList") List<TestObject> aList);

```
