问题描述：使用了线程池，线程池用runable为内部类，内部类调用了外部类加了切面的方法（使用 AopContext.currentProxy() 调用），切面不生效，报如下错误：
<pre>
java.lang.IllegalStateException: Cannot find current proxy: Set 'exposeProxy' property on Advised to 'true' to make it available.
</pre>
已设置 exposeProxy=true，需要确认是切面失效是多线程的问题，还是内部类调用的问题！！！
