Spring 中的循环依赖问题

类 A 中引用 B，B 中引用 A

一般流程
1. 实例化 A 的原始 bean；
2. 设置 A 中的属性 B 时， 会去实例化 B，然后设置 B 的 A 属性，此时拿到的是 A 的 earlyReference；
3. 然后会调用 exposedObject = initializeBean(beanName, exposedObject, mbd); 获取 A 的暴露对象，需要走代理的暴露的就是代理对象；
4. 对于暴露对象和原始 bean 不一致的情况，会去检查所有 A 的循环依赖的对象有没有已完成创建的，已完成的说明 A 的引用不会再被更新，有这种对象就会有问题，会抛异常；


对于加了 @Async 的对象，上面第三步获取的暴露对象和 bean 就会有不一致的情况



> https://blog.csdn.net/f641385712/article/details/92797058
