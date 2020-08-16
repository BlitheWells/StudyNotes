1. Bootstrap start() 方法
<pre>
  1.1 init(): -- 初始化 catalina 容器
    1. initClassLoaders() -- 初始化 ClassLoader: commonClassLoader, catalinaClassLoader, sharedClassLoader;
    2. 设置当前线程的 ClassLoader 为 catalinaClassLoader;
    3. 通过反射构建 Catalina 实例 （org.apache.catalina.startup.Catalina）;
    4. 设置 Catalina 实例的 ClassLoader 为 sharedClassLoader
  1.2 通过反射调用 catalina 实例的 start 方法
    1 调用 load() 方法
      1.1 createStartDigester() -- 方法，设置 Digester，根据 server.xml 构建 server, Service, Connector 等，设置container的child
      1.2 server 初始化 
        1. service 初始化
          1.1 engine 初始化
          1.2 excutor 线程池初始化，如果有的话，用于connector
          1.3 mapperListener 初始化
          1.4 connector 初始化
            1. CoyoteAdapter 初始化
            2. protocolHandler 初始化
              1.1 endPoint初始化
                1. 绑定端口
     2. 调用 server 的 start() 方法 --》 service的 start() 方法 --》 engine 的start() 方法; engine 会调用子container的start()

</pre>

参考内容：https://blog.csdn.net/c929833623lvcha/article/details/44677569
