## Spring 事务注解 @Transactional 不生效的问题

经查证 Spring 因使用了 Spring AOP 代理的原因，只能在外部类调用时才能生效。解决这个问题的方法是使用 AspectJ 代替Spring AOP 代理。

```java
ClassA:
// 若doSomething()出现异常，doSomeDBThing()中的数据库操作不会回滚。
public void doSomething() {
    doSomeDBThing();
}
@Transactional
public void doSomeDBThing() {
}

ClassB:
// 若doSomeOtherThing()出现异常，doSomeDBThing()中的数据库操作会回滚。
public void doSomeOtherThing() {
    new ClassA().doSomeDBThing();
}

具体参见：
https://www.ibm.com/developerworks/cn/java/j-master-spring-transactional-use/index.html
