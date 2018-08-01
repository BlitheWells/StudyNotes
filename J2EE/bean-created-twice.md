在做一个 Spring MVC 的项目迁移的时候，启动容器一直会报异常。

> java.lang.RuntimeException: xxx-job jobhandler naming conflicts.

很明显是名字冲突了，顺着异常代码找到该类的配置，异常发生在 bean 加载时调用的 init-method 方法 start 里面
```xml
<bean id="xxx" class="com.xxx.Xlass" init-method="start" destroy-method="destroy" >
......
<bean>
```
由于实例化的类是第三方jar包中的类，无法看到源代码，调试的时候就不是很方便。
经过反编译的代码分析，Xlass 的start方法维护了一个 static 的 ConcurrentHashMap，然后会把其他一些有特殊 anotation 的类注册到这个 Map 中。
注册前先在 Map 中取对应key的值，如果能拿到就抛出异常，按照这个代码逻辑，初步判断该类的start方法被调用了两次，造成类被重复注册。

查看web.xml 的配置有如下部分
```xml
 <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>
			classpath*:spring/spring.xml
		</param-value>
  </context-param>
  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  <servlet>
    <servlet-name>ppdServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
     <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>classpath*:spring/spring.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
```
容器的 context 配置文件地址和 spring 的 DispatcherServlet 的配置文件地址是一致的，项目一直这样配置没有什么问题，但是这样配置十分可疑，
于是将 spring.xml 文件拆分为两部分，spring-servlet.xml 和 spring.xml, spring-servlet.xml 中只有需要加载的 servlet 相关的，
以及 Xlass， spring.xml 中为所有其他的配置。经过这样修改后启动容器，不再报错，问题解决。
所以上面那样配置 web.xml，实例很可能被加载两次，在真实的调用过程中是否会被执行两次不知道，这个还需要验证。
