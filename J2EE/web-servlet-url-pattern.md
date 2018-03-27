As below configuration, url-pattern is "/rest/*"

If controller mapping define as below, 
then the correct request url should be /rest/rest/test (url-pattern + RequestMapping), 
not /rest/test, RequestMapping will not be count to match url-pattern



```java
@RequestMapping("rest")
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
#### The point is that request url should be url-pattern + reqest-mapping-path as below:
```
Request url: http://hostname:port/${url-pattern}/${RequestMapping-defined-on-class}/${RequestMapping-defined-on-method}
```
