
Springboot 项目启动时报错：
```java
Field aService in com.xxxx.BServiceImpl required a single bean, but 2 were found:
	- aServiceImpl: defined in file [AServiceImpl.class]
	- aService: defined in file [AService.class]

// 问题的根源是Mybatis的配置中，包被扫描了两次，一次在xml中由springboot 扫描并加载了带Component注解的实现类，
// 一次是 @MapperScan 的扫描指定包下的接口，并实现了接口的代理类，从而造成了有两个bean实例的情况
// 需要关注一下 @MapperScan 是如何实现的
@Configuration
@ImportResource("classpath:spring/spring-dao.xml")
@MapperScan(basePackages="com.xxxx.orm")
public class MybatisDataSourceConfig {

}

public interface AService {}

@Component
public class AServiceImpl implements AService {}

@Component
public class BServiceImpl {
  @Autowired
  private AService aService;
}
```
