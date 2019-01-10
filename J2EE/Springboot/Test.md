之前一直不知道怎么在 Springboot 环境下写测试用例，一直怀疑是不是需要些很多配置文件如 spring.xml 来注入很多 bean 才能进行测试。事实证明是我多虑了，如果注解设置为 Springboot 的启动主类，会像启动应用一样加载所有的需要的 bean 。
     
#### 1. 添加测试依赖。
     
 ```xml
         <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
        </dependency>
 ```
 #### 2. 编写测试类，并添加如下两个注解。
    
 ```java
    /**
     * RunWith 是 Junit 用来指定测试用例运行器的注解，如果不指定 Junit 有默认的运行器。
     * 这里用的是Spring 的运行器，SpringRunner
     */
    @RunWith(SpringRunner.class)
    /**
     * 该注解的作用详见地址：https://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/test/context/SpringBootTest.html
     * 1. Uses SpringBootContextLoader as the default ContextLoader when no specific @ContextConfiguration(loader=...) is defined.
     * 2. Automatically searches for a @SpringBootConfiguration when nested @Configuration is not used, and no explicit classes are specified.
     * 3. Allows custom Environment properties to be defined using the properties attribute.
     * 4. Provides support for different webEnvironment modes, including the ability to start a fully running web server listening on a defined or random port.
     * 5. Registers a TestRestTemplate and/or WebTestClient bean for use in web tests that are using a fully running web server.
     */
    @SpringBootTest(classes=BbcarApplication.class)
 ```
 
   #### 3. 注入测试类，并编写测试用例
   
