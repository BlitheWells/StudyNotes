## Jackson Converter ignore unknow properties
-- Anontation version:
```java
ObjectMapper mapper = new ObjectMapper();
mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
```
-- XML version:
```xml
<!-- Jackson Mapper -->
<bean id="jacksonObjectMapper" class="org.codehaus.jackson.map.ObjectMapper" />
<bean class="org.springframework.beans.factory.config.MethodInvokingFactoryBean">
    <property name="targetObject" ref="jacksonObjectMapper" />
    <property name="targetMethod" value="configure" />
    <property name="arguments">
        <list>
            <value type="com.fasterxml.jackson.databind.DeserializationFeature">FAIL_ON_UNKNOWN_PROPERTIES</value>
            <value>false</value>
        </list>
    </property>
</bean>


<bean id="restTemplate" class="org.springframework.web.client.RestTemplate">
    <property name="messageConverters">
        <list>
            <bean class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter">
                <property name="objectMapper" ref="jacksonObjectMapper" />
            </bean>
        </list>
    </property>
</bean>
```
