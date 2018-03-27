As below configuration, url-pattern is "/rest/*"

If controller mapping define as below, then the request url that will be matched should be /rest/service/test

```java
@RequestMapping("service")
public class SimpleController {
  
  @RequestMapping("test")
  public Object test() {
  }
}
```

```xml
<servlet>
  <servlet-name>aServlet</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:spring.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
  <servlet-name>aServlet</servlet-name>
  <url-pattern>/rest/*</url-pattern>
</servlet-mapping>
```

#### The point is that url-pattern should not be the part of request mapping, request mapping should append to url-pattern.
