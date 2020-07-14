Spring 中的 XXXAware 都实现了 Aware 接口，这是个空接口，spring中实现该接口的接口都是一些环境信息，以另一种注入方式注入到需要的bean中。

例如：
EnvironmentAware
ApplicationContextAware

Spring 项目启动时会忽略这些类实例的注入，而是使用通知接口的 setXXX 方法去设置对应的实例。

我们通常会实现 ApplicationContextAware 接口， 来获取当前的 applicationContext
