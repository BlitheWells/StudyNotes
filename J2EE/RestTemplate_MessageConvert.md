#### 使用 RestTemplate 发送请求，request是JSON字符串，response也是JSON字符串时报一下错误
> Can not deserialize instance of java.lang.String out of START_OBJECT

经过调试发现问题，在 spring.xml 中 RestTemplate 的配置如下：
```xml
<bean name="restTemplate" class="org.springframework.web.client.RestTemplate">
	<property name="messageConverters">
		<list>
			<bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter" />
			<bean class="org.springframework.http.converter.StringHttpMessageConverter" />
		</list>
	</property>
</bean>
```
如果把配置改成下面这样，就不会报错
```xml
<bean name="restTemplate" class="org.springframework.web.client.RestTemplate">
```
此时同事做了进一步假设，如果把 converter 的顺序换一下，如下，也不会报错
```xml
<bean name="restTemplate" class="org.springframework.web.client.RestTemplate">
	<property name="messageConverters">
		<list>
      			<bean class="org.springframework.http.converter.StringHttpMessageConverter" />
			<bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter" />
		</list>
	</property>
</bean>
```
因此得出结论，RestTemplate 会默认使用第一个 Converter 去 convert 数据，所以本来应该 StringHttpMessageConverter 来处理的数据
被其他 Converter 处理时报错。

暂时先探究到这里，后续可以深入理解一下 RestTemplate 对 message 的 convert 逻辑。

关于Convert的一个不错的文章：
https://www.ibm.com/developerworks/cn/web/wa-restful/index.html
